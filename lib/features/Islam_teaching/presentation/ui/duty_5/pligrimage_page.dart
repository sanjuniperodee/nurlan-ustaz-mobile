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

class PligrimagePage extends StatefulWidget {
  const PligrimagePage({super.key});

  @override
  State<PligrimagePage> createState() => _PligrimagePageState();
}

class _PligrimagePageState extends State<PligrimagePage> {
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
            text: 'Қажылық'),
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
                          title: 'Қажылық',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      const ContainerDutyWidget(
                          title: 'Қажылықтың маңызы және пайдалары',
                          body:
                              'Исламның бес шартының бесіншісі – қажылық. Қажылық белгілі уақытта, белгілі мекендерді арнайы түрде зиярат ету.Хижреттің тоғызыншы жылында парыз болған. Қажылық әрі дүние-мүлік, әрі дене арқылы жүзеге асатын ғибадат. Белгілі шарттарға сай әр мұсылманға өмірінде бір рет қажылыққа бару парыз. Алланың басқа әмірлеріндегідей қажылықтың да хикметі мен пайдалары бар.Әр түрлі елдерден қасиетті жерге келетін тілдері мен түстері әртүрлі мұсылмандардың бір ғана мақсатпен жиналуы және бірге Аллаға бет бұруы, Ислам бауырмалдығы мен достығын нығайтады. Мұсылмандардың бір-бірімен танысуы бір-бірінің қиындықтары мен дерттеріне шара тауып, бір-біріне жәрдемдесуін қамтамасыз етеді.Бай болсын, кедей болсын бүкіл мұсылмандар ихрам киіп, бірдей киімді болуы адамдарға теңдікті түсіндіріп, махшар күнін еске салады. Қажылық сапары адамның білімі мен көрегенділігін арттырады, қиыншылықтарға төтеп беруді үйретеді. Шыдам мен төзімге тәрбиелейді. Дүние-мүлікке қызықпай кедейлерге деген мейірім және қамқорлық сезімдерін дамытады.Пайғамбарымыз туып-өскен, Ислам діні жер-жаһанға тарала бастаған қасиетті жерлерді көру – мүминдердің жан-дүниесін толқытады, діни сезімдері артады, киелі жерлерде адам өзін Аллаға жақын сезінеді. Ал оның жасаған ғибадаттарына еселеп сауап жазылады. Алла разылығы үшін қажылық міндетін атқарған және адамдарға жаманшылық жасаудан сақтанған адамдардың (кісі ақысынан басқа) көптеген күнәлары кешіріледі. Бұл жөнінде пайғамбарымыз былай дейді:')
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
