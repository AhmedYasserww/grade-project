import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/core/services/api_service.dart';
import 'package:untitled6/features/demonstrator/data/models/add_materials_model/material_model.dart';
import 'package:untitled6/features/demonstrator/data/repo/add_material_repo/add_material_repo.dart';

class AddMaterialRepoImpl implements AddMaterialRepo {
  final ApiService apiService;

  AddMaterialRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, Unit>> addMaterial(MaterialModel material) async {
    try {
      final formData = await material.toFormData();
      await apiService.addMaterial(formData);
      return right(unit);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
