import 'package:assessment/model/main_data.dart';
import 'package:assessment/model/user_data.dart';
import 'package:dio/dio.dart';

class ReqresAPI {
  final dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api/'));

  // Dio addInterceptors(Dio dio) {
  //   return dio.interceptors.add(InterceptorsWrapper())
  // }

  ReqresAPI() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<Users> fetchData(int page) async {
    try {
      final response = await dio.get('users?page=$page');
      if (response.statusCode == 200) {
        Users data = Users.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError {
      rethrow;
    }
  }

  Future<UserData> fetchDataById(int id) async {
    try {
      final response = await dio.get('users/$id');
      if (response.statusCode == 200) {
        UserData data = UserData.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError {
      rethrow;
    }
  }
}
