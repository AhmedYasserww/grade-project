import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/core/services/api_service.dart';
import 'package:untitled6/features/students/data/model/all_posts_model/AllPostModel.dart';
import 'package:untitled6/features/students/data/repos/all_posts_repo/all_posts_repo.dart';

class AllPostsRepoImp implements AllPostsRepo {
  ApiService apiService;
  AllPostsRepoImp({required this.apiService});


  @override
  Future<Either<Failure, List<AllPostModel>>> fetchAllPosts() async{
    try {
      var data = await apiService.get(endPoint:'posts');
      // print('All Doctors List : $data');
      List<AllPostModel> allPosts = [];
      if (data['data']['data'] != null) {
        for (var item in data['data']['data']) {
          allPosts.add(AllPostModel.fromJson(item));
        }
        log(data['data']['data'].toString());
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(allPosts);
    } on Exception catch (e) {
      if (e is DioException) {
        log('DioError occurred: ${e.message}');
        return left(ServerFailure.fromDioError(e));
      }
      log('Exception occurred: $e');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }


}