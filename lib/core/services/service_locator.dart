

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled6/core/services/api_service.dart';
import 'package:untitled6/features/students/data/repos/all_doctor_repo/all_doctor_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<AllDoctorsRepoImp>(AllDoctorsRepoImp(apiService:getIt.get<ApiService>(),

  ));
  // getIt.registerSingleton<SearchRepoImp>(SearchRepoImp(apiService: getIt.get<ApiService>()));
  // getIt.registerFactory<SearchForBookCubit>(()=>SearchForBookCubit(getIt<SearchRepoImp>(), ""));
  // getIt.registerSingleton<AddBooKtoFavoriteCubit>(AddBooKtoFavoriteCubit());


}

