import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/core/services/api_service.dart';
import 'package:untitled6/features/management/data/model/all_pending_model/AllPendingUsersModel.dart';
import 'package:untitled6/features/management/data/repo/all_pending_users_repo.dart';

class AllPendingUsersRepoImp implements AllPendingUsersRepo {
  final ApiService apiService;

  AllPendingUsersRepoImp({required this.apiService});

  @override
  Future<Either<Failure, List<AllPendingUsersModel>>> fetchAllPendingUsers() async {
    try {
      final response = await apiService.getList(endPoint: 'pending_users') ;

      final users = response
          .map((item) => AllPendingUsersModel.fromJson(item))
          .toList();

      log('✅ Fetched ${users.length} pending users');
      return right(users);
    } on DioException catch (e) {
      log('❌ DioException: ${e.message}');
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      log('❌ Unexpected Error: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
