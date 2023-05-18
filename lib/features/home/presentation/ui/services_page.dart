import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_appbar_widget.dart';

import '../../../../core/common/assets.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F8FF),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(
            children: [
              const GlobalAppBar(),
              Positioned(
                top: 80.h,
                left: 16.r,
                right: 16.r,
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Қызметтер',
                    ),
                    ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 12.r),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20).r),
                            padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12)
                                .r
                                .r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          borderRadius:
                                              BorderRadius.circular(12).r),
                                      padding: const EdgeInsets.all(15).r,
                                      child: SvgPicture.asset(
                                          'assets/icons/marri.svg'),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      'Жеке жүздесу',
                                      style: AppStyles.sp16fw500
                                          .apply(color: AppColors.black),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: selectedIndex != index
                                        ? SvgPicture.asset(
                                            Assets.radioCircleSvg)
                                        : SvgPicture.asset(Assets.radioOnSvg))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    const Text(
                      'Жоғарыдағы қызметтердің бірін таңдап, батырманы басыңыз',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppButton(
                      onTap: () {},
                      text: 'Өтініш қалдыру',
                      color: AppColors.blue,
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
