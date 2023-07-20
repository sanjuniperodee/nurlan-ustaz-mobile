

import 'dart:developer';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class AudioItemWidget extends StatefulWidget {
  final String audioUrl;
  const AudioItemWidget({super.key, required this.audioUrl});

  @override
  State<AudioItemWidget> createState() => _AudioItemWidgetState();
}

class _AudioItemWidgetState extends State<AudioItemWidget> {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  // static const url1 = widget.url;

  late AudioPlayer _audioPlayer;
  @override
  void initState() {
    super.initState();
    log(widget.audioUrl.toString());
    _init();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setUrl(widget.audioUrl);

    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });

    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ).r,
      // height: 100,
      child: Row(
        children: [
          ValueListenableBuilder<ButtonState>(
            valueListenable: buttonNotifier,
            builder: (_, value, __) {
              switch (value) {
                case ButtonState.loading:
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 40.h,
                    height: 40.h,
                    child: const CircularProgressIndicator(),
                  );
                case ButtonState.paused:
                  return IconButton(
                    icon: const Icon(Icons.play_arrow),
                    iconSize: 40.h,
                    onPressed: play,
                    color: AppColors.orange,
                  );
                case ButtonState.playing:
                  return IconButton(
                    icon: const Icon(Icons.pause),
                    iconSize: 40.h,
                    onPressed: pause,
                    color: AppColors.orange,
                  );
              }
            },
          ),
          Expanded(
            child: ValueListenableBuilder<ProgressBarState>(
              valueListenable: progressNotifier,
              builder: (_, value, __) {
                return Padding(
                  padding: const EdgeInsets.only(top: 13.0, left: 8, right: 8),
                  child: ProgressBar(
                    baseBarColor: AppColors.orange,
                    progressBarColor: AppColors.orange,
                    bufferedBarColor: AppColors.orange,
                    thumbColor: AppColors.orange,
                    progress: value.current,
                    buffered: value.buffered,
                    total: value.total,
                    onSeek: seek,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
