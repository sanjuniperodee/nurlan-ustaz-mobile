import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/wudhu_page.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_tab_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

class NamazPatternPage extends StatefulWidget {
  const NamazPatternPage({super.key});

  @override
  State<NamazPatternPage> createState() => _NamazPatternPageState();
}

int currentIndex = 0;

class _NamazPatternPageState extends State<NamazPatternPage> {
  final List<String> list = [
    Assets.wudhuSvg,
    Assets.nam1Svg,
    Assets.nam2Svg,
    Assets.nam3Svg,
    Assets.nam4Svg,
    Assets.nam5Svg,
  ];
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
                        const CustomAppBar(
                          title: 'Намаз оқу үлгісі',
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        SearchWidget(onChanged: (string) {}),
                        SizedBox(
                          height: 22.h,
                        ),
                        CustomTabBar(
                          tabs: const [
                            Tab(
                              text: 'Ер',
                            ),
                            Tab(
                              text: 'Әйел',
                            ),
                          ],
                          onTap: (int) {
                            setState(() {
                              currentIndex = int;
                            });
                          },
                          length: 2,
                        ),
                        ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    index == 0
                                        ? const WudhuPageRoute()
                                        : const NamazReadPageRoute(),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListTile(
                                      iconColor: AppColors.black,
                                      leading: Container(
                                        width: 55.r,
                                        height: 55.r,
                                        decoration: BoxDecoration(
                                            gradient: index == 0
                                                ? AppColors
                                                    .gradientPrimaryActiveButton
                                                : const LinearGradient(
                                                    colors: [
                                                        AppColors.orange,
                                                        AppColors.orange
                                                      ],
                                                    begin: Alignment.topCenter,
                                                    end:
                                                        Alignment.bottomCenter),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: SvgPicture.asset(
                                          list[index],
                                        ),
                                      ),
                                      title: Text(
                                        index == 0 ? 'Дәрет алу' : 'Таң намазы',
                                        style: getTextStyle(
                                                CustomTextStyles.s16w600)
                                            .apply(color: AppColors.black),
                                      ),
                                      subtitle: index == 0
                                          ? const SizedBox()
                                          : Text(
                                              '2 рәкәт сүннет, 2 рәкәт парыз',
                                              style: getTextStyle(
                                                      CustomTextStyles.s14w400)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 20,
                                      )),
                                ),
                              ),
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
