import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/core/services/api_service.dart';
import 'package:untitled6/features/students/data/model/all_material_model/AllMaterialModel.dart';
import 'package:untitled6/features/students/data/repos/all_material_repo/all_material_repo.dart';

class AllMaterialRepoImp implements AllMaterialRepo {
  ApiService apiService;
  AllMaterialRepoImp({required this.apiService});
  @override
  Future<Either<Failure, List<AllMaterialModel>>> fetchAllMaterials() async{
    try {
      var data = await apiService.get(endPoint:'materials');
      // print('All Doctors List : $data');
      List<AllMaterialModel> allMaterials = [];
      if (data['data']['data'] != null) {
        for (var item in data['data']['data']) {
          allMaterials.add(AllMaterialModel.fromJson(item));
        }
        print(data['data']);
      } else {
        return left(ServerFailure(errorMessage: 'No items found'));
      }
      return right(allMaterials);
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