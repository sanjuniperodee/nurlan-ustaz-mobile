// import 'package:altyn_belgi/core/extension/src/build_context.dart';
// import 'package:altyn_belgi/core/resources/resources.dart';
// import 'package:altyn_belgi/features/home_work/model/hw_question_dto.dart';
// import 'package:audioplayers/audioplayers.dart' as audio;
// import 'package:flutter/material.dart';
 
// class AudioQuestionAnswerWidget extends StatefulWidget {
//   final HwQuestionDTO question;
//   const AudioQuestionAnswerWidget({super.key, required this.question});
 
//   @override
//   State<AudioQuestionAnswerWidget> createState() =>
//       _AudioQuestionAnswerWidgetState();
// }
 
// class _AudioQuestionAnswerWidgetState extends State<AudioQuestionAnswerWidget> {
//   //audioplayers
//   final audioPlayer = audio.AudioPlayer();
//   bool isPlaying = false;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
 
//   @override
//   void initState() {
//     super.initState();
// //Listen to audio position
//     audioPlayer.onPlayerStateChanged.listen((state) {
//       setState(() {
//         isPlaying = state == audio.PlayerState.playing;
//       });
//     });
 
// //Listen to audio duration
//     audioPlayer.onDurationChanged.listen((newDuration) {
//       setState(() {
//         duration = newDuration;
//       });
//     });
 
//     //Listen to audio duration
//     audioPlayer.onPositionChanged.listen((newPosition) {
//       setState(() {
//         position = newPosition;
//       });
//     });
//   }
 
//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 68),
//       child: Column(
//         children: [
//           Text(
//             widget.question.title ?? "",
//             style: AppTextStyles.m16w500,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(
//             height: 41,
//           ),
//           if (widget.question.userResults != null &&
//               widget.question.userResults!.isNotEmpty &&
//               widget.question.userResults!.first.file != null)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade300,
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         if (audioPlayer.state == audio.PlayerState.playing) {
//                           audioPlayer.pause();
//                         } else if (audioPlayer.state ==
//                             audio.PlayerState.paused) {
//                           audioPlayer.resume();
//                         } else {
//                           audioPlayer.play(
//                             audio.UrlSource(
//                               widget.question.userResults!.first.file!,
//                             ),
//                           );
//                         }
//                       },
//                       icon: Icon(
//                         audioPlayer.state == audio.PlayerState.playing
//                             ? Icons.stop_rounded
//                             : Icons.play_arrow_rounded,
//                       ),
//                     ),
//                     Expanded(
//                       child: Slider(
//                         activeColor: AppColors.kPuple,
//                         inactiveColor: AppColors.kPuple.withOpacity(0.5),
//                         value: position.inMilliseconds.toDouble(),
//                         max: duration.inMilliseconds.toDouble(),
//                         onChanged: (value) async {
//                           final position =
//                               Duration(milliseconds: value.toInt());
//                           await audioPlayer.seek(position);
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           else
//             const Center(child: Text('Сіз бұл сұраққа жауап бермедіңіз')),
//           if (widget.question.answers != null &&
//               widget.question.answers!.isNotEmpty)
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 25,
//                 horizontal: 16,
//               ),
//               child: Center(
//                 child: Text(
//                   '${context.localized.rightAnswer}: ${widget.question.answers!.first.title}',
//                   textAlign: TextAlign.center,
//                   style: AppTextStyles.m16w500,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }