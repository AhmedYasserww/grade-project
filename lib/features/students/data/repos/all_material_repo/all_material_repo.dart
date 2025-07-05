import 'package:dartz/dartz.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/features/students/data/model/all_material_model/AllMaterialModel.dart';

abstract class AllMaterialRepo {
  Future<Either<Failure, List<AllMaterialModel>>> fetchAllMaterials();
}