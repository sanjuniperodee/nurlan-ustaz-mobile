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
  ) : super(const PostServiceState.initialState());

  Future<void> postService({required List<int> id}) async {
    emit(const PostServiceState.loadingState());
    final failureOrUser = await _homeRepository.postImamService(id: id);
    failureOrUser.fold(
      (l) {
        emit(PostServiceState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        emit(const PostServiceState.loaded());
      },
    );
  }
}

@freezed
class PostServiceState with _$PostServiceState {
  const factory PostServiceState.initialState() = _InitialPage;

  const factory PostServiceState.loadingState() = _LoadingState;

  const factory PostServiceState.loaded() = _LoadedState;

  const factory PostServiceState.errorState({
    required String message,
  }) = _ErrorState;
}
