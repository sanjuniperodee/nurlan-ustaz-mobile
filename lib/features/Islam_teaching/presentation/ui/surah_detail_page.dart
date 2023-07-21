import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/audioItem_widget.dart';

class SurahDetailPage extends StatefulWidget {
  final ResultTeachingDTO result;
  const SurahDetailPage({super.key, required this.result});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  late bool isFavorite;
  @override
  void initState() {
    // TODO: implement initState
    isFavorite = widget.result.isSaved!;
    super.initState();
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
            Positioned(
                // left: 280.r,
                top: 10.r,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/x.png',
                    // colorBlendMode: ,
                    // opacity: 0.1,
                    width: 1.sw,
                  ),
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
                          height: 56.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  BlocProvider.of<SurahCubit>(context)
                                      .sura(page: 1, isFirstCall: true)
                                      .then((value) => Navigator.pop(context));
                                },
                                child: SvgPicture.asset(Assets.backButtonSvg)),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                widget.result.name ?? 'ERROR',
                                textAlign: TextAlign.center,
                                style: getTextStyle(CustomTextStyles.s20w700)
                                    .apply(color: AppColors.white),
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      showAlertDialog(context);
                                    },
                                    child: SvgPicture.asset(
                                        'assets/icons/nota.svg')),
                                SizedBox(
                                  width: 16.w,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      BlocProvider.of<SurahFavoriteCubit>(
                                              context)
                                          .surahFavorite(
                                              id: widget.result.id ?? 0);

                                      isFavorite = !isFavorite;
                                      setState(() {});
                                    },
                                    child: isFavorite
                                        ? SvgPicture.asset(
                                            Assets.bookMark1Svg,
                                          )
                                        : SvgPicture.asset(
                                            Assets.bookMarkSvg,
                                            color: AppColors.white,
                                          ))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        if (widget.result.ayats != null)
                          ListView.builder(
                            itemCount: widget.result.ayats?.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            widget.result.ayats![index].name ??
                                                'ERROR',
                                            style: getTextStyle(
                                                CustomTextStyles.s16w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 24.h,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            widget.result.ayats![index]
                                                    .arabic ??
                                                'ERROR',
                                            textAlign: TextAlign.left,
                                            style: getTextStyle(
                                                CustomTextStyles.s14w400),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Text(
                                          widget.result.ayats![index]
                                                  .transcription ??
                                              'ERROR',
                                          style: getTextStyle(
                                              CustomTextStyles.s16w400),
                                        ),
                                        SizedBox(
                                          height: 12.h,
                                        ),
                                        Text(
                                          widget.result.ayats![index]
                                                  .translation ??
                                              'ERROR',
                                          style: getTextStyle(
                                              CustomTextStyles.s16w400),
                                        ),
                                      ],
                                    )),
                              );
                            },
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

  showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10.0), // Set your desired border radius here
          ),
          title: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                Assets.cancelSvg,
                color: AppColors.black,
              ),
            ),
          ),
          content: SizedBox(
              height: 40,
              child: AudioItemWidget(audioUrl: widget.result.audio ?? '')),
        );
      },
    );
  }
}
