import 'dart:io';


import 'package:bamboo_g/model/log_in_response_model.dart';
import 'package:bamboo_g/model/sign_up_response_model.dart';
import 'package:dio/dio.dart';

import '../../core/api_endpoint.dart';
import '../../model/sign_in_request_model.dart/log_in_user.dart';
import '../../model/sign_up_request_model.dart';

class LogInService {
  static final Dio dio = Dio();

  static Future<LogInModel?> register(
      LogInUserRequestModel registerUser) async {
    final url = ApiEndpoints.logInUser();
   

    try {
      var response = await dio.post(
        url,
        data: registerUser.toJson(),
        // options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = LogInModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return LogInModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);

        return LogInModel(
            message: e.response!.data['message']);
      } else {}
    }
  }
}
