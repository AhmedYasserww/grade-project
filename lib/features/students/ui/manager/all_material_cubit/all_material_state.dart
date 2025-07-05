part of 'all_material_cubit.dart';

@immutable
sealed class AllMaterialState {}

final class AllMaterialInitial extends AllMaterialState {}

final class AllMaterialLoading extends AllMaterialState {}

final class AllMaterialSuccess extends AllMaterialState {
  final List<AllMaterialModel> materialsList;
  AllMaterialSuccess({required this.materialsList});
}

final class AllMaterialFailure extends AllMaterialState {
  final String errorMessage;
  AllMaterialFailure({required this.errorMessage});
}
