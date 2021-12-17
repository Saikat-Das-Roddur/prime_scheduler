import 'dart:async';

import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/schedules.dart';
import 'package:prime_scheduler/repositories/add_schedule_repository.dart';
import 'package:prime_scheduler/repositories/clock_in_out_repository.dart';
import 'package:prime_scheduler/repositories/clock_out_repository.dart';
import 'package:prime_scheduler/repositories/schedules_repository.dart';
class ClockInOutBloc{
  late ClockInOutRepository _repository;
  late StreamController<Response<Schedules>> _schedulesStreamController;
  StreamSink<Response<Schedules>> get schedulesSink =>
      _schedulesStreamController.sink;

  Stream<Response<Schedules>> get schedulesStream =>
      _schedulesStreamController.stream;

  ClockInOutBloc(){
    _repository = ClockInOutRepository();
    _schedulesStreamController = StreamController<Response<Schedules>>.broadcast();
  }

  Future<Schedules?> getSchedules(String? employeeId, String date) async {
    schedulesSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.getSchedules(employeeId, date);
      schedulesSink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      schedulesSink.add(Response.error(e.toString()));
      return null;
    }
  }
}