import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/ui/calendar_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/ui/today_page.dart';

import '../../../../../../../core/common/colors.dart';
import '../../../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../../../app/presentation/widgets/custom_tab_bar.dart';

class UstazAitinizhi extends StatefulWidget {
  const UstazAitinizhi({Key? key}) : super(key: key);

  @override
  State<UstazAitinizhi> createState() => _UstazAitinizhiState();
}

int currentIndex = 0;

class _UstazAitinizhiState extends State<UstazAitinizhi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: currentIndex == 0
          ? Container(
              width: double.infinity,
              height: 112.h,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, bottom: 44, right: 16, left: 16),
                child: AppButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return Center(
                            child: Stack(
                              children: [
                                Container(
                                  width: 311,
                                  height: 194,
                                  decoration:
                                      BoxDecoration(color: AppColors.white),
                                ),
                                Positioned(
                                  left: 105,
                                  bottom: 150,
                                  child: CircleAvatar(
                                      minRadius: 37,
                                      maxRadius: 37,
                                      backgroundColor: AppColors.white,
                                      child: Image.asset(
                                        'assets/images/imam_nurlan.png',
                                      )),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    text: 'Сұраңыз'),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      backgroundColor: Color(0xFFECF5FF),
      body: GlobalCustomBody(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAppBar(
                title: 'Ұстаз айтыңызшы',
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomTabBar(
                tabs: const [
                  Tab(
                    text: 'Бүгін',
                  ),
                  Tab(
                    text: 'Барлығы',
                  ),
                ],
                onTap: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                length: 2,
              ),
              currentIndex == 0
                  ? const TodayChatPage()
                  : const CalendarChatsPage()
            ],
          ),
        ),
      ),
    );
  }
}
