import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';

import '../../bloc/app_bloc.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

CarouselController controller = CarouselController();
int currentIndex = 0;

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/on_boarding_background.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    carouselController: controller,
                    items: List.generate(
                        3,
                        (index) => Container(
                              width: 343.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/on_boarding_1.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                    options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 0.529,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DotsIndicator(
                          dotsCount: 3,
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
                          currentIndex != 2
                              ? controller.nextPage()
                              : BlocProvider.of<AppBloc>(context)
                              .add(const AppEvent.onboardingSave());
                        },
                        child: Text(
                          'Аумин 🤲',
                          style: getTextStyle(CustomTextStyles.s16w500).copyWith(
                              fontFamily: FontTypes.SF_Pro.name,
                              color: AppColors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
