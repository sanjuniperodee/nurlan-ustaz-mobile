import 'package:auto_route/auto_route.dart';
import 'dart:developer';
 
// import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/bloc/checklist_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/calendar_custom_body.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/checklist_task_item.dart';
 
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../data/models/checklist_dto.dart';
import '../widgets/horizontal_calendar/custom_agenda_controller.dart';
import '../widgets/horizontal_calendar/custom_horizontal_calendar.dart';
import '../widgets/task_details_dialog.dart';
 
@RoutePage()
class RamazanChecklistPage extends StatefulWidget {
  const RamazanChecklistPage({Key? key, required this.checkList}) : super(key: key);
  final CheckListDto checkList;
 
  @override
  State<RamazanChecklistPage> createState() => _RamazanChecklistPageState();
}
 
class _RamazanChecklistPageState extends State<RamazanChecklistPage> {
  // CustomCalendarAgendaController _calendarAgendaControllerNotAppBar =
  //     CustomCalendarAgendaController();
 
  int selectedIndex = -1;
  final monthList = List.generate(
      31,
      (index) => DateTime(
            DateTime.now().year,
            DateTime.now().month,
            index + 1,
          ));
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<CheckListCubit, CheckListState>(
        listener: (context, state) {
          state.maybeWhen(
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return Container();
          }, loadingState: () {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }, initialState: (days, selectedDate , tasks, isLoading) {
            final date = selectedDate ?? DateTime.now();


            return CalendarCustomBody(
              left: 0,
              right: 0,
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                       Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CustomAppBar(
                          title: 'Ramadan_checklist'.tr(),
                        ),
                      ),
                      // CustomCalendarAgenda(
                      //   controller: _calendarAgendaControllerNotAppBar,
                      //   locale: context.locale.languageCode,
                      //   weekDay: WeekDay.long,
                      //   fullCalendarDay: WeekDay.long,
                      //   selectedDateColor: Colors.blue.shade900,
                      //   initialDate: date ,
                      //   firstDate: DateTime.parse(widget.checkList.startDate!),
                      //   lastDate: DateTime.parse(widget.checkList.endDate!),
                      //   events:
                      //       days.map((e) => DateTime.parse(e.date)).toList(),
                      //   onDateSelected: (date) {
                      //     context.read<CheckListCubit>().changeDate(date: date);
                      //   },
                      //   checklist: days,
                      // ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${'today'.tr()}, ${DateFormat('dd MMMM').format(DateTime.now().toLocal())} ',
                                  style: getTextStyle(CustomTextStyles.s14w400)
                                      .copyWith(
                                          fontFamily: FontTypes.SF_Pro.name,
                                          color: AppColors.white),
                                ),
                                Text(

                                  ' ${date.difference(DateTime.parse(widget.checkList.startDate!)).inDays + 1}-${'day'.tr()}',

                                  style: getTextStyle(CustomTextStyles.s14w400)
                                      .copyWith(
                                          fontFamily:
                                              FontTypes.Philosopher.name,
                                          color: AppColors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => TaskDetailsDialog(
                                          day: days.firstWhere((e) =>
                                              DateTime.parse(e.date).day ==
                                              date.day)));
                                },
                                icon: SvgPicture.asset(
                                    'assets/icons/add-alt.svg'))
                          ],
                        ),
                      ),
                      isLoading
                          ? Container(
                              height: 200,
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: AppColors.linearBlue,
                              )),
                            )
                          : tasks == null
                              ? ListView.builder(
                                  itemCount: days
                                          .map((element) =>
                                              DateTime.parse(element.date).day)
                                          .toList()
                                          .contains(date.day)
                                      ? days
                                          .firstWhere((e) =>
                                              DateTime.parse(e.date).day ==
                                              date.day)
                                          .tasks
                                          .length
                                      : 0,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ChecklistTaskItem(
                                      selectedDate: date ?? DateTime.now(),
                                      index: index,
                                      task: days
                                          .firstWhere((e) =>
                                              DateTime.parse(e.date).day ==
                                              date.day)
                                          .tasks[index],
                                      checkListDayDto: days.firstWhere((e) =>
                                          DateTime.parse(e.date).day ==
                                          date.day),
                                    );
                                  },
                                )
                              : ListView.builder(
                                  itemCount: tasks.length,
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ChecklistTaskItem(
                                      index: index,
                                      task: tasks[index],
                                      checkListDayDto: days.firstWhere((e) =>
                                          DateTime.parse(e.date).day ==
                                          date.day),
                                      selectedDate: date,
                                    );
                                  },
                                ),
                    ],
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
