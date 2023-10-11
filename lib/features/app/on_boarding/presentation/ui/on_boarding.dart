import 'dart:developer';
import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_ip_address/get_ip_address.dart';
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
  // ChewieController? _chewieController;
  int currentIndex = 0;
  final PageController _pageController = PageController();
  List<String> videos = [
    'assets/video/1_v.MP4',
    'assets/video/2.mp4',
    'assets/video/3_v.mp4',
    'assets/video/4_v.mp4'
  ];
  List<VideoPlayerController> _videoPlayerControllers = [];
  List<ChewieController?> _chewieControllers = [];
  @override
  void initState() {
    super.initState();
    _videoPlayerControllers = List.generate(videos.length, (index) {
      return VideoPlayerController.asset(videos[index])
        ..initialize().then((_) {
          setState(() {
            _chewieControllers.add(_createChewieController(index));
          });
        })
        ..addListener(_videoPlayerListener);
    });
  }

  @override
  void dispose() {
    for (var element in _videoPlayerControllers) {
      element.dispose();
    }
    for (var element in _chewieControllers) {
      element!.dispose();
    }
    // _chewieController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  ChewieController _createChewieController(int index) {
    return ChewieController(
      videoPlayerController: _videoPlayerControllers[index],
      aspectRatio: MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height,
      autoPlay: true,
      looping: false,
      showControls: false,
      progressIndicatorDelay: Duration(milliseconds: 20 ?? 0),
      hideControlsTimer: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return Container();
            },
            initialState: (_) {
              return _chewieControllers.isNotEmpty
                  ? _buildOnBoardingWidget()
                  : SizedBox();
            },
          );
        },
      ),
    );
  }

  Widget _buildOnBoardingWidget() {
    return Center(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/on_boarding_background.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned.fill(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: videos.length,
              controller: _pageController,
              itemBuilder: (context, position) {
                if (position == 0) {
                  _chewieControllers.first?.play();
                }
                return GestureDetector(
                  onLongPress: () {
                    _chewieControllers[position]?.pause();
                  },
                  onLongPressEnd: (sir) {
                    _chewieControllers[position]?.play();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: _chewieControllers[position] != null &&
                            _chewieControllers[position]!
                                .videoPlayerController
                                .value
                                .isInitialized
                        ? Chewie(
                            controller: _chewieControllers[position]!,
                          )
                        : const SizedBox(),
                  ),
                );
              },
              onPageChanged: (index) async {
                _onPageChanged(index);
              },
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
                    dotsCount: videos.length,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      size: Size(8.w, 8.h),
                      color: AppColors.white.withOpacity(0.1),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                      activeColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0.r),
                      ),
                    ),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                    onPressed: () {
                      _onNextButtonPressed();
                    },
                    child: Text(
                      'Аумин 🤲',
                      style: getTextStyle(CustomTextStyles.s16w500).copyWith(
                        fontFamily: FontTypes.SF_Pro.name,
                        color: AppColors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPageChanged(int index) async {
    try {
      log("currentIndex ==== $currentIndex");
      _chewieControllers[currentIndex]?.pause();
      currentIndex = index;
      _chewieControllers[index]?.play();
      log("currentIndex1 ==== $currentIndex");
    } catch (error) {
      print("Error initializing video: $error");
    }
    setState(() {});
  }

  void _onNextButtonPressed() async {
    if (currentIndex < videos.length - 1) {
      // Increment the currentIndex to move to the next video

      log("currentIndex2 ==== $currentIndex");
      _chewieControllers[currentIndex]?.pause();
      currentIndex++;
      _chewieControllers[currentIndex]?.play();

      log("currentIndex3 ==== $currentIndex");
      _pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
      setState(() {});
    } else {
      // Handle the case when the last video is reached
      // For example, you can navigate to another screen or perform an action.
      // Here, we are adding an event to a Bloc.
      // BlocProvider.of<AppBloc>(context).add(const AppEvent.onboardingSave());
    }
  }

  Future<void> _videoPlayerListener() async {
    if (_videoPlayerControllers[currentIndex].value.position.inSeconds > 0) {
      log("${_videoPlayerControllers[currentIndex].value.position == _videoPlayerControllers[currentIndex].value.duration}");
      if (_videoPlayerControllers[currentIndex].value.position ==
          _videoPlayerControllers[currentIndex].value.duration) {
        if (currentIndex < videos.length - 1) {
          // _chewieControllers[currentIndex]?.pause();
          setState(() {});
          _pageController.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.ease);

          currentIndex++;

          _chewieControllers[currentIndex]?.play();
        } else {
          // Last video has ended, handle as needed
          // BlocProvider.of<AppBloc>(context).add(const AppEvent.onboardingSave());
        }
      }
    }
  }
}
