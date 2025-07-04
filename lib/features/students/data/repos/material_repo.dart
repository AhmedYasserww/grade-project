import 'package:dartz/dartz.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/features/students/data/model/material_model.dart';

abstract class AllMaterialRepo{
  Future<Either<Failure,List<MaterialModel>>> fetchAllMaterial();


}
// abstract class AllMaterialRepo {
//   Future<Either<Failure, List<MaterialModel>>> fetchAllMaterial();
// }