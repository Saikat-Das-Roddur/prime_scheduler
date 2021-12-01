import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:prime_scheduler/models/registration_response.dart';
import 'package:prime_scheduler/utils/custom_exception.dart';
import 'package:http/http.dart' as http;
import 'package:prime_scheduler/utils/custom_strings.dart';

import 'package:shared_preferences/shared_preferences.dart';

class RegistrationRepository {
  Future<RegistrationResponse> signUp({required Map body}) async {
    final response = await post("user/sign_up.php", body: body);
    return RegistrationResponse.fromJson(response);
  }

  Future<dynamic> post(String url, {required Map body}) async {
    var responseJson;

    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final response = await http
          .post(Uri.parse(CustomStrings.baseUrl + url), body: body,);
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
        throw new Exception("Error while fetching data");
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw new Exception("Server error");
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
