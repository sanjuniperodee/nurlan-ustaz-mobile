import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

int selectedIndex = -1;

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GlobalCustomBody(
      child: SizedBox(
        height: 1.1.sh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: 15.h,
            ),
            CustomAppBar(
              title: 'Жоба туралы',
            ),
            SizedBox(
              height: 36.h,
            ),
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    AppColors.white.withOpacity(0.58),
                    AppColors.white.withOpacity(0.74)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                child: Container(
                  width: 163.w,
                  height: 44.h,
                  child: Image.asset(
                    Assets.logoNurlan,
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Жоба туралы жазылады. Жоба туралы жазылады. Жоба туралы жазылады. Жоба туралы жазылады. Жоба туралы жазы лады. Жоба туралы жазылады. Жоба туралы жазылады. Жоба туралы жазыла ды. Жоба туралы жазылады. Жоба туралы жазылады. Жоба туралы жазылады. Жоба туралы жазылады. Жоба туралы.',
              style: getTextStyle(CustomTextStyles.s16w400)
                  .copyWith(fontFamily: FontTypes.SF_Pro.name),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 96.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(28.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '200+',
                    style: getTextStyle(CustomTextStyles.s20w700).copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontTypes.Philosopher.name,color: AppColors.white),
                  ),
                  SizedBox(height: 4.h,),
                  Text('Түс жору',
                    style: getTextStyle(CustomTextStyles.s16w400).copyWith(

                        fontFamily: FontTypes.Philosopher.name,color: AppColors.white),)
                ],
              ),
            ),
            SizedBox(height: 16.h,),

            Container(
              height: 96.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(28.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '500+',
                    style: getTextStyle(CustomTextStyles.s20w700).copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontTypes.Philosopher.name,color: AppColors.white),
                  ),
                  SizedBox(height: 4.h,),
                  Text('Мұсылман есімдернің мағынасы',
                    style: getTextStyle(CustomTextStyles.s16w400).copyWith(

                        fontFamily: FontTypes.Philosopher.name,color: AppColors.white),)
                ],
              ),
            ),
            SizedBox(height: 16.h,),
            Container(
              height: 96.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(28.r)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '100+',
                    style: getTextStyle(CustomTextStyles.s20w700).copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontTypes.Philosopher.name,color: AppColors.white),
                  ),
                  SizedBox(height: 4.h,),
                  Text('Күнделікті дұғалар мен зікрлер',
                    style: getTextStyle(CustomTextStyles.s16w400).copyWith(

                        fontFamily: FontTypes.Philosopher.name,color: AppColors.white),)
                ],
              ),
            ),
            SizedBox(height: 200.h,)
          ]),
        ),
      ),
    ));
  }

  final List<CardModel> cards = List.generate(5, (index) {
    return CardModel(title: 'Карта', code: '6918 **** **89');
  });
}
