import 'dart:async';

import 'package:prime_scheduler/models/response.dart';
import 'package:prime_scheduler/repositories/add_employee_repository.dart';

class AddEmployeeBloc {
  late AddEmployeeRepository _repository;
  late StreamController<Response<dynamic>> _addEmployeeStreamController;

  StreamSink<Response<dynamic>> get addEmployeeSink =>
      _addEmployeeStreamController.sink;

  Stream<Response<dynamic>> get addEmployeeStream =>
      _addEmployeeStreamController.stream;

  AddEmployeeBloc() {
    _repository = AddEmployeeRepository();
    _addEmployeeStreamController = StreamController<Response<dynamic>>();
  }

  Future<dynamic> addEmployee(Map body) async {
    addEmployeeSink.add(Response.loading(''));
    try{
      dynamic response = await _repository.addEmployee(body: body);
      addEmployeeSink.add(Response.completed(response));
      return response;
    }catch(e){
      addEmployeeSink.add(Response.error(e.toString()));
      return null;
    }
  }

  dispose(){
    _addEmployeeStreamController.close();
  }

}
