import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/core/services/api_service.dart';
import 'package:untitled6/features/students/data/model/all_courses_model/AllCourcesModel.dart';
import 'package:untitled6/features/students/data/repos/all_courses_repo/all_courses_repo.dart';

class AllCoursesRepoImp implements AllCoursesRepo {
  ApiService apiService;
  AllCoursesRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<AllCoursesModel>>> fetchAllCourses() async{
    try {
      var data = await apiService.get(endPoint:'courses');
      // print('All Doctors List : $data');
      List<AllCoursesModel> courses = [];
      if (data['data'] != null) {
        for (var item in data['data']) {
          courses.add(AllCoursesModel.fromJson(item));
        }
        print(data['data']);
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(courses);
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