import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:prime_scheduler/models/attendences.dart';
import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/history.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';

class ActiveDetailsRepository{
  Future<Attendances> getEmployeeAttendance(String? employeeId) async {
    final response = await get("attendance/get_all_attendance.php?employee_id="+employeeId!);
    return Attendances.fromJson(response);
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