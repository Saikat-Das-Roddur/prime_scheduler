import 'dart:async';

import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/add_schedule_repository.dart';

class AddScheduleBloc{
  late AddScheduleRepository _repository;
  late StreamController<Response<dynamic>> _addScheduleStreamController;
  late StreamController<Response<Employees>> _getEmployeesStreamController;

  StreamSink<Response<dynamic>> get addScheduleSink =>
      _addScheduleStreamController.sink;

  Stream<Response<dynamic>> get addEmployeeStream =>
      _addScheduleStreamController.stream;

  StreamSink<Response<Employees>> get getEmployeesSink =>
      _getEmployeesStreamController.sink;

  Stream<Response<Employees>> get getEmployeesStream =>
      _getEmployeesStreamController.stream;

  AddScheduleBloc() {
    _repository = AddScheduleRepository();
    _addScheduleStreamController = StreamController<Response<dynamic>>();
    _getEmployeesStreamController = StreamController<Response<Employees>>();
  }

  Future<dynamic> addSchedule(Map body) async {
    addScheduleSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.addSchedule(body: body);
      addScheduleSink.add(Response.completed(response));
      return response;
    }catch(e){
      addScheduleSink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<Employees?> searchEmployees(Map map) async {
    getEmployeesSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.searchEmployees(map);
      getEmployeesSink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      getEmployeesSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _addScheduleStreamController.close();
    _getEmployeesStreamController.close();
  }
}