import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/audioItem_widget.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/bottom_sheet.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';

import '../widgets/dhikr_button_widget.dart';

@RoutePage()
class DhikrDetailPage extends StatefulWidget {
  final ResultTeachingDTO result;

  const DhikrDetailPage({super.key, required this.result});

  @override
  State<DhikrDetailPage> createState() => _DhikrDetailPageState();
}

class _DhikrDetailPageState extends State<DhikrDetailPage> {
  int _counter = 0;
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.result.isSaved!;
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
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
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 36.h,
                        ),
                        CustomAppBar(
                          title: widget.result.name ?? 'ERROR',
                          onTap: () {
                            BlocProvider.of<DhikrsCubit>(context)
                                .dhikrs(page: 1, isFirstCall: true)
                                .then((value) => Navigator.pop(context));
                          },
                        ),
                        SizedBox(
                          height: 56.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<DhikrsFavoriteCubit>(
                                                context)
                                            .dhikrsFavorite(
                                                id: widget.result.id ?? 0);
                                        isFavorite = !isFavorite;
                                        setState(() {});
                                      },
                                      child: SvgPicture.asset(isFavorite
                                          ? Assets.bookMark1Svg
                                          : Assets.bookMarkSvg))),
                              SizedBox(
                                height: 60.h,
                              ),
                              Text(
                                widget.result.arabic ?? 'ERROR',
                                style: getTextStyle(CustomTextStyles.s16w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                widget.result.transcription ?? 'ERROR',
                                style: getTextStyle(CustomTextStyles.s16w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              Text(
                                widget.result.translation ?? 'ERRROR',
                                style: getTextStyle(CustomTextStyles.s16w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 90.h,
                              ),
                              if (widget.result.audio != null)
                                AudioItemWidget(
                                  audioUrl: widget.result.audio ?? '',
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DhikrButtonWidget(
                              svg: Assets.replaySvg,
                              onTap: _resetCounter,
                            ),
                            InkWell(
                              onTap: _incrementCounter,
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient:
                                        AppColors.gradientPrimaryActiveButton,
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                        vertical: 52, horizontal: 60)
                                    .r,
                                child: Text(
                                  '$_counter',
                                  style: getTextStyle(CustomTextStyles.s20w700)
                                      .apply(color: AppColors.white),
                                ),
                              ),
                            ),
                            DhikrButtonWidget(
                              onTap: () {
                                bottomSheet(
                                  FractionallySizedBox(
                                    heightFactor: 0.7,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: SvgPicture.asset(
                                              Assets.cancelSvg,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Text(
                                            widget.result.description ??
                                                'ERROR',
                                            style: getTextStyle(
                                                    CustomTextStyles.s16w400)
                                                .apply(color: AppColors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  context,
                                );
                              },
                              svg: Assets.infoCircleSvg,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
