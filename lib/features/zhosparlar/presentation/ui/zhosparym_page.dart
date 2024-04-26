import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_day_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/bloc/checklist_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/bloc/zhosparym_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/calendar_description.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/cards/seminar_card.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/cards/service_card.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/dialogs/holiday_type_dialog.dart';

import '../../../app/presentation/widgets/calendar/custom_calendar.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../data/models/events_type_enum.dart';
import '../widgets/events_card.dart';

@RoutePage(name: 'ZhosparymMainRouterPage')
class ZhosparymPage extends StatefulWidget {
  const ZhosparymPage({super.key});

  @override
  State<ZhosparymPage> createState() => _ZhosparymPageState();
}

bool _isLoading = false;

class _ZhosparymPageState extends State<ZhosparymPage> {
  List<EventDto> holidays = [];

  final gradients = [
    const LinearGradient(colors: [
      Color(0xFF1151C2),
      Color(0xFF8F8CF7),
    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
    const LinearGradient(
        colors: [Color(0xFFDD5000), Color(0xFFFEC552)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight)
  ];

  @override
  void initState() {
    BlocProvider.of<ZhosparymCubit>(context).getCheckList().then((value) {
      BlocProvider.of<ZhosparymCubit>(context).calendarEvents(DateTime.now());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ZhosparymCubit, ZhosparymState>(
        listener: (context, state) {
      state.maybeWhen(
        errorState: (message) {
          buildErrorCustomSnackBar(context, message);
        },
        orElse: () {},
      );
    }, builder: (context, state) {
      print('${context.locale.languageCode},${context.locale.countryCode}');
      return state.maybeWhen(orElse: () {
        return Container();
      }, loadingState: () {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      }, initialState: (events, checklist, isLoading) {
        holidays.clear();

        final eventsDays = events?.map<DateTime, List<EventDto>>(
          (key, value) => MapEntry(
            DateTime.parse(key),
            value,
          ),
        );

        if (eventsDays != null) {
          eventsDays.forEach((key, value) {
            holidays.addAll(value); // Using addAll method
          });
        }

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
                  top: 130.h,
                  left: 300.w,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) => LinearGradient(
                      colors: [
                        AppColors.white.withOpacity(0.001),
                        AppColors.white,
                      ],
                    ).createShader(bounds),
                    child: SvgPicture.asset(
                      'assets/icons/calendar_custom_icon_2.svg',
                      color: AppColors.white.withOpacity(0.5),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.h,
                  left: 120.w,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) => LinearGradient(
                      colors: [
                        AppColors.white.withOpacity(0.001),
                        AppColors.white,
                      ],
                    ).createShader(bounds),
                    child: SvgPicture.asset(
                      'assets/icons/tumer1.svg',
                      color: AppColors.white.withOpacity(0.5),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 100).r,
                  child: SizedBox(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 55.h),
                            Text('my_plans'.tr(),
                                style: getTextStyle(CustomTextStyles.s36w700)
                                    .apply(
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
                              child: eventsDays == null
                                  ? const Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    )
                                  : CustomCalendar(
                                      onDateSelected: (DateTime date) {
                                        final formattedDate =
                                            DateFormat('yyyy-MM-dd')
                                                .format(date);
                                        context
                                            .read<ZhosparymCubit>()
                                            .chatPer(formattedDate);

                                        final eventsForDate = eventsDays[date];

                                        if (eventsForDate == null ||
                                            eventsForDate.isEmpty) {
                                          return;
                                        }

                                        if (eventsForDate
                                                .where((event) =>
                                                    event.type !=
                                                    EventsType.holiday)
                                                .length >
                                            1) {
                                          showCarouselDialog(eventsForDate);
                                        } else {
                                          showEventDialog(
                                              context,
                                              eventsForDate.first,
                                              gradients[0]);
                                        }
                                      },
                                      hideBottomBar: false,
                                      startOnMonday: true,
                                      weekDays: [
                                        'calendar.m'.tr(),
                                        'calendar.t'.tr(),
                                        'calendar.w'.tr(),
                                        'calendar.r'.tr(),
                                        'calendar.f'.tr(),
                                        'calendar.s'.tr(),
                                        'calendar.u'.tr(),
                                      ],
                                      events: eventsDays,
                                      isExpandable: false,
                                      eventDoneColor: Colors.green,
                                      selectedColor: Colors.pink,
                                      todayColor: AppColors.black,
                                      eventColor: Colors.deepPurple,
                                      locale:
                                          '${context.locale.languageCode}_${context.locale.languageCode == 'kk' ? 'KZ' : 'RU'}',
                                      todayButtonText: '',
                                      isExpanded: true,
                                      dayOfWeekStyle: const TextStyle(
                                        color: AppColors.grey2,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                            ),
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 26.w),
                              child: const CalendarDescription(),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            if (checklist != null)
                              AppButton(
                                isLoading: _isLoading,
                                onTap: _isLoading == true
                                    ? null
                                    : _handleButtonTap,
                                text: checklist.title.isEmpty
                                    ? 'Ramadan_checklist'.tr()
                                    : checklist.title,
                                color: AppColors.orange,
                              ),
                            SizedBox(
                              height: 21.h,
                            ),
                            if (holidays.any((element) =>
                                element.type == EventsType.holiday))
                              Text(
                                'Important_dates'.tr(),
                                style: getTextStyle(CustomTextStyles.s14w500)
                                    .copyWith(
                                        fontFamily: FontTypes.SF_Pro.name),
                              ),
                            SizedBox(
                              height: 16.h,
                            ),
                            ...renderHolidayItems(holidays)
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    });
  }

  List<Widget> renderHolidayItems(List<EventDto> holidays) {
    return holidays
        .where((element) => element.type == EventsType.holiday)
        .map((event) {
      final index = holidays.indexOf(event);
      final isEven = index.isEven;
      final gradient = isEven ? gradients[0] : gradients[1];

      return Padding(
        padding: const EdgeInsets.only(bottom: 31),
        child: InkWell(
          onTap: () {
            showEventDialog(context, event, gradient);
          },
          child: Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 42,
              bottom: 16,
            ),
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: gradient,
              image: const DecorationImage(
                opacity: 0.3,
                image: AssetImage("assets/images/ooo.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMd(context.locale.languageCode)
                      .format(DateTime.parse(event.date!)),
                  style: getTextStyle(CustomTextStyles.s16w600).copyWith(
                    fontFamily: FontTypes.SF_Pro.name,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${event.title}',
                  style: getTextStyle(CustomTextStyles.s16w600).copyWith(
                    fontFamily: FontTypes.SF_Pro.name,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  void showCarouselDialog(List<EventDto> events) {
    final controller = CarouselController();
    int currentIndex = 0;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: CarouselSlider(
          carouselController: controller,
          items: events
              .where((event) => event.type != EventsType.holiday)
              .map((event) => EventContainer(
                    event,
                    nextPage: () => controller.nextPage(),
                    previousPage: () => controller.previousPage(),
                    maincontext: context,
                  ))
              .toList(),
          options: CarouselOptions(
            aspectRatio: 1.3,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            onPageChanged: (index, _) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  void showEventDialog(
      BuildContext mainContext, EventDto event, LinearGradient gradient) {
    switch (event.type) {
      case EventsType.seminar:
        showDialog(
          context: mainContext,
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            child: SeminarCard(
              event: event,
              nextPage: () {},
              previousPage: () {},
              isDialog: true,
              mainContext: mainContext,
            ),
          ),
        );
        break;
      case EventsType.groupService:
        showDialog(
          context: mainContext,
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            child: ServiceCard(
              event: event,
              nextPage: () {},
              previousPage: () {},
              isDialog: true,
            ),
          ),
        );
        break;
      case EventsType.holiday:
        showDialog(
            context: mainContext,
            builder: (context) => HolidayDialog(
                  event: event,
                  mainContext: mainContext,
                  gradient: gradient,
                ));
        break;
      case EventsType.live:
        showDialog(
          context: mainContext,
          builder: (context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r)),
            child: SeminarCard(
              event: event,
              nextPage: () {},
              previousPage: () {},
              isDialog: true,
              mainContext: mainContext,
            ),
          ),
        );
        break;
      default:
        // Handle other event types or display a default dialog
        break;
    }
  }

  void _handleButtonTap() async {
    if (_isLoading) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final checklist = await _getChecklist();

    if (checklist != null) {
      final daysResult = await _getChecklistDays(checklist.id);

      if (daysResult.isEmpty) {
        await _delayedNavigation(checklist);
      } else {
        context.router.push(RamazanChecklistRoute(checkList: checklist));
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<CheckListDto?> _getChecklist() async {
    return await context.read<ZhosparymCubit>().getCheckList();
  }

  Future<List<CheckListDayDto>> _getChecklistDays(int checklistId) async {
    return await BlocProvider.of<CheckListCubit>(context)
        .getDays(checklistId: checklistId);
  }

  Future<void> _delayedNavigation(CheckListDto checklist) async {
    await Future.delayed(const Duration(seconds: 3));
    context.router.push(RamazanChecklistRoute(checkList: checklist));
  }
}
