import 'package:dartz/dartz.dart';
import 'package:untitled6/core/errors/faluire.dart';
import 'package:untitled6/features/management/data/model/all_pending_model/AllPendingUsersModel.dart';

abstract class AllPendingUsersRepo {
  Future<Either<Failure, List<AllPendingUsersModel>>> fetchAllPendingUsers();
  Future<Either<Failure, Unit>> approveUser(int userId);
}