import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/container_duty_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';


class OrazaPage extends StatefulWidget {
  const OrazaPage({super.key});

  @override
  State<OrazaPage> createState() => _OrazaPageState();
}

class _OrazaPageState extends State<OrazaPage> {
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
                          title: 'Ораза',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      ContainerDutyWidget(title: 'Ораза маңызы', body: 'Исламның бес шартының үшіншісі – Рамазан айында ораза ұстау. Ораза ұстау, хижреттің екінші жылында парыз болды.ƒОраза – ниет етіп таң ағара бастағаннан кешке күн батқанша тамақ жемеу, ішпеу және ерлі-зайыптылардың жыныстық қатынаста болмауы дегенді білдіреді.Рамазан айы кей жылдары 29 күн, ал кейбір жылдары 30 күн болады. Рамазан айы 29 күн болған кезде де ораза толық болып есептеледі. Өйткені парыз болғаны сол айда толығымен ораза ұстау. Өйткені, пай-ғамбарымыз тоғыз мәрте Рамазан оразасын тұтқан. Бұл рамазандардың төртеуі 29, ал бесеуі 30 күн болған.Рамазан – мұсылмандар үшін қасиетті және берекелі ай. Ислам таңы осы айда атып, дүниені жарығына бөлеген, ұлы кітабымыз Құран Кәрім осы айда түсе бастаған. Мың айдан да қадірлі болып есептелетін Қадір түні де осы айдың ішінде. Ішкі дүниемізді жаман ойлардан және сыртқы дүниемізді жаман әрекеттерден тазартатын ораза осы айда ұсталады.Ораза – бізді дүниеде жамандықтардан сақтайтын, ақыретте жәһаннамнан қорғайтын және күнәларымыздың кешірілуіне себепші болатын маңызды ғибадат. Пайғамбарымыз былай дейді: “Кімде-кім сене отырып, сауабын Алладан күтіп, Рамазан оразасын тұтса, өткен күнәлары кешіріледі”[2]ОРАЗАНЫ БҰЗБАЙТЫН ЖАЙТТАР:1) Ораза ұстағанын ұмытып, жеп-ішу (ұмытып кетіп жеп немесе ішіп қойған адам ораза екені есіне түссе, аузын шайып, оразасын жалғастырады. Ораза екені есіне түскеннен кейін тамағынан бір нәрсе өтсе, оразасы бұзылады).2) Құлағына су кетіп қалу;3) Көзіне дәрі тамызу;4) Түнде жуыну қажет болғанымен таңертеңгісін жуыну;5) Еріксіз құсса;6) Ұйықтап жатқанда жыныс жолдарынан сұйықтық бөлінсе;7) Қан алдыру;8) Еріксіз тамағына тозаң, түтін кіру;9) Аузындағы түкірікті жұту.ОРАЗАНЫ ҰСТАҒАН АДАМҒА МӘКРҮҺ ЖАҒДАЙЛАР1) Бір нәрсені жұтпай дәмін татып көру (егер күйеуі тамақтың тұзына байланысты мазасын алып дау тудырса, ол кезде әйел жұтып қоймай тамақтың дәмін көрсе болады).2) Түкірігін аузына жинап жұту (Егер аузындағы жиналған түкірігін сыртқа шығарғаннан кейін жұтса, оразасы бұзылады).3) Өзін әлсірететіндей дәрежеде қан алдыру, ауыр жұмыстар жасау.ОРАЗА ҰСТАҒАН АДАМҒА МӘКРҮҺ ЕМЕС ЖАҒДАЙЛАР1) Раушан гүлі сияқты хош иістерді иіскеу;2) Тісті щеткамен тазалау;3) Ауызды шаю;4) Мұрынға су тарту;5) Жуыну.')
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
