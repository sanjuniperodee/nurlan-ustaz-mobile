import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'post_service_cubit.freezed.dart';

@singleton
class PostServiceCubit extends Cubit<PostServiceState> {
  final HomeRepository _homeRepository;
  PostServiceCubit(
    this._homeRepository,
  ) : super(const PostServiceState.initial());

  Future<void> postService({required List<int> id}) async {
    emit(const PostServiceState.loading());
    final failureOrUser = await _homeRepository.postImamService(id: id);
    failureOrUser.fold(
      (l) {
        emit(PostServiceState.error(message: mapFailureToMessage(l)));
      },
      (r) {
        emit(PostServiceState.loaded(url: r));
      },
    );
  }
}

@freezed
sealed class PostServiceState with _$PostServiceState {
  const factory PostServiceState.initial() = PostServiceInitialPage;
  const factory PostServiceState.loading() = PostServiceLoadingState;
  const factory PostServiceState.loaded({required String url}) =
      PostServiceLoadedState;
  const factory PostServiceState.error({
    required String message,
  }) = PostServiceErrorState;
}
