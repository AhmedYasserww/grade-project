part of 'all_posts_cubit.dart';

@immutable
sealed class AllPostsState {}

final class AllPostsInitial extends AllPostsState {}
final class AllPostsLoading extends AllPostsState {}
final class AllPostsSuccess extends AllPostsState {
  final List<AllPostModel> allPosts;

  AllPostsSuccess({required this.allPosts});
}
final class AllPostsFailure extends AllPostsState {
  final String errorMessage;

  AllPostsFailure({required this.errorMessage});
}
