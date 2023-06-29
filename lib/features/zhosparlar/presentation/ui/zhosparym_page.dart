import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/calendar/custom_calendar.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/atauly_kunder_model.dart';

class ZhosparymPage extends StatefulWidget {
  const ZhosparymPage({super.key});

  @override
  State<ZhosparymPage> createState() => _ZhosparymPageState();
}

class _ZhosparymPageState extends State<ZhosparymPage> {
  final days = List.generate(
      2,
      (index) => AtaulyKunderModel(
          title: 'Тарауих намазы туралы эфир',
          date: DateTime.now(),
          imageUrl: 'assets/images/ooo.png'));

  final gradients = [
    LinearGradient(colors: [
      Color(0xFF1151C2),
      Color(0xFF8F8CF7),
    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
    LinearGradient(
        colors: [Color(0xFFDD5000), Color(0xFFFEC552)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight)
  ];

  final Map<DateTime, List<CleanCalendarEvent>> _events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent('Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 12, 0),
          description: 'A special event',
          color: Colors.red),
    ],
  };

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
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16).r,
              child: SizedBox(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 82.h),
                        Text('Менің \nжоспарым',
                            style: getTextStyle(CustomTextStyles.s36w700).apply(
                                fontFamily: FontTypes.Philosopher.name,
                                color: AppColors.white)),
                        SizedBox(height: 24.h),
                        Container(
                          height: 414,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: CustomCalendar(
                            hideBottomBar: false,
                            startOnMonday: true,
                            weekDays: const [
                              'Дс',
                              'Сс',
                              'Ср',
                              'Бс',
                              'Жм',
                              'Сн',
                              'Жк'
                            ],
                            events: _events,
                            isExpandable: false,
                            eventDoneColor: Colors.green,
                            selectedColor: Colors.pink,
                            todayColor: AppColors.black,
                            eventColor: Colors.deepPurple,
                            locale: 'kk_Kz',
                            todayButtonText: '',
                            isExpanded: true,
                            dayOfWeekStyle: TextStyle(
                                color: AppColors.grey2,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 24,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFDD5000),
                                                Color(0xFFFEC552)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Тікелей эфир',
                                      style:
                                          getTextStyle(CustomTextStyles.s12w500)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 24,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1151C2),
                                                Color(0xFF8F8CF7)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Қызметер',
                                      style:
                                          getTextStyle(CustomTextStyles.s12w500)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 24,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              colors: [
                                                Color(0xFF1E8428),
                                                Color(0xFF61F8EF)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight)),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Семинар',
                                      style:
                                          getTextStyle(CustomTextStyles.s12w500)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        AppButton(
                          onTap: () {
                            context.router.push(
                              const RamazanChecklistRoute(),
                            );
                          },
                          text: 'Рамазан чеклисті',
                          color: AppColors.orange,
                        ),
                        SizedBox(
                          height: 21.h,
                        ),
                        Text(
                          'Атаулы күндер',
                          style: getTextStyle(CustomTextStyles.s14w500)
                              .copyWith(fontFamily: FontTypes.SF_Pro.name),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ...days
                            .map((e) => Padding(
                                  padding: const EdgeInsets.only(bottom: 31),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 16,
                                        right: 16,
                                        top: 42,
                                        bottom: 16),
                                    width: double.infinity,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      gradient:
                                          gradients.toList()[days.indexOf(e)],
                                      image: DecorationImage(
                                        opacity: 0.3,
                                        image:
                                            AssetImage("assets/images/ooo.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${DateFormat('dd.MM.yyyy').format(e.date)}ж.',
                                          style: getTextStyle(
                                                  CustomTextStyles.s16w600)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name,
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '${e.title}',
                                          style: getTextStyle(
                                                  CustomTextStyles.s16w600)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name,
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
