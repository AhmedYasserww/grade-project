import 'package:dartz/dartz.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/features/students/data/model/doctor_model/DoctorsModel.dart';

abstract class AllDoctorRepo {
  Future<Either<Failure, List<DoctorsModel>>> fetchAllDoctors();


}