import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class SurahDetailPage extends StatefulWidget {
  const SurahDetailPage({super.key});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  bool favorite = false;
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
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(Assets.backButtonSvg)),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Фатиха',
                                textAlign: TextAlign.center,
                                style: getTextStyle(CustomTextStyles.s20w700)
                                    .apply(color: AppColors.white),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.music_note_outlined,
                                  color: AppColors.white,
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        favorite = !favorite;
                                      });
                                    },
                                    child: SvgPicture.asset(favorite
                                        ? Assets.bookMark1Svg
                                        : Assets.bookMarkSvg))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(24)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '1:1',
                                        style: getTextStyle(
                                            CustomTextStyles.s16w400),
                                      ),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'بِسْمِ اللّهِ الرَّحْمـَنِ الرَّحِيم',
                                          textAlign: TextAlign.left,
                                          style: getTextStyle(
                                              CustomTextStyles.s14w400),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                                        'Бисмил-лә һир-рахмәнир-рахим,\n\nРахман һәм Рахымды Аллаһтың атымен бастаймын.',
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
}
