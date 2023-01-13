import 'package:dio/dio.dart';
import 'package:seleksi_suitmedia/models/my_model.dart';

class MyService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://reqres.in/api/users';

  Future<Map<String, dynamic>> getUsers({int page = 1}) async {
    try {
      final Response response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        int totalPage = response.data['total_pages'];
        final List<MyModel> users = [];

        for (var item in data) {
          users.add(MyModel.fromJson(item));
        }
        return {
          'users': users,
          'total_pages': totalPage,
        };
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
