import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:prime_scheduler/models/attendences.dart';
import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/schedules.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClockInOutRepository {
  Future<Schedules> getSchedules(String? employeeId,String? type, String? date) async {
    final response = await get(
        "schedule/get_employee_schedule.php?$type=$employeeId&date=$date");
    return Schedules.fromJson(response);
  }

  Future<Schedules> getEmployeeSchedules(String? employeeId, String? date) async {
    final response = await get(
        "schedule/get_employee_schedule.php?employee_id=$employeeId&date=$date");
    return Schedules.fromJson(response);
  }

  Future<Attendances> getEmployeeAttendance(String? employeeId, String? date) async {
    final response = await get(
        "attendance/get_attendance.php?employee_id=$employeeId&date=$date");
    return Attendances.fromJson(response);
  }

  Future<Schedules> getMonthlySchedules(
      String? employeeId,String? type, String? startDate, String? endDate) async {
    final response = await get(
        "schedule/get_monthly_schedule.php?$type=$employeeId&start_date=$startDate&end_date=$endDate");
    return Schedules.fromJson(response);
  }

  Future<Attendances> getMonthlyAttendance(
      String? employeeId,String? startDate, String? endDate) async {
    final response = await get(
        "attendance/get_monthly_attendances.php?employee_id=$employeeId&start_date=$startDate&end_date=$endDate");
    return Attendances.fromJson(response);
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(CustomStrings.baseUrl + url));
      print(url);
      print(response.body);
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
        throw Exception("Error while fetching data");
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw Exception("Server error");
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
