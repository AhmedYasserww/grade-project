import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled6/features/students/data/model/doctor_model/DoctorsModel.dart';
import 'package:untitled6/features/students/data/repos/all_doctor_repo/all_doctor_repo.dart';

part 'all_doctors_state.dart';

class AllDoctorsCubit extends Cubit<AllDoctorsState> {
  AllDoctorsCubit(this.allDoctorRepo) : super(AllDoctorsInitial());
final AllDoctorRepo allDoctorRepo;
  Future<void> fetchAllDoctors() async {
    emit(AllDoctorsLoading());
    try {
      final result = await allDoctorRepo.fetchAllDoctors();
      result.fold((l) => emit(AllDoctorsFailure(errorMessage: l.errorMessage)), (r) => emit(AllDoctorsSuccess(doctorsList: r)));
    } on Exception catch (e) {
     emit(AllDoctorsFailure(errorMessage: e.toString()));
    }
  }
}
