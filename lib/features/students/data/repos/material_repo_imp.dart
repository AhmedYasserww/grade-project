// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:untitled6/core/errors/faluire.dart';
// import 'package:untitled6/core/services/api_service.dart';
// import 'package:untitled6/features/students/data/model/material_model.dart';
// import 'package:untitled6/features/students/data/repos/material_repo.dart';
// class AllMaterialRepoImp implements AllMaterialRepo {
//   final ApiService apiService;
//
//   AllMaterialRepoImp({required this.apiService});
//
//   @override
//   Future<Either<Failure, List<MaterialModel>>> fetchAllMaterial() async {
//     try {
//       final data = await apiService.get(
//         endPoint: 'volumes?Filtering=free-ebooks&q=computer science&Sorting=newest',
//       );
//
//       List<MaterialModel> books = [];
//
//       if (data['items'] != null) {
//         for (var item in data['items']) {
//       //    books.add(MaterialModel.fromJson(item));
//         }
//         return right(books);
//       } else {
//         return left(ServerFailure(errorMessage: 'No items found'));
//       }
//     } on DioError catch (e) {
//       return left(ServerFailure.fromDioError(e));
//     } catch (e) {
//       return left(ServerFailure(errorMessage: e.toString()));
//     }
//   }
// }