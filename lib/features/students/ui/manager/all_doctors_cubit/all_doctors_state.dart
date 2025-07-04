part of 'all_doctors_cubit.dart';

@immutable
sealed class AllDoctorsState {}

final class AllDoctorsInitial extends AllDoctorsState {}

final class AllDoctorsLoading extends AllDoctorsState {}

final class AllDoctorsSuccess extends AllDoctorsState {
  final List<DoctorsModel> doctorsList;
  AllDoctorsSuccess({required this.doctorsList});
}

final class AllDoctorsFailure extends AllDoctorsState {
  final String errorMessage;
  AllDoctorsFailure({required this.errorMessage});
}
