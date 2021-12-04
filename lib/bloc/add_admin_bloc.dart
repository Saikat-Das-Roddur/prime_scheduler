import 'dart:async';

import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/add_admin_repository.dart';

class AddAdminBloc{
  late AddAdminRepository _repository;
  late StreamController<Response<dynamic>> _addAdminStreamController;

  StreamSink<Response<dynamic>> get addAdminSink =>
      _addAdminStreamController.sink;

  Stream<Response<dynamic>> get addAdminStream =>
      _addAdminStreamController.stream;

  AddAdminBloc(){
    _repository = AddAdminRepository();
    _addAdminStreamController = StreamController<Response<dynamic>>();
  }
  Future<dynamic> addAdmin(Map body) async {
    addAdminSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.addAdmin(body: body);
      addAdminSink.add(Response.completed(response));
      return response;
    }catch(e){
      addAdminSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _addAdminStreamController.close();
  }
}