import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled6/features/demonstrator/data/models/add_materials_model/material_model.dart';
import 'package:untitled6/features/demonstrator/data/repo/add_material_repo/add_material_repo.dart';

part 'add_material_state.dart';


class AddMaterialCubit extends Cubit<AddMaterialState> {
  final AddMaterialRepo addMaterialRepo;

  AddMaterialCubit(this.addMaterialRepo) : super(AddMaterialInitial());

  Future<void> addMaterial(MaterialModel material) async {
    emit(AddMaterialLoading());

    final result = await addMaterialRepo.addMaterial(material);

    result.fold(
          (failure) {
        emit(AddMaterialFailure(errorMessage: failure.errorMessage));
      },
          (_) {
        emit(AddMaterialSuccess());
      },
    );
  }
}

