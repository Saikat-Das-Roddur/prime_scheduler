import 'dart:async';

import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/employee_history_repository.dart';
class EmployeeHistoryBloc {

  late EmployeeHistoryRepository _repository;
  late StreamController<Response<History>> _getEmployeeHistoryStreamController;

  StreamSink<Response<History>> get getEmployeeHistorySink =>
      _getEmployeeHistoryStreamController.sink;

  Stream<Response<History>> get getEmployeeHistoryStream =>
      _getEmployeeHistoryStreamController.stream;

  EmployeeHistoryBloc(){
    _repository = EmployeeHistoryRepository();
    _getEmployeeHistoryStreamController = StreamController<Response<History>>();
  }

  Future<History?> getEmployeeHistory(Map<String,dynamic> map) async {
    getEmployeeHistorySink.add(Response.loading(''));
    try{
      dynamic response = await _repository.getEmployeeHistory(map);
      getEmployeeHistorySink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      getEmployeeHistorySink.add(Response.error(e.toString()));
      return null;
    }
  }
}
