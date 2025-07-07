import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled6/features/students/data/model/all_posts_model/AllPostModel.dart';
import 'package:untitled6/features/students/data/repos/all_posts_repo/all_posts_repo.dart';

part 'all_posts_state.dart';

class AllPostsCubit extends Cubit<AllPostsState> {
  AllPostsCubit(this.allPostsRepo) : super(AllPostsInitial());
  final AllPostsRepo allPostsRepo;
  Future<void> fetchAllPosts() async {
    emit(AllPostsLoading());
    try {
      final result = await allPostsRepo.fetchAllPosts();
      result.fold((l) => emit(AllPostsFailure(errorMessage: l.errorMessage)), (r) => emit(AllPostsSuccess(allPosts: r)));
    } on Exception catch (e) {
      emit(AllPostsFailure(errorMessage: e.toString()));
    }
  }
}
