import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Services {
  static const String url = 'https://kj001.repit.tech';
  static const String apiUrl = '$url/api';
  // Untuk nyimpen token di hape
  static late SharedPreferences pref;

  static Future<Map?> login(
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
        pref = await SharedPreferences.getInstance();
        pref.setString("token", response.data['token'].toString());
        return response.data as Map;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw e.response!.data['message'];
        }
      } else {
        rethrow;
      }
    }
    return null;
  }

  static Future<Response?> register(
      {required String nim,
      required String password,
      required String name}) async {
    try {
      Response? response = await Dio().post('$apiUrl/register',
          options: Options(headers: {
            'Accept': 'application/json',
          }),
          data: {'nim': nim, 'name': name, 'password': password});
      if (response.statusCode == 201) {
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw e.response!.data['message'];
        }
      } else {
        rethrow;
      }
    }
    return null;
  }

  static Future<Response?> createPost({
    required String title,
    required String content,
  }) async {
    try {
      pref = await SharedPreferences.getInstance();
      String token = pref.getString("token")!;
      Response? response = await Dio().post('$apiUrl/post',
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          }),
          data: {'title': title, 'content': content});
      if (response.statusCode == 201) {
        return response;
      } else {
        throw Exception(response.data['message']);
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response != null) {
          throw e.response!.data['message'];
        }
      } else {
        rethrow;
      }
    }
    return null;
  }
}
