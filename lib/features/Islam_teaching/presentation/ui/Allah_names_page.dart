import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/audioItem_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

class AllahNamesPage extends StatefulWidget {
  const AllahNamesPage({super.key});

  @override
  State<AllahNamesPage> createState() => _AllahNamesPageState();
}

class _AllahNamesPageState extends State<AllahNamesPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
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
                          title: 'Алланың 99 есімі',
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        SearchWidget(onChanged: (string) {}),
                        ListView.builder(
                          itemCount: 23,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Theme(
                                  data: theme,
                                  child: ExpansionTile(
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    childrenPadding: const EdgeInsets.only(
                                            left: 16, right: 16)
                                        .r,
                                    collapsedIconColor: AppColors.black,
                                    iconColor: AppColors.black,
                                    title: Text(
                                      'Алла (Аллаһ) اللَّهُ',
                                      style: getTextStyle(
                                          CustomTextStyles.s16w400),
                                    ),
                                    children: <Widget>[
                                      Text(
                                        'Ерекше мейірімді',
                                        style: getTextStyle(
                                                CustomTextStyles.s14w400)
                                            .apply(color: AppColors.black),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      const AudioItemWidget(),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                                        'Қамқоршы Алла Тағала мұсылмандардың, сондай-ақ кәпірлердің өмірлік қажеттерін өтейді. Алланың бұл есімін зікір еткен адамның ойлау және жаттау қабілеті күшейеді.',
                                        style: getTextStyle(
                                                CustomTextStyles.s14w400)
                                            .apply(color: AppColors.black),
                                      ),
                                    ],
                                  ),
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
