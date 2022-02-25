import 'dart:async';

import 'package:prime_scheduler/models/attendences.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/active_details_repository.dart';
import 'package:prime_scheduler/views/active_details.dart';

class ActiveDetailsBloc{
  late ActiveDetailsRepository _repository;
  late StreamController<Response<Attendances>> _getAttendanceStreamController;

  StreamSink<Response<Attendances>> get getAttendanceSink =>
      _getAttendanceStreamController.sink;

  Stream<Response<Attendances>> get getAttendanceStream =>
      _getAttendanceStreamController.stream;

  ActiveDetailsBloc(){
    _repository = ActiveDetailsRepository();
    _getAttendanceStreamController = StreamController<Response<Attendances>>();
  }

  Future<Attendances?> getAttendance(String? id) async {
    getAttendanceSink.add(Response.loading(''));
    try {
      Attendances response = await _repository.getEmployeeAttendance(id);
      getAttendanceSink.add(Response.completed(response));
      return response;
    } catch (e) {
      print(e.toString());
      getAttendanceSink.add(Response.error(e.toString()));
      return null;
    }
  }

}