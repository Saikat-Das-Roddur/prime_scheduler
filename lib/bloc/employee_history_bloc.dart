import 'dart:async';

import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/employee_history_repository.dart';
class EmployeeHistoryBloc {

  late EmployeeHistoryRepository _repository;
  late StreamController<Response<Employees>> _getEmployeesStreamController;

  StreamSink<Response<Employees>> get getEmployeesSink =>
      _getEmployeesStreamController.sink;

  Stream<Response<Employees>> get getEmployeesStream =>
      _getEmployeesStreamController.stream;

  EmployeeHistoryBloc(){
    _repository = EmployeeHistoryRepository();
    _getEmployeesStreamController = StreamController<Response<Employees>>();
  }

  Future<Employees?> getEmployees(String? adminId) async {
    getEmployeesSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.getEmployees(adminId);
      getEmployeesSink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      getEmployeesSink.add(Response.error(e.toString()));
      return null;
    }
  }
}
