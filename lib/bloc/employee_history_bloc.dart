import 'dart:async';

import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/employee_history_repository.dart';

class EmployeeHistoryBloc {
  late EmployeeHistoryRepository _repository;
  late StreamController<Response<History>> _getEmployeesHistoryStreamController;
  late StreamController<Response<History>> _getEmployeeHistoryStreamController;

  StreamSink<Response<History>> get getEmployeesHistorySink =>
      _getEmployeesHistoryStreamController.sink;

  Stream<Response<History>> get getEmployeesHistoryStream =>
      _getEmployeesHistoryStreamController.stream;

  StreamSink<Response<History>> get getEmployeeHistorySink =>
      _getEmployeeHistoryStreamController.sink;

  Stream<Response<History>> get getEmployeeHistoryStream =>
      _getEmployeeHistoryStreamController.stream;

  EmployeeHistoryBloc() {
    _repository = EmployeeHistoryRepository();
    _getEmployeesHistoryStreamController =
        StreamController<Response<History>>();
    _getEmployeeHistoryStreamController =
        StreamController<Response<History>>();
  }

  Future<History?> getEmployeesHistory(Map<String, dynamic> map) async {
    getEmployeesHistorySink.add(Response.loading(''));
    try {
      dynamic response = await _repository.getEmployeesHistory(map);
      getEmployeesHistorySink.add(Response.completed(response));
      return response;
    } catch (e) {
      print(e.toString());
      getEmployeesHistorySink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<History?> getEmployeeHistory(Map<String, dynamic> map) async {
    getEmployeeHistorySink.add(Response.loading(''));
    try {
      dynamic response = await _repository.getEmployeeHistory(map);
      getEmployeeHistorySink.add(Response.completed(response));
      return response;
    } catch (e) {
      print(e.toString());
      getEmployeeHistorySink.add(Response.error(e.toString()));
      return null;
    }
  }
}
