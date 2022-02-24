import 'dart:async';

import 'package:prime_scheduler/models/attendences.dart';
import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/schedules.dart';
import 'package:prime_scheduler/repositories/add_schedule_repository.dart';
import 'package:prime_scheduler/repositories/clock_in_out_repository.dart';
import 'package:prime_scheduler/repositories/clock_out_repository.dart';
import 'package:prime_scheduler/repositories/schedules_repository.dart';
class ClockInOutBloc{
  late ClockInOutRepository _repository;
  late StreamController<Response<Schedules>> _schedulesStreamController;
  late StreamController<Response<Attendances>> _attendanceStreamController;
  late StreamController<Response<Schedules>> _monthlySchedulesStreamController;
  StreamSink<Response<Schedules>> get schedulesSink =>
      _schedulesStreamController.sink;

  Stream<Response<Schedules>> get schedulesStream =>
      _schedulesStreamController.stream;

  StreamSink<Response<Schedules>> get monthlySchedulesSink =>
      _monthlySchedulesStreamController.sink;

  Stream<Response<Schedules>> get monthlySchedulesStream =>
      _monthlySchedulesStreamController.stream;

  StreamSink<Response<Attendances>> get attendancesSink =>
      _attendanceStreamController.sink;

  Stream<Response<Attendances>> get attendancesStream =>
      _attendanceStreamController.stream;

  ClockInOutBloc(){
    _repository = ClockInOutRepository();
    _schedulesStreamController = StreamController<Response<Schedules>>.broadcast();
    _attendanceStreamController = StreamController<Response<Attendances>>.broadcast();
    _monthlySchedulesStreamController = StreamController<Response<Schedules>>.broadcast();
  }

  Future<Schedules?> getSchedules(String? employeeId, String? type, String date) async {
    schedulesSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.getSchedules(employeeId,type, date);
      schedulesSink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      schedulesSink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<Attendances?> getAttendances(String? employeeId, String date) async {
    attendancesSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.getEmployeeAttendance(employeeId, date);
      attendancesSink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      attendancesSink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<Schedules?> getMonthlySchedules(String? employeeId,String? type, String startDate, String endDate) async {
    monthlySchedulesSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.getMonthlySchedules(employeeId,type, startDate, endDate);
      monthlySchedulesSink.add(Response.completed(response));
      return response;
    }catch(e){
      print(e.toString());
      monthlySchedulesSink.add(Response.error(e.toString()));
      return null;
    }
  }
}