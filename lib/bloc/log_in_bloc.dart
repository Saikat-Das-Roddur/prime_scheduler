import 'dart:async';

import 'package:prime_scheduler/models/registration_response.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/repositories/log_in_repository.dart';

class LogInBloc{
  late LogInRepository _repository;
  late StreamController<Response<UserResponse>> _signInStreamController;

  StreamSink<Response<UserResponse>> get signInSink => _signInStreamController.sink;

  Stream<Response<UserResponse>> get signInStream => _signInStreamController.stream;


  LogInBloc(){
    _repository = LogInRepository();
    _signInStreamController = StreamController<Response<UserResponse>>();
  }

  Future<UserResponse?> signIn({required Map body}) async{
    signInSink.add(Response.loading(''));
    try{
      UserResponse user = await _repository.signIn(body: body);
      signInSink.add(Response.completed(user));
      print(user.user?.statusCode);
      return user;
    }catch(e){
      print(e.toString());
      signInSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _signInStreamController.close();
  }


}