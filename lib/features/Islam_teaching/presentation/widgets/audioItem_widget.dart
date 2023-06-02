import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class AudioItemWidget extends StatefulWidget {
  final String audioUrl;
  const AudioItemWidget({Key? key, required this.audioUrl}) : super(key: key);

  @override
  State<AudioItemWidget> createState() => _AudioItemWidgetState();
}

class _AudioItemWidgetState extends State<AudioItemWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState? audioPlayerState;
  bool isPlaying = false;

  Duration duration = Duration.zero; // For total duration
  Duration position = Duration.zero; // For the current position

  @override
  void initState() {
    super.initState();

    audioPlayer = AudioPlayer();
    audioPlayerState = PlayerState.stopped;

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });

    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  Future<void> play() async {
    await audioPlayer.play(UrlSource(widget.audioUrl));
    log(widget.audioUrl);

    setState(() {
      audioPlayerState = PlayerState.playing;
    });
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    setState(() {
      audioPlayerState = PlayerState.paused;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              play();
            },
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              color: AppColors.orange,
              size: 40.h,
            ),
          ),
          Slider(
            value: position.inMilliseconds.toDouble(),
            max: duration.inMilliseconds.toDouble(),
            activeColor: AppColors.orange,
            inactiveColor: AppColors.orange,
            onChanged: (value) {
              setState(() {
                position = Duration(milliseconds: value.toInt());
              });
              audioPlayer.seek(position);
            },
          ),
        ],
      ),
    );
  }
}
