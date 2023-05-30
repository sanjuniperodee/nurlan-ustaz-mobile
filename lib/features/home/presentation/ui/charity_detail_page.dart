import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:flutter/services.dart';

class CharityDetailPage extends StatefulWidget {
  const CharityDetailPage({super.key});

  @override
  State<CharityDetailPage> createState() => _CharityDetailPageState();
}

class _CharityDetailPageState extends State<CharityDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/charity.png',
                fit: BoxFit.cover,
                width: 1.sw,
              ),
              Positioned(
                  top: 54.r,
                  left: 16.r,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(Assets.backStackSvg))),
            ],
          ),
          Positioned(
              top: 279.r,
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(30).r,
                      topLeft: const Radius.circular(30).r,
                    )),
                padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Харекет қайырымдылық қоры',
                      style: getTextStyle(CustomTextStyles.s20w700)
                          .apply(color: AppColors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Благотворительный Фонд «Харекет» основан 07 октября 2017 года в рамках проекта «ЖИЛЬЕ – ЗА 1000 ТЕНГЕ» в городе Алматы. С момента основание фонд приобрел более 650 домов нуждающимся семьям и у четырех тысяч детей появились собственные дома.',
                      style: getTextStyle(CustomTextStyles.s16w400)
                          .apply(color: AppColors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Реквизиты',
                      style: getTextStyle(CustomTextStyles.s20w700)
                          .apply(color: AppColors.black),
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0).r,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.orange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20).r),
                            child: Theme(
                              data: theme,
                              child: ExpansionTile(
                                collapsedIconColor: AppColors.orange,
                                iconColor: AppColors.orange,
                                title: Text(
                                  'Каспи (Гүлмира Мұқанқызы)',
                                  style: getTextStyle(CustomTextStyles.s14w400),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    minLeadingWidth: 0,
                                    leading:
                                        SvgPicture.asset(Assets.paymentCardSvg),
                                    title: Text(
                                      '4440 4440 0000 0000',
                                      style: getTextStyle(
                                          CustomTextStyles.s14w400),
                                    ),
                                    trailing:
                                        SvgPicture.asset(Assets.copiedSvg),
                                  ),
                                  ListTile(
                                    minLeadingWidth: 0,
                                    leading: SvgPicture.asset(Assets.phoneSvg),
                                    title: Text(
                                      '+7 777 777 77 77',
                                      style: getTextStyle(
                                          CustomTextStyles.s14w400),
                                    ),
                                    trailing: InkWell(
                                        onTap: () async {
                                          await Clipboard.setData(
                                              const ClipboardData(
                                                  text: "your text"));
                                        },
                                        child:
                                            SvgPicture.asset(Assets.copiedSvg)),
                                  ),
                                  ListTile(
                                    minLeadingWidth: 0,
                                    leading: SvgPicture.asset(Assets.dontSvg),
                                    title: Text(
                                      '720 208 401 907',
                                      style: getTextStyle(
                                          CustomTextStyles.s14w400),
                                    ),
                                    trailing: InkWell(
                                        onTap: () async {
                                          await Clipboard.setData(
                                              const ClipboardData(
                                                  text: "your text"));
                                        },
                                        child:
                                            SvgPicture.asset(Assets.copiedSvg)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
