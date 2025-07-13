import 'package:dio/dio.dart';
import 'package:untitled6/features/demonstrator/data/models/add_materials_model/material_model.dart';

//const String devToken = 'Bearer 83|kEqhW5VviG2qTWCTh6FlHEeLqDjEuR0zt2nlMmmh7340b04a';
const String devToken = 'Bearer 314|ynyFbUOqcoVxdrEae0RLAMGNAXKyAu3zWkkuSQhrda372137';

class ApiService {
  final Dio dio;
  final String _baseUrl = "https://42a567ba9cb2.ngrok-free.app/api/";

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
  Future<void> addMaterial(FormData formData) async {
    try {
      final response = await dio.post(
        '${_baseUrl}materials',
        data: formData,
      );
      print('✅ Material added: ${response.data}');
    } on DioException catch (e) {
      print('❌ DioException in addMaterial: ${e.response?.data ?? e.message}');
      rethrow;
    } catch (e) {
      print('❌ Unknown error in addMaterial: $e');
      rethrow;
    }
  }
}
