import 'dart:async';

import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/clock_in_repository.dart';

class ClockInBloc {
  late ClockInRepository _repository;
  late StreamController<Response<dynamic>> _checkUserInStreamController;
  late StreamController<Response<dynamic>> _clockInStreamController;

  StreamSink<Response<dynamic>> get checkUserInSink =>
      _checkUserInStreamController.sink;

  Stream<Response<dynamic>> get checkUserInStream =>
      _checkUserInStreamController.stream;

  StreamSink<Response<dynamic>> get clockInSink =>
      _clockInStreamController.sink;

  Stream<Response<dynamic>> get clockInStream =>
      _clockInStreamController.stream;

  ClockInBloc() {
    _repository = ClockInRepository();
    _checkUserInStreamController = StreamController<Response<dynamic>>();
    _clockInStreamController = StreamController<Response<dynamic>>();
  }

  Future<dynamic> checkUserIn(String? employeeId, String? date) async {
    checkUserInSink.add(Response.loading(''));
    try {
      dynamic response = await _repository.checkUserIn(employeeId, date);
      checkUserInSink.add(Response.completed(response));
      return response;
    } catch (e) {
      checkUserInSink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<dynamic> clockIn(Map body) async {
    clockInSink.add(Response.loading(''));
    try {
      dynamic response = await _repository.clockIn(body: body);
      clockInSink.add(Response.completed(response));
      return response;
    } catch (e) {
      clockInSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose() {
    _checkUserInStreamController.close();
    _clockInStreamController.close();
  }
}
