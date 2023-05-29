import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/container_duty_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/banner_local_model.dart';

import '../../../../../core/common/app_styles.dart';

class ImanPage extends StatefulWidget {
  const ImanPage({super.key});

  @override
  State<ImanPage> createState() => _ImanPageState();
}

class _ImanPageState extends State<ImanPage> {
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
                          title: 'Иман',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      const ContainerDutyWidget(
                        title: 'Иман келтіру',
                        body:
                            'Құранның негізгі мазмұнында көтерілген басты тақырыптардың бірі – таухид ілімі, яғни, Алланың бірлігін дәріптейтін аяттар. Осындай таухидті адамзатқа жеткізу Алла тарапынан барлық елшілер мен пайғамбарларға жүктелген міндет болып табылады. Сол секілді Құранда Ибраһим (а.с.) пайғамбар айтылғанда міндетті түрде ол өз қауымына Алланың жалғыз екенін және Аллаға ғана құлшылық ету керектігін ескерткен тұстарын байқауға болады. Бұл өз кезегінде Ибраһимның (а.с.) таухид ілімін халқына дәріптеп, ширк (Аллаға серік қосу) амалдардың алдын алуға ықпал еткенін келесі аяттарда көруге болады. Мәселен, «Анам» сүресінде пұтқа табынған әкесіне ол былай дейді: «وَإِذْ قَالَ إِبْرَاهِيمُ لِأَبِيهِ آزَرَ أَتَتَّخِذُ أَصْنَامًا آلِهَةً» – «Ей, Әке, пұттарға Құдай ретінде табынасыңдар ма?», деді. Бұған қоса келесі «Әнбия» сүресінде: «أَفَتَعْبُدُونَ مِنْ دُونِ اللَّهِ مَا لَا يَنْفَعُكُمْ شَيْئًا وَلَا يَضُرُّكُمْ (66) أُفٍّ لَكُمْ وَلِمَا تَعْبُدُونَ مِنْ دُونِ اللَّهِ أَفَلَا تَعْقِلُونَ»  – «Сендер Алланың орнына өздеріңе ешбір зиян да пайда да тигізе алмайтын нәрсеге табынасыңдар ма? Алладан өзгеге табынуларың қалай? Ақылға келмейсіңдер ме?», сондай-ақ, Ибарһим (а.с.) ширк амалынан қаншалықты алыс болғандығы туралы Мұхаммедттің (с.а.у.) тілімен былай баяндалады: «قُلْ إِنَّنِي هَدَانِي رَبِّي إِلَى صِرَاطٍ مُسْتَقِيمٍ دِينًا قِيَمًا مِلَّةَ إِبْرَاهِيمَ حَنِيفًا وَمَا كَانَ مِنَ الْمُشْرِكِينَ» – «Расында, Раббым мені тура дінге, Ибраһимның (а.с.) жолына салды. Ол (Аллаға) серік қосушылардан емес еді». Осындай аяттардың мазмұны Ибраһимның (а.с.) ширк амалдарынан қаншалықты алыс екендігін әрі Алланың жолында халқын таухидке шақырғандығын аңғаруға болады.    Сонымен қатар, барлық кітап түскен (иудей, христиан, ислам) діндердің тұжырымдамасы бойынша Ибраһим (а.с.) пайғамбарлардың атасы және ол монотейстік діннің негізін салушы болып саналады. Демек, Ибраһим (а.с.) Алланың бірлігін дәріптеген әрі өзге пұттарға табынудан тыйған ең үлкен пайғамбар екендігін ешкім жоққа шығара алмайды. Бұл дегеніміз шахада, яғни, «Алладан басқа тәңір жоқ» деп куәлік етудің негізі сонау Ибраһим (а.с.) пайғамбардан басталғанын білдіреді. ',
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
