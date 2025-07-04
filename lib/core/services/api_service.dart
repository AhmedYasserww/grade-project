import 'package:dio/dio.dart';

const String devToken = 'Bearer 83|kEqhW5VviG2qTWCTh6FlHEeLqDjEuR0zt2nlMmmh7340b04a'; // ✅ لازم Bearer

class ApiService {
  final Dio dio;
  final String _baseUrl = "https://a3a3-156-197-155-244.ngrok-free.app/api/";

  ApiService({required this.dio}) {
    // ضيف التوكن للهيدر صح
    dio.options.headers['Authorization'] = devToken;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}