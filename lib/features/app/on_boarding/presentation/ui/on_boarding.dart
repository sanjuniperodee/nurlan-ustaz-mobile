
import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
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

CarouselController controller = CarouselController();
int currentIndex = 0;

class _OnBoardingPageState extends State<OnBoardingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // _controller.initialize().then((_) => setState(() {}));
    BlocProvider.of<OnBoardingCubit>(context).getVideo().then((value) {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse('${value.first.file}'));
    }); //   _controller =
    //       VideoPlayerController.networkUrl(Uri(path: value.first.file));
    //   setState(() {});
    // });

    // _controller.addListener(() {
    //   setState(() {});
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return Container();
          }, initialState: (videoList){

            final chewieController = ChewieController(
              videoPlayerController: _controller,
              autoPlay: true,
              looping: false,
              aspectRatio: 0.42.sp,
              showOptions: false,
              showControls: false,
            );

            final playerWidget = Chewie(
              controller: chewieController,
            );

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
                    height: 648.h,
                    child: playerWidget,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 720.h,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DotsIndicator(
                            dotsCount: videoList.length,
                            position: currentIndex,
                            decorator: DotsDecorator(
                                size: Size(8.w, 8.h),
                                color: AppColors.white.withOpacity(0.1),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0.r)),
                                activeColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0.r)))),
                        InkWell(
                          onTap: () {
                            if (currentIndex != videoList.length - 1) {
                              _controller = VideoPlayerController.networkUrl(
                                  Uri.parse('${videoList[1].file}'));
                              setState(() {});

                              currentIndex++;
                            } else {
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
  }
}
