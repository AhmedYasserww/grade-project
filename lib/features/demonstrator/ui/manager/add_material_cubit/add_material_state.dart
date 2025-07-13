part of 'add_material_cubit.dart';

@immutable
sealed class AddMaterialState {}

final class AddMaterialInitial extends AddMaterialState {}
final class AddMaterialLoading extends AddMaterialState {}
final class AddMaterialSuccess extends AddMaterialState {}
final class AddMaterialFailure extends AddMaterialState {
  final String errorMessage;
  AddMaterialFailure({required this.errorMessage});
}
