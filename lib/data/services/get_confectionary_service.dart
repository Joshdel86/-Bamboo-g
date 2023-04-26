import 'dart:io';

import 'package:bamboo_g/data/token_data_storage.dart';
import 'package:bamboo_g/model/sign_up_response_model.dart';
import 'package:dio/dio.dart';

import '../../core/api_endpoint.dart';
import '../../model/confectionary_model.dart';
import '../../model/sign_up_request_model.dart';

class GetConfectionaryService {
  static final Dio dio = Dio();

  static Future<ConfectionaryModel?> register() async {
    final url = ApiEndpoints.getconf();

    final String accessToken = TokenStorage.retrieveToken();
    print(accessToken);

    try {
      var response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $accessToken'})
          // options: Options(headers: {'Content-Type': 'application/json'}),
          );
      print(response.data);
      print(response.statusCode);
      print('i am ok');
      print(response.statusCode);
      print('object');
      if (response.statusCode == 200) {
        var result = ConfectionaryModel.fromJson(response.data);
        return result;
      }
    } catch (e) {
      if (e is SocketException) {
      } else if (e is DioError) {
      } else {}
    }
  }
}
