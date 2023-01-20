import 'package:assessment/model/model.dart';
import 'package:dio/dio.dart';

class ReqresAPI {
  final dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api/'));

  // Dio addInterceptors(Dio dio) {
  //   return dio.interceptors.add(InterceptorsWrapper())
  // }
 
  Future<Users> fetchData() async {
    try {

      final response = await dio.get('users?page=2');
      if (response.statusCode == 200) {
        Users data = Users.fromJson(response.data);
      return data;
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<Data> fetchDataById(int id) async {
    try {
      final response = await dio.get('users?page=2');

      Data data = Data.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
