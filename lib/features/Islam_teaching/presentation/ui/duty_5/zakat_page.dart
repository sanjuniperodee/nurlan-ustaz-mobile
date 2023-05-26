import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/container_duty_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

import '../../../../../core/common/app_styles.dart';

class ZakatPage extends StatefulWidget {
  const ZakatPage({super.key});

  @override
  State<ZakatPage> createState() => _ZakatPageState();
}

class _ZakatPageState extends State<ZakatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(color: AppColors.white),
        child: AppButton(
            onTap: () {
              // context.router.push(const NamePageRoute());
            },
            text: 'Зекет беру'),
      ),
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
                          title: 'Зекет',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      const ContainerDutyWidget(
                          title: 'Зекет',
                          body:
                              'Өзара бауырмалдық пен жанашырлыққа, адамгершілік пен гуманизмге негізделген салауатты қоғам құруды мақсат ететін Ислам дінінде әр мұсылманға бес парыздың жүктелетіні белгілі. Парыз дегеніміз, бұлтартпас дәлелдермен әмір етілген діни іс-әрекеттер мен міндеттер. Парыз деп бекітілген істерді қандай да бір себеппен орындамау адамды жауапкершіліктен босатпайды. Осы себепті зекет туралы сөз қозғағанда, оның парыздығын жете түсіну маңызды. Дегенмен зекет беру кімдерге парыз деген мәселеге келсек, мұсылман болуы, нисап (85 гр. алтын) көлеміне жететін немесе одан да көп байлыққа ие болу, зекеті берілетін байлықтың өсімділігі, зекеті берілетін байлыққа бір жыл толуы, қарыз болмауы, зекеті берілетін байлыққа толық ие болу сынды талаптары барын көреміз.')
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
