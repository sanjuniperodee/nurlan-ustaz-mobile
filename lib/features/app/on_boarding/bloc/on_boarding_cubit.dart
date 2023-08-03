import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

import '../data/models/on_boarding_video_dto.dart';
import '../data/repositories/on_boarding_repository.dart';

part 'on_boarding_cubit.freezed.dart';

@singleton
class OnBoardingCubit extends Cubit<OnBoardingState> {
  final OnBoardingRepository _onBoardingRepository;

  OnBoardingCubit(
    this._onBoardingRepository,
  ) : super(const OnBoardingState.initialState()) {
    // _controller.initialize();
    //
    // getVideo().then((value) => _controller =
    //     VideoPlayerController.networkUrl(Uri(path: value.first.file)));
    // _controller.addListener(() {});
  }

  late VideoPlayerController _controller;

  Future<List<OnBoardingVideoDTO>> getVideo() async {
    emit(_LoadingState());
    final result = await _onBoardingRepository.onBoardingVideo();
    return result.fold((l) {
      return [];
    }, (r) {
      log('videos---${r.toList().toString()}');
      emit( _InitialPage(videoList: r.toList()));
      return r.toList();
    });
  }
}

@freezed
class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState.initialState(
      {@Default([]) List<OnBoardingVideoDTO> videoList}) = _InitialPage;

  const factory OnBoardingState.loadingState() = _LoadingState;

  const factory OnBoardingState.loaded() = _LoadedState;

  const factory OnBoardingState.errorState({
    required String message,
  }) = _ErrorState;
}
