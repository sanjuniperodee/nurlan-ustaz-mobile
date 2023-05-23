import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/ayat_day__card_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

class AyatDayPage extends StatefulWidget {
  const AyatDayPage({super.key});

  @override
  State<AyatDayPage> createState() => _AyatDayPageState();
}

class _AyatDayPageState extends State<AyatDayPage> {
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 46.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CustomAppBar(
                          title: 'Қызметтер',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.lightBlue.withOpacity(0.3),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Күн аяты ',
                                  style: getTextStyle(CustomTextStyles.s20w700)
                                      .apply(color: AppColors.black),
                                ),
                                Text(
                                  ' 7:205',
                                  style: getTextStyle(CustomTextStyles.s20w700)
                                      .apply(color: AppColors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              'وَاذْكُرْ رَبَّكَ فِي نَفْسِكَ تَضَرُّعًا وَخِيفَةً وَدُونَ الْجَهْرِ مِنَ الْقَوْلِ بِالْغُدُوِّ وَالْآصَالِ وَلَا تَكُنْ مِنَ الْغَافِلِ',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            Text(
                              'Және Раббыңды жалбарына әрі қорыққан түрде ішіңнен және жария емес кейіпте таңертең және кешке (күн батардан бұрын) есіңе ал да, ғапыл қалушылардан болма.  Және Раббыңды жалбарына әрі қорыққан түрде ішіңнен және жария емес кейіпте таңертең және кешке (күн батардан бұрын) есіңе ал да, ғапыл қалушылардан болма.  Және Раббыңды жалбарына әрі қорыққан түрде ішіңнен және жария емес кейіпте таңертең және кешке (күн батардан бұрын) есіңе ал да, ғапыл қалушылардан болма.  Және Раббыңды жалбарына әрі қорыққан түрде ішіңнен және жария емес кейіпте таңертең және кешке (күн батардан бұрын) есіңе ал да, ғапыл қалушылардан болма.',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
