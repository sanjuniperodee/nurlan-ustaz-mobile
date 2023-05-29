import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

class TandaulyDhikrPage extends StatefulWidget {
  const TandaulyDhikrPage({super.key});

  @override
  State<TandaulyDhikrPage> createState() => _TandaulyDhikrPageState();
}

class _TandaulyDhikrPageState extends State<TandaulyDhikrPage> {
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
                          title: 'Таңдаулы зікірлер',
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        SearchWidget(onChanged: (string) {}),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    const DhikrDetailPageRoute(),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListTile(
                                    iconColor: AppColors.black,
                                    title: Text(
                                      'Салауат',
                                      style: getTextStyle(
                                          CustomTextStyles.s16w500),
                                    ),
                                    trailing: Image.asset(
                                      Assets.hand,
                                      height: 20.r,
                                      width: 20.r,
                                    ),
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
