import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:untitled6/features/demonstrator/data/repo/add_post_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  final AddPostRepo addPostRepo;

  AddPostCubit(this.addPostRepo) : super(AddPostInitial());

  Future<void> addPost(String content, BuildContext context) async {
    emit(AddPostLoading());

    final result = await addPostRepo.addPost(content);
    result.fold(
          (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Failed to add post: ${failure.errorMessage}'),
            backgroundColor: Colors.red,
          ),
        );
        emit(AddPostFailure(errorMessage: failure.errorMessage));
      },
          (_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Post added successfully'),
            backgroundColor: Colors.green,
          ),
        );
        emit(AddPostSuccess());
      },
    );
  }
}
