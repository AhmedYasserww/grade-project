import 'package:dartz/dartz.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/features/students/data/model/all_posts_model/AllPostModel.dart';

abstract class AllPostsRepo {
  Future<Either<Failure, List<AllPostModel>>> fetchAllPosts();


}