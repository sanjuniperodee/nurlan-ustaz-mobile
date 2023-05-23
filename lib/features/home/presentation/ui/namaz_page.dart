import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/NamazContainerWidget.dart';

class NamazPage extends StatefulWidget {
  const NamazPage({Key? key}) : super(key: key);

  @override
  State<NamazPage> createState() => _NamazPageState();
}

class _NamazPageState extends State<NamazPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.lightBlue,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(
            children: [
              Image.asset(
                Assets.gradient,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 80.h,
                left: 16.r,
                right: 16.r,
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Намаз уақыттары',
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    const NamazContainerWidget(),
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12)
                                  .r,
                              decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(20).r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Таң намазы',
                                    style:
                                        getTextStyle(CustomTextStyles.s16w700)
                                            .apply(color: AppColors.white),
                                  ),
                                  Text(
                                    '05:11',
                                    style:
                                        getTextStyle(CustomTextStyles.s16w700)
                                            .apply(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
