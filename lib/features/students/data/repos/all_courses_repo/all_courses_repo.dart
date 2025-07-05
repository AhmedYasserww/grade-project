import 'package:dartz/dartz.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/features/students/data/model/all_courses_model/AllCourcesModel.dart';

abstract class AllCoursesRepo {
  Future<Either<Failure, List<AllCoursesModel>>> fetchAllCourses();


}