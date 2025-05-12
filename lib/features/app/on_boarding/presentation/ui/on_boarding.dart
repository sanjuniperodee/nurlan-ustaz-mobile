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
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // ChewieController? _chewieController;
  int currentIndex = 0;
  final PageController _pageController = PageController();
  final List<Chewie> _chewieWidgets = [];
  final List<ChewieController> _chewieControllers = [];
  List<VideoPlayerController> videos = [
    VideoPlayerController.asset(
      'assets/video/1_v.MP4',
    ),
    VideoPlayerController.asset(
      'assets/video/2.mp4',
    ),
    VideoPlayerController.asset(
      'assets/video/3_v.mp4',
    ),
    VideoPlayerController.asset(
      'assets/video/4_v.mp4',
    )
  ];
  @override
  void initState() {
    initVideos().then((_) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> initVideos() async {
    for (var element in videos) {
      await element.initialize();
      _chewieControllers.add(ChewieController(
        videoPlayerController: element,
        aspectRatio: 1.sw / 1.sh,
        autoPlay: false,
        looping: false,
        showControls: false,
        progressIndicatorDelay: Duration(milliseconds: 20),
        hideControlsTimer: const Duration(seconds: 1),
      ));
      element.addListener(_videoPlayerListener);
    }
    for (var element in _chewieControllers) {
      _chewieWidgets.add(
        Chewie(
          controller: element,
        ),
      );
    }
  }

  @override
  void dispose() {
    for (var element in videos) {
      element.dispose();
    }
    for (var element in _chewieControllers) {
      element.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OnBoardingInitialPage) {
            return _chewieWidgets.length == videos.length
                ? _buildOnBoardingWidget()
                : Image.asset(
                    'assets/images/bg.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildOnBoardingWidget() {
    _chewieControllers[currentIndex].play();
    return Center(
      child: Stack(
        children: [
          Positioned.fill(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _chewieWidgets,
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
                    // TODO(Radomir): temporary dividing by 1. Expected double,
                    // perhaps, for smooth animation
                    position: currentIndex / 1,
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
      _chewieControllers[currentIndex].pause();
      currentIndex = index;
      _chewieControllers[index].play();
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
      _chewieControllers[currentIndex].pause();
      currentIndex++;
      _chewieControllers[currentIndex].play();

      log("currentIndex3 ==== $currentIndex");
      _pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
      setState(() {});
    } else {
      BlocProvider.of<AppBloc>(context).add(const AppEvent.onboardingSave());
    }
  }

  Future<void> _videoPlayerListener() async {
    if (videos[currentIndex].value.position.inSeconds > 0) {
      if (videos[currentIndex].value.position ==
          videos[currentIndex].value.duration) {
        if (currentIndex < videos.length - 1) {
          // _chewieControllers[currentIndex]?.pause();
          setState(() {});
          _pageController.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.ease);

          currentIndex++;

          _chewieControllers[currentIndex].play();
        } else {
          // Last video has ended, handle as needed
          BlocProvider.of<AppBloc>(context)
              .add(const AppEvent.onboardingSave());
        }
      }
    }
  }
}
