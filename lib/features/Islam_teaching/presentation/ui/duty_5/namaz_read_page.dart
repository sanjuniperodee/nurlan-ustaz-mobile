import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/namaz_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';

@RoutePage()
class NamazReadPage extends StatefulWidget {
  final int id;
  final String gender;
  final String type;
  const NamazReadPage(
      {super.key, required this.id, required this.gender, required this.type});

  @override
  State<NamazReadPage> createState() => _NamazReadPageState();
}

int currentIndex = 0;

class _NamazReadPageState extends State<NamazReadPage> {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    BlocProvider.of<NamazDetailCubit>(context)
        .namazDetail(gender: widget.gender, id: widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NamazDetailCubit, NamazDetailState>(
      listener: (context, state) {
        if (state is NamazDetailErrorState) {
          buildErrorCustomSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        // TODO: error widget
        if (state is! NamazDetailLoadedState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.linearBlue,
            ),
          );
        }

        final namaz = state.namaz;
        return Scaffold(
          backgroundColor: AppColors.lightBlue,
          bottomSheet: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              decoration: const BoxDecoration(color: AppColors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (_pageController.page! > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.orange,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_pageController.page! < namaz.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.orange,
                    ),
                  )
                ],
              )),
          body: SizedBox(
            height: 1.sh,
            child: Stack(
              children: [
                Image.asset(
                  Assets.gradient,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                    // left: 280.r,
                    child: Opacity(
                  opacity: 0.5,
                  child: Lottie.asset('assets/animations/Book_V04.json',
                      fit: BoxFit.cover),
                )),
                SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 56.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomAppBar(
                          title: widget.type,
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: namaz.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // height: 0.8.sh,
                              decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(24)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        namaz[index].title ?? 'ERROR',
                                        style: getTextStyle(
                                                CustomTextStyles.s20w700)
                                            .apply(color: AppColors.black),
                                      ),
                                      SizedBox(height: 16.h),
                                      Center(
                                          child: HtmlWidget(
                                        namaz[index].text ?? '',
                                        onErrorBuilder:
                                            (context, element, error) =>
                                                Text('$element error: $error'),
                                        onLoadingBuilder: (context, element,
                                                loadingProgress) =>
                                            const CircularProgressIndicator(),
                                      )),
                                      SizedBox(
                                        height: 86.h,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
