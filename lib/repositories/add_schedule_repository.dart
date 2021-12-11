import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:prime_scheduler/models/employees.dart';
import 'package:prime_scheduler/models/user_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:prime_scheduler/utils/custom_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddScheduleRepository{
  Future<dynamic> addSchedule(File? file, {required Map<String,String> body}) async {
    final response = await postWithImage("schedule/add_schedule.php", file, body: body);
    return response;
  }

  Future<Employees> searchEmployees(Map body) async {
    final response = await post("search/search_employee.php",body: body);
    return Employees.fromJson(response);
  }

  Future<dynamic> postWithImage(String url,File? file, {required Map<String,String> body}) async{
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(CustomStrings.baseUrl + url),
    );

    request.fields.addAll(body);
    request.files.add(
      http.MultipartFile.fromBytes(
        "image",
        file?.readAsBytesSync(),
        filename: file?.path,
      ),
    );
    request.headers["Content-Type"] = 'multipart/form-data';
    var response = await request.send();
    var response2 = await http.Response.fromStream(response);
    return _response(response2);
  }

  Future<dynamic> post(String url, {required Map body}) async {
    var responseJson;

    try {
      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      final response = await http
          .post(Uri.parse(CustomStrings.baseUrl + url), body: body,);
      print(CustomStrings.baseUrl + url);
      print(response.body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(CustomStrings.baseUrl + url));
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