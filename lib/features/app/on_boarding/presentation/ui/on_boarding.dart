import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/bloc/on_boarding_cubit.dart';
import 'package:video_player/video_player.dart';

import '../../../bloc/app_bloc.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    await BlocProvider.of<OnBoardingCubit>(context)
        .getVideo()
        .then((value) async {
      _videoPlayerController1 =
          VideoPlayerController.networkUrl(Uri.parse(value.first.file));
      await Future.wait([
        _videoPlayerController1.initialize(),
      ]);
      log("message1");
    });
    _createChewieController();
    setState(() {});
  }

  // Future<void> initializePlayer() async {
  //   try {
  //     _videoPlayerController1 = VideoPlayerController.networkUrl(Uri.parse(
  //         "https://dev.nurlanustaz.kz/api/media/support/onboardings/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"));
  //     await Future.wait([
  //       _videoPlayerController1.initialize(),
  //     ]);
  //   } catch (e) {
  //     log(e.toString());
  //   }

  //   _createChewieController();
  //   setState(() {});
  // }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      showControls: false,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      hideControlsTimer: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return Container();
          }, initialState: (videoList) {
            // final playerWidget =;

            return Center(
              child: Stack(children: [
                Image.asset(
                  'assets/images/on_boarding_background.png',
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Positioned.fill(
                  child: Container(
                    width: 343.w,
                    height: 1.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: _chewieController != null &&
                            _chewieController!
                                .videoPlayerController.value.isInitialized
                        ? Chewie(
                            controller: _chewieController!,
                          )
                        : const SizedBox(),
                  ),
                ),
                Positioned.fill(
                  top: 720.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DotsIndicator(
                            dotsCount: videoList.length,
                            position: currentIndex / 1,
                            decorator: DotsDecorator(
                                size: Size(8.w, 8.h),
                                color: AppColors.white.withOpacity(0.1),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0.r)),
                                activeColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(5.0.r)))),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                          onPressed: () async {
                            if (currentIndex != videoList.length - 1) {
                              _videoPlayerController1.pause();
                              _videoPlayerController1 =
                                  VideoPlayerController.networkUrl(
                                Uri.parse(videoList[currentIndex + 1].file),
                              );

                              await Future.wait([
                                _videoPlayerController1.initialize(),
                              ]);
                              _createChewieController();
                              // initializePlayer();
                              setState(() {});

                              currentIndex++;
                            } else {
                              _videoPlayerController1.pause();
                              _videoPlayerController1.dispose();
                              setState(() {});
                              BlocProvider.of<AppBloc>(context)
                                  .add(const AppEvent.onboardingSave());
                            }
                          },
                          child: Text(
                            'Аумин 🤲',
                            style: getTextStyle(CustomTextStyles.s16w500)
                                .copyWith(
                                    fontFamily: FontTypes.SF_Pro.name,
                                    color: AppColors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            );
          });
        },
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     children: <Widget>[
    //       Expanded(
    //         child: Center(
    //           child: _chewieController != null &&
    //                   _chewieController!
    //                       .videoPlayerController.value.isInitialized
    //               ? Chewie(
    //                   controller: _chewieController!,
    //                 )
    //               : const Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     CircularProgressIndicator(),
    //                     SizedBox(height: 20),
    //                     Text('Loading'),
    //                   ],
    //                 ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// late VideoPlayerController _controller;
// late BetterPlayerController _betterPlayerController;

// ChewieController? chewieController;
// @override
// void initState() {
//   super.initState();
//   initializePlayer();
// }

// @override
// Widget build(BuildContext context) {}
