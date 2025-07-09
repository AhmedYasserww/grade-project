import 'package:bloc/bloc.dart';
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
}
