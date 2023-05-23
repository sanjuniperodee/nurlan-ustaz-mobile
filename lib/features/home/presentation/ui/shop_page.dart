import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_widget.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(
            children: [
              const GlobalCustomBody(),
              Positioned(
                top: 80.h,
                left: 16.r,
                right: 16.r,
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Дүңгіршек',
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Text(
                      'ТОП',
                      style: getTextStyle(CustomTextStyles.s20w700)
                          .apply(color: AppColors.white),
                    ),
                    GridView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.asset('assets/images/shop.png'),
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Барлығы',
                      style: getTextStyle(CustomTextStyles.s20w700)
                          .apply(color: AppColors.black),
                    ),
                    GridView.builder(
                      itemCount: 9,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image.asset('assets/images/shop.png'),
                        );
                      },
                    ),
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
