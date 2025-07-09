part of 'all_pending_users_cubit.dart';

@immutable
sealed class AllPendingUsersState {}

final class AllPendingUsersInitial extends AllPendingUsersState {}

final class AllPendingUsersLoading extends AllPendingUsersState {}
 final class AllPendingUsersSuccess extends AllPendingUsersState {
  final List<AllPendingUsersModel> allPendingUsersList;

  AllPendingUsersSuccess({required this.allPendingUsersList});
 }

final class AllPendingUsersFailure extends AllPendingUsersState {
  final String errorMessage;

  AllPendingUsersFailure({required this.errorMessage});
}