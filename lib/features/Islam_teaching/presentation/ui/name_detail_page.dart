import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:share_plus/share_plus.dart';
import '../widgets/floating_container_widget.dart';

class NameDetailPage extends StatefulWidget {
  const NameDetailPage({super.key});

  @override
  State<NameDetailPage> createState() => _NameDetailPageState();
}

class _NameDetailPageState extends State<NameDetailPage> {
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 56.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CustomAppBar(title: 'Адам'),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Container(
                          height: 0.8.sh,
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Аңсар',
                                style: getTextStyle(CustomTextStyles.s20w700),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                'Аңсар — көмекшілер, қолдаушылар, жолсерік. Мединенің төл тұрғындары, Алла елшісі мен оның сахабалары қоныс аударып келгенде, ислам дінін қабылдап, оларға пана тауып берген. Тіпті, пайғамбар "Басқа адамдар бір жолмен жүрсе, аңсарлар келесі жолмен жүрсе, мен аңсарлардың соңынан барар едім" деген болатын;',
                                style: getTextStyle(CustomTextStyles.s16w400),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children:  [
                                  FloatinContainerWidget(
                                    text: 'Таңдаулы',
                                    onTap: () {
                                      setState(() {
                                        favorite = !favorite;
                                      });
                                    },
                                    url: favorite
                                        ? Assets.bookMark1Svg
                                        : Assets.bookMarkSvg,
                                  ),
                                  FloatinContainerWidget(
                                    onTap: () {
                                      Share.share('Hello',
                                          subject: 'Nurlan_ustaz');
                                    },
                                    text: 'Бөлісу',
                                    url: Assets.shareSvg,
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
