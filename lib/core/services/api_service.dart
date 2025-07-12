import 'package:dio/dio.dart';

//const String devToken = 'Bearer 83|kEqhW5VviG2qTWCTh6FlHEeLqDjEuR0zt2nlMmmh7340b04a';
const String devToken = 'Bearer 264|axvtKwUL7n1touC4XrZ8uccA4IKg4O2fJ2wmgrBc09e38488';

class ApiService {
  final Dio dio;
  final String _baseUrl = "https://1ea7da0026ea.ngrok-free.app/api/";

  ApiService({required this.dio}) {
    dio.options.headers['Authorization'] = devToken;
    dio.options.headers['Accept'] = 'application/json';
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

  Future<void> rejectUser(int userId) async {
    final response = await dio.post('${_baseUrl}users/$userId/reject');
    print('✅ Reject Success Response: ${response.data}');
  }


  Future<void> addPost(String postContent) async {
    final formData = FormData.fromMap({
      'postContent': postContent,
    });

    try {
      final response = await dio.post('${_baseUrl}posts/store', data: formData);
      print('✅ Post added successfully: ${response.data}');
    } on DioException catch (e) {
      print('❌ DioException in addPost: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('❌ Unknown error in addPost: $e');
      rethrow;
    }
  }
}
