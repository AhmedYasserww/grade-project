import 'package:dartz/dartz.dart';
import '../../../../core/errors/faluire.dart';

abstract class AddPostRepo {
  Future<Either<Failure, Unit>> addPost(String content);
}