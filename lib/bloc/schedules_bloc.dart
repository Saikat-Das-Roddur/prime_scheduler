import 'dart:async';

import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/schedules.dart';
import 'package:prime_scheduler/repositories/add_schedule_repository.dart';
import 'package:prime_scheduler/repositories/schedules_repository.dart';
class SchedulesBloc{
  late SchedulesRepository _repository;
  //late StreamController<Response<dynamic>> _addScheduleStreamController;
  late StreamController<Response<Schedules>> _schedulesStreamController;

  // StreamSink<Response<dynamic>> get addScheduleSink =>
  //     _addScheduleStreamController.sink;
  //
  // Stream<Response<dynamic>> get addEmployeeStream =>
  //     _addScheduleStreamController.stream;

  StreamSink<Response<Schedules>> get schedulesSink =>
      _schedulesStreamController.sink;

  Stream<Response<Schedules>> get schedulesStream =>
      _schedulesStreamController.stream;

  SchedulesBloc() {
    _repository = SchedulesRepository();
    //_addScheduleStreamController = StreamController<Response<dynamic>>();
    _schedulesStreamController = StreamController<Response<Schedules>>();
  }
  //
  // Future<dynamic> addSchedule(Map body) async {
  //   addScheduleSink.add(Response.loading(''));
  //   try{
  //     dynamic response = await _repository.addSchedule(body: body);
  //     addScheduleSink.add(Response.completed(response));
  //     return response;
  //   }catch(e){
  //     addScheduleSink.add(Response.error(e.toString()));
  //     return null;
  //   }
  // }

  Future<Schedules?> getSchedules(String? adminId, String date) async {
    schedulesSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.getSchedules(adminId, date);
      schedulesSink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      schedulesSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _schedulesStreamController.close();
  }
}