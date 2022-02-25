import 'dart:async';

import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/repositories/welcome_repository.dart';

class WelcomeBloc{
  late WelcomeRepository _repository;
  late StreamController<Response<UserResponse>> _userAdminStreamController;
  late StreamController<Response<UserResponse>> _userEmployeeStreamController;

  StreamSink<Response<UserResponse>> get userAdminSink =>
      _userAdminStreamController.sink;

  Stream<Response<UserResponse>> get userAdminStream =>
      _userAdminStreamController.stream;

  StreamSink<Response<UserResponse>> get userEmployeeSink =>
      _userEmployeeStreamController.sink;

  Stream<Response<UserResponse>> get userEmployeeStream =>
      _userEmployeeStreamController.stream;

  WelcomeBloc(){
    _repository = WelcomeRepository();
    _userEmployeeStreamController = StreamController<Response<UserResponse>>();
    _userAdminStreamController = StreamController<Response<UserResponse>>();
  }

  Future<UserResponse?> signInAdmin(String id) async {
    userAdminSink.add(Response.loading(''));
    try {
      UserResponse user = await _repository.getUserAdmin(id);
      userAdminSink.add(Response.completed(user));
      return user;
    } catch (e) {
      userAdminSink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<UserResponse?> signInEmployee(String id) async {
    userEmployeeSink.add(Response.loading(''));
    try {
      UserResponse user = await _repository.getUserEmployee(id);
      userEmployeeSink.add(Response.completed(user));
      return user;
    } catch (e) {
      userEmployeeSink.add(Response.error(e.toString()));
      return null;
    }
  }


}