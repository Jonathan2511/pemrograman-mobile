import 'package:dio/dio.dart';

abstract class Services {
  static const String url = 'https://kj001.repit.tech';
  static const String apiUrl = '$url/api';

  static Future<Map> login(
      {required String nim, required String password}) async {
    try {
      Response? response = await Dio().post(
        '$apiUrl/login',
        options: Options(headers: {
          'Accept': 'application/json',
        }),
        data: {'nim': nim, 'password': password},
      );
      if (response.statusCode == 200) {
        return response.data as Map;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
