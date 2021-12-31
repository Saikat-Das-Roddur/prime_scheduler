import 'dart:async';

import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/repositories/log_in_repository.dart';

class LogInBloc {
  late LogInRepository _repository;
  late StreamController<Response<UserResponse>> _signInStreamController;
  late StreamController<Response<UserResponse>> _updateAdminStreamController;
  late StreamController<Response<UserResponse>> _socialSignInStreamController;
  late StreamController<Response<dynamic>> _forgetPasswordStreamController;

  StreamSink<Response<UserResponse>> get signInSink =>
      _signInStreamController.sink;

  Stream<Response<UserResponse>> get signInStream =>
      _signInStreamController.stream;

  StreamSink<Response<UserResponse>> get updateAdminSink =>
      _updateAdminStreamController.sink;

  Stream<Response<UserResponse>> get updateAdminStream =>
      _updateAdminStreamController.stream;

  StreamSink<Response<UserResponse>> get socialSignInSink =>
      _socialSignInStreamController.sink;

  Stream<Response<UserResponse>> get socialSignInStream =>
      _socialSignInStreamController.stream;

  StreamSink<Response<dynamic>> get forgetPasswordSink =>
      _forgetPasswordStreamController.sink;

  Stream<Response<dynamic>> get forgetPasswordStream =>
      _forgetPasswordStreamController.stream;

  LogInBloc() {
    _repository = LogInRepository();
    _signInStreamController = StreamController<Response<UserResponse>>();
    _updateAdminStreamController = StreamController<Response<UserResponse>>();
    _socialSignInStreamController = StreamController<Response<UserResponse>>();
    _forgetPasswordStreamController = StreamController<Response<dynamic>>();
  }

  Future<UserResponse?> signIn({required Map body}) async {
    signInSink.add(Response.loading(''));
    try {
      UserResponse user = await _repository.signIn(body: body);
      signInSink.add(Response.completed(user));
      return user;
    } catch (e) {
      signInSink.add(Response.error(e.toString()));
      return null;
    }
  }
  Future<UserResponse?> updateAdmin({required Map body}) async {
    updateAdminSink.add(Response.loading(''));
    try {
      UserResponse user = await _repository.updateAdmin(body: body);
      updateAdminSink.add(Response.completed(user));
      return user;
    } catch (e) {
      updateAdminSink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<UserResponse?> socialSignIn({required Map body}) async {
    socialSignInSink.add(Response.loading(''));
    try {
      UserResponse user = await _repository.socialSignIn(body: body);
      socialSignInSink.add(Response.completed(user));
      return user;
    } catch (e) {
      socialSignInSink.add(Response.error(e.toString()));
      return null;
    }
  }

  Future<dynamic> forgetPassword({required Map body}) async {
    forgetPasswordSink.add(Response.loading(''));
    try {
      dynamic user = await _repository.forgotPassword(body: body);
      forgetPasswordSink.add(Response.completed(user));
      return user;
    } catch (e) {
      forgetPasswordSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose() {
    _signInStreamController.close();
    _socialSignInStreamController.close();
    _forgetPasswordStreamController.close();
  }
}
