import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled6/core/services/api_service.dart';
import '../../../../core/errors/faluire.dart';
import 'add_post_repo.dart';

class AddPostRepoImpl implements AddPostRepo {
  final ApiService apiService;

  AddPostRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, Unit>> addPost(String content) async {
    try {
      await apiService.addPost(content);
      return right(unit);
    } on DioException catch (e) {
      print('❌ DioException in addPost:\nType: ${e.type}\nMessage: ${e.message}\nResponse: ${e.response?.data}');

      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      print('❌ Unknown error in Repo: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
