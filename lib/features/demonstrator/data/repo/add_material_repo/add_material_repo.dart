import 'package:dartz/dartz.dart';
import 'package:untitled6/features/demonstrator/data/models/add_materials_model/material_model.dart';

import '../../../../../core/errors/faluire.dart';

abstract class AddMaterialRepo {
  Future<Either<Failure, Unit>> addMaterial(MaterialModel material);
}