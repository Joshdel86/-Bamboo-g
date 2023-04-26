import 'dart:io';


import 'package:bamboo_g/model/sign_up_response_model.dart';
import 'package:dio/dio.dart';

import '../../core/api_endpoint.dart';
import '../../model/sign_up_request_model.dart';

class RegisterUserService {
  static final Dio dio = Dio();

  static Future<SignUpResponseModel?> register(
      SignUpModel registerUser) async {
    final url = ApiEndpoints.registerUser();
    print(url);
    print(registerUser.email);
    print(registerUser.firstName);
    print(registerUser.lastName);
    print(registerUser.password);
    

    try {
      var response = await dio.post(
        url,
        data: registerUser.toJson(),
        // options: Options(headers: {'Content-Type': 'application/json'}),
      );
      print(response.data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var result = SignUpResponseModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
        return SignUpResponseModel(message: e.message);
      } else if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);

        return SignUpResponseModel(
            message: e.response!.data['message']);
      } else {}
    }
  }
}
