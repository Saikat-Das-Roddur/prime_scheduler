import 'dart:async';

import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/clock_out_repository.dart';

class ClockOutBloc{
  late ClockOutRepository _repository;
  late StreamController<Response<dynamic>> _clockOutStreamController;

  StreamSink<Response<dynamic>> get clockOutSink =>
      _clockOutStreamController.sink;

  Stream<Response<dynamic>> get clockOutStream =>
      _clockOutStreamController.stream;

  ClockOutBloc() {
    _repository = ClockOutRepository();
    _clockOutStreamController = StreamController<Response<dynamic>>();
  }
  Future<dynamic> clockOut(Map body) async {
    clockOutSink.add(Response.loading(''));
    try {
      dynamic response = await _repository.clockOut(body: body);
      clockOutSink.add(Response.completed(response));
      return response;
    } catch (e) {
      clockOutSink.add(Response.error(e.toString()));
      return null;
    }
  }
}