import 'dart:async';

import 'package:prime_scheduler/models/registration_response.dart';
import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/registration_repository.dart';

class Step3Bloc{
  late RegistrationRepository _repository;
  late StreamController<Response<RegistrationResponse>> _signUpStreamController;

  StreamSink<Response<RegistrationResponse>> get signUpSink => _signUpStreamController.sink;

  Stream<Response<RegistrationResponse>> get signUpStream => _signUpStreamController.stream;

  Step3Bloc(){
    _repository = RegistrationRepository();
    _signUpStreamController = StreamController<Response<RegistrationResponse>>();
  }

  Future<RegistrationResponse?> signUp({required Map body}) async{
    signUpSink.add(Response.loading(''));
    try{
      RegistrationResponse registrationResponse = await _repository.signUp(body: body);
      signUpSink.add(Response.completed(registrationResponse));
      return registrationResponse;
    }catch(e){
      signUpSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _signUpStreamController.close();
  }

}