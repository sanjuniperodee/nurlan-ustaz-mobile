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
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int currentIndex = 0;
  final PageController _pageController = PageController();
  final List<String> videos = [
    'assets/video/1_v.MP4',
    'assets/video/2.mp4',
    'assets/video/3_v.mp4',
    'assets/video/4_v.mp4'
  ];

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(videos.first)
      ..initialize().then((_) {
        setState(() {
          _createChewieController();
        });
      });

    _videoPlayerController.addListener(_videoPlayerListener);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
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
              return _buildOnBoardingWidget();
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
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context, position) {
                return GestureDetector(
                  onLongPress: () {
                    _chewieController?.pause();
                  },
                  onLongPressEnd: (sir) {
                    _chewieController?.play();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: _chewieController != null &&
                        _chewieController!.videoPlayerController.value.isInitialized
                        ? Chewie(
                      controller: _chewieController!,
                    )
                        : const SizedBox(),
                  ),
                );
              },
              itemCount: videos.length,
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
                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
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
    if (currentIndex != index) {
      // Dispose of the old video controller
      _videoPlayerController.dispose();

      // Update the currentIndex to the selected index
      currentIndex = index;

      try {
        // Create and initialize a new video controller for the selected video
        _videoPlayerController = VideoPlayerController.asset(
          videos[currentIndex],
        );
        await _videoPlayerController.initialize();
         _videoPlayerController.addListener(_videoPlayerListener);

        // Create a new ChewieController for the new video
        _createChewieController();

        // Ensure that video playback starts
        _chewieController?.play();
      } catch (error) {
        // Handle any errors that may occur during video initialization
        print("Error initializing video: $error");
      }

      setState(() {});
    }
  }

  void _onNextButtonPressed() async {
    if (currentIndex < videos.length - 1) {
      // Increment the currentIndex to move to the next video
      currentIndex++;

      // Dispose of the old video controller
      _videoPlayerController.dispose();

      // Create and initialize a new video controller for the next video
      _videoPlayerController = VideoPlayerController.asset(
        videos[currentIndex],
      );
      await _videoPlayerController.initialize();

      // Create a new ChewieController for the new video
      _createChewieController();
      setState(() {});
    } else {
      // Handle the case when the last video is reached
      // For example, you can navigate to another screen or perform an action.
      // Here, we are adding an event to a Bloc.
      BlocProvider.of<AppBloc>(context).add(const AppEvent.onboardingSave());
    }
  }

  Future<void> _videoPlayerListener() async {
    if (_videoPlayerController.value.position >= _videoPlayerController.value.duration) {
      if (currentIndex < videos.length - 1) {
        // Play the next video
        await _playNextVideo();
      } else {
        // Last video has ended, handle as needed
        BlocProvider.of<AppBloc>(context).add(const AppEvent.onboardingSave());
      }
    }
  }

  Future<void> _playNextVideo() async {
    currentIndex++;

    // Dispose of the old video controller and chewie controller
    await _disposeControllers();

    // Initialize a new video controller for the next video
    _videoPlayerController = VideoPlayerController.asset(
      videos[currentIndex],
    );

    // Set up listener for the new video controller
    _videoPlayerController.addListener(_videoPlayerListener);

    await _videoPlayerController.initialize();

    // Create a new ChewieController for the new video
    _createChewieController();
    setState(() {});
  }

  Future<void> _disposeControllers() async {
    await _videoPlayerController.dispose();
     _chewieController?.dispose();
  }

}
