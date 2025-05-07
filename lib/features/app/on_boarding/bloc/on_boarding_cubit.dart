import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/update_service/app_version_model.dart';
import 'package:video_player/video_player.dart';

import '../data/models/on_boarding_video_dto.dart';
import '../data/repositories/on_boarding_repository.dart';

part 'on_boarding_cubit.freezed.dart';

@singleton
class OnBoardingCubit extends Cubit<OnBoardingState> {
  final OnBoardingRepository _onBoardingRepository;

  OnBoardingCubit(
    this._onBoardingRepository,
  ) : super(const OnBoardingState.initial()) {
    // _controller.initialize();
    //
    // getVideo().then((value) => _controller =
    //     VideoPlayerController.networkUrl(Uri(path: value.first.file)));
    // _controller.addListener(() {});
  }

  late VideoPlayerController _controller;

  Future<List<OnBoardingVideoDTO>> getVideo() async {
    emit(OnBoardingState.loading());
    final result = await _onBoardingRepository.onBoardingVideo();
    return result.fold((l) {
      return [];
    }, (r) {
      log('videos---${r.toList().toString()}');
      emit(OnBoardingState.initial(videoList: r.toList()));
      return r.toList();
    });
  }

  Future<AppVersionsModel?> getVersion() async {
    final result = await _onBoardingRepository.appVersionsModel();
    log('result from cubit - ${result.toString()}');
    return result;
  }
}

@freezed
sealed class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState.initial(
          {@Default([]) List<OnBoardingVideoDTO> videoList}) =
      OnBoardingInitialPage;
  const factory OnBoardingState.loading() = OnBoardingLoadingState;
  const factory OnBoardingState.loaded() = OnBoardingLoadedState;
  const factory OnBoardingState.error({
    required String message,
  }) = OnBoardingErrorState;
}
