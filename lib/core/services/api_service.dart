import 'package:dio/dio.dart';

const String devToken = 'Bearer 83|kEqhW5VviG2qTWCTh6FlHEeLqDjEuR0zt2nlMmmh7340b04a';

class ApiService {
  final Dio dio;
  final String _baseUrl = "https://26e5bea2c314.ngrok-free.app/api/";

  ApiService({required this.dio}) {
    dio.options.headers['Authorization'] = devToken;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
  Future<List<dynamic>> getList({required String endPoint}) async {
    final response = await dio.get('$_baseUrl$endPoint');
    if (response.data is List) {
      return response.data as List<dynamic>;
    } else {
      throw Exception("❌ Expected List but got ${response.data.runtimeType}");
    }
  }
  Future<void> approveUser(int userId) async {
    final response = await dio.post('${_baseUrl}users/$userId/approve');
    print('✅ Approve Success Response: ${response.data}');
  }
}