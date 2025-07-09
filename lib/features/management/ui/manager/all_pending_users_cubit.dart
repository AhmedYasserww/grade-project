import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled6/features/management/data/model/all_pending_model/AllPendingUsersModel.dart';
import 'package:untitled6/features/management/data/repo/all_pending_users_repo.dart';

part 'all_pending_users_state.dart';

class AllPendingUsersCubit extends Cubit<AllPendingUsersState> {
  AllPendingUsersCubit(this.allPendingUsersRepo) : super(AllPendingUsersInitial());

  final AllPendingUsersRepo allPendingUsersRepo;

  Future<void> fetchAllPendingUsers() async {
    emit(AllPendingUsersLoading());
    try {
      final result = await allPendingUsersRepo.fetchAllPendingUsers();
      result.fold(
            (failure) => emit(AllPendingUsersFailure(errorMessage: failure.errorMessage)),
            (usersList) => emit(AllPendingUsersSuccess(allPendingUsersList: usersList)),
      );
    } catch (e) {
      emit(AllPendingUsersFailure(errorMessage: e.toString()));
    }
  }
  Future<void> approveUser(int userId, BuildContext context) async {
    final result = await allPendingUsersRepo.approveUser(userId);

    result.fold(
          (failure) {
        print('❌ Approval failed in Cubit: ${failure.errorMessage}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Failed to approve: ${failure.errorMessage}'),
            backgroundColor: Colors.red,
          ),
        );
      },
          (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ User approved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        fetchAllPendingUsers();
      },
    );
  }
}
