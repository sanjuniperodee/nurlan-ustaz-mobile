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
  PlayerState audioPlayerState = PlayerState.paused;
  String url =
      'http://86.107.45.90:8000/api/media/knowledge/names_of_allah/аттахият_uZxzPO7.mp3';

  /// Optional
  int timeProgress = 0;
  int audioDuration = 0;

  @override
  void initState() {
    super.initState();

    /// Compulsory
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        audioPlayerState = state;
      });
    });

    /// Optional
    audioPlayer.setSource(UrlSource(
        url)); // Triggers the onDurationChanged listener and sets the max duration string
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        audioDuration = duration.inSeconds;
      });
    });
    audioPlayer.onPositionChanged.listen((Duration position) async {
      setState(() {
        timeProgress = position.inSeconds;
      });
    });
  }

  /// Compulsory
  @override
  void dispose() {
    audioPlayer.release();
    audioPlayer.dispose();
    super.dispose();
  }

  /// Compulsory
  playMusic() async {
    // Add the parameter "isLocal: true" if you want to access a local file
    await audioPlayer.play(UrlSource(url));
  }

  /// Compulsory
  pauseMusic() async {
    await audioPlayer.pause();
  }

  /// Optional
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer
        .seek(newPos); // Jumps to the given position within the audio file
  }

  /// Optional
  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
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
              audioPlayerState == PlayerState.playing
                  ? pauseMusic()
                  : playMusic();
            },
            child: Icon(
              audioPlayerState == PlayerState.playing
                  ? Icons.pause
                  : Icons.play_arrow,
              color: AppColors.orange,
              size: 40.h,
            ),
          ),
          Slider(
            value: timeProgress.toDouble(),
            max: audioDuration.toDouble(),
            onChanged: (value) {
              seekToSec(value.toInt());
            },
            activeColor: AppColors.orange,
            inactiveColor: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
