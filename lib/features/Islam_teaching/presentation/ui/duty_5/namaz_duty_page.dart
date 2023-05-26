import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/container_duty_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';

class NamazDutyPage extends StatefulWidget {
  const NamazDutyPage({super.key});

  @override
  State<NamazDutyPage> createState() => _NamazDutyPageState();
}

class _NamazDutyPageState extends State<NamazDutyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: const BoxDecoration(color: AppColors.white),
        child: AppButton(
            onTap: () {
              context.router.push(const NamazPatternPageRoute());
            },
            text: 'Намаз оқу үлгісі'),
      ),
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
                          title: 'Намаз',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      const ContainerDutyWidget(
                          title: 'Намаз - діннің тірегі',
                          body:
                              'Намаз – діннің тірегі, құлшылықтың ең абзалы. Исламның негізгі бес парызының бірі. Намаз – өзін мұсылман санайтын кісіні Жаратушысына мойынсұндырып, қанағат пен өзге де қайырлы қадамдарға бастайтын ғибраты мол ғибадат. Сондай-ақ, ол – жат әдеттер мен арсыздықтан тыятын, азғындықтан сақтайтын құлшылық һәм рухани азық. Қысқасы, намаз – жұмақтың кілті. Сондықтан намазды дұрыс орындау – мұсылмандар үшін ең маңызды міндет. Ардақты Пайғамбарымыз (Оған Алланың салауаты мен сәлемі болсын) намазға былайша анықтама берген: «Уа, үмбетім һәм сахабаларым! Бүкіл шарттарына сай толық орындалған намаз – Алла Тағала жақсы көретін істердің ең мәртебелісі, пайғамбарлардың сүннеті, періштелердің ең сүйкімді ісі, жер мен көктің нұры, тән саулығының қайнар көзі, ризық-несібенің берекесі, дұғалардың қабыл болуына септігін тигізетін себептердің Намаз – діннің тірегі, құлшылықтың ең абзалы. Исламның негізгі бес парызының бірі. Намаз – өзін мұсылман санайтын кісіні Жаратушысына мойынсұндырып, қанағат пен өзге де қайырлы қадамдарға бастайтын ғибраты мол ғибадат. Сондай-ақ, ол – жат әдеттер мен арсыздықтан тыятын, азғындықтан сақтайтын құлшылық һәм рухани азық. Қысқасы, намаз – жұмақтың кілті. Сондықтан намазды дұрыс орындау – мұсылмандар үшін ең маңызды міндет. Ардақты Пайғамбарымыз (Оған Алланың салауаты мен сәлемі болсын) намазға былайша анықтама берген: «Уа, үмбетім һәм сахабаларым! Бүкіл шарттарына сай толық орындалған намаз – Алла Тағала жақсы көретін істердің ең мәртебелісі, пайғамбарлардың сүннеті, періштелердің ең сүйкімді ісі, жер мен көктің нұры, тән саулығының қайнар көзі, ризық-несібенің берекесі, дұғалардың қабыл болуына септігін тигізетін себептердің үлкені, жан алғыш періштеге араша түсетін шапағатшы, қабір әлемінде Нәкір мен Мүңкір атты періштелердің азабынан құтқаратын жауап. Қиямет күнінде – жанға сая. Жәһаннам отына тосқауыл қоятын перде. (Қылдан жіңішке, қылыштан өткір) Сират көпірінен жарқ еткізіп өткізетін пырақ. Жұмақтың кілті. Жұмақ жұртында киер тәжің. Алла Тағала мүміндерге намаздай маңызды құлшылық жүктемеген. Егер намаздан артық ғибадат түрі болғанда, Алла Тағала құлдарына соны міндеттер еді. Шын мәнінде, періштелердің бір шоғыры ұдайы намаздың қиямында, тағы бір бөлігі үнемі рүкүғта, тағы бір тобы сәждеде, енді біреулері тәшәһһуд қалпында құлшылық етіп тұрады. Міне, осылайша құлшылықтың хикметке толы қасиеттерін бір рәкағат намазға жинақтап, мүміндерге сыйлады. Ақиқатында, намаз – иманның басы, діннің тірегі, Исламның сөзі әрі мүміндердің миғражы».үлкені, жан алғыш періштеге араша түсетін шапағатшы, қабір әлемінде Нәкір мен Мүңкір атты періштелердің азабынан құтқаратын жауап. Қиямет күнінде – жанға сая. Жәһаннам отына тосқауыл қоятын перде. (Қылдан жіңішке, қылыштан өткір) Сират көпірінен жарқ еткізіп өткізетін пырақ. Жұмақтың кілті. Жұмақ жұртында киер тәжің. Алла Тағала мүміндерге намаздай маңызды құлшылық жүктемеген. Егер намаздан артық ғибадат түрі болғанда, Алла Тағала құлдарына соны міндеттер еді. Шын мәнінде, періштелердің бір шоғыры ұдайы намаздың қиямында, тағы бір бөлігі үнемі рүкүғта, тағы бір тобы сәждеде, енді біреулері тәшәһһуд қалпында құлшылық етіп тұрады. Міне, осылайша құлшылықтың хикметке толы қасиеттерін бір рәкағат намазға жинақтап, мүміндерге сыйлады. Ақиқатында, намаз – иманның басы, діннің тірегі, Исламның сөзі әрі мүміндердің миғражы».')
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
