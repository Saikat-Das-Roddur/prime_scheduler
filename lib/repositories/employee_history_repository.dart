import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeHistoryRepository{
  // Future<Employees> getEmployees(String? adminId) async {
  //   final response = await get("employee/get_employee.php?admin_id=$adminId");
  //   return Employees.fromJson(response);
  // }

  Future<History> getEmployeesHistory(Map<String,dynamic> map) async {
    final response = await get("employee/get_employees_history.php${Uri(queryParameters: map)}");
    return History.fromJson(response);
  }

  Future<History> getEmployeeHistory(Map<String,dynamic> map) async {
    final response = await get("employee/get_employee_history.php${Uri(queryParameters: map)}");
    return History.fromJson(response);
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(CustomStrings.baseUrl + url));
      print(CustomStrings.baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }


  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print("my farm: " + responseJson);
        //print("my farms: " + JsonEncoder.withIndent('  ').convert(responseJson));
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        var error = response.body.split(":");
        var formatedError = error.elementAt(1).split('"');
        // if (progressDialog.isShowing()) {
        //   progressDialog.hide();
        // }
        Fluttertoast.showToast(
            msg: formatedError.elementAt(1), toastLength: Toast.LENGTH_LONG);
        throw  Exception("Error while fetching data");
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw  Exception("Server error");
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}