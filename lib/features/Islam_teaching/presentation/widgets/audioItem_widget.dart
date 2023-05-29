import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class AudioItemWidget extends StatefulWidget {
  const AudioItemWidget({Key? key}) : super(key: key);

  @override
  State<AudioItemWidget> createState() => _AudioItemWidgetState();
}

class _AudioItemWidgetState extends State<AudioItemWidget> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Duration duration = Duration.zero; // For total duration
  Duration position = Duration.zero; // For the current position

  @override
  void initState() {
    super.initState();

    setAudioPlayer();

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

  Future<void> setAudioPlayer() async {
    final player = AudioCache(prefix: "assets/audios/");
    final url = await player.load("song.mp3");
    audioPlayer.setSourceUrl(url.path);
    audioPlayer.setReleaseMode(ReleaseMode.stop);
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
              isPlaying
                  ? await audioPlayer.pause()
                  : await audioPlayer.resume();
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
