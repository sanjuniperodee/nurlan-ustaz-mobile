import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_clean_calendar/clean_calendar_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/bloc/calendar_chats_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/widgets/custom_calendar_chat.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/widgets/questions_list.dart';

import '../../../../../../../core/common/colors.dart';
import '../../../../../../app/presentation/widgets/custom_snackbars.dart';

class CalendarChatsPage extends StatefulWidget {
  const CalendarChatsPage({Key? key}) : super(key: key);

  @override
  State<CalendarChatsPage> createState() => _CalendarChatsPageState();
}

class _CalendarChatsPageState extends State<CalendarChatsPage> {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarChatsCubit, CalendarChatsState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
            loadingState: () {
              return const Align(
                alignment: Alignment.center,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.linearBlue,
                  ),
                ),
              );
            });
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.linearBlue,
                ));
          },
          errorState: (message) {
            return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.linearBlue,
                ));
          },
          initialState: (chats, questions, isLoading) {

            final List<DateTime> datesWithChat =
                chats?.map((e) => DateTime.parse(e.date!)).toList() ?? [];
            print(datesWithChat);
            return Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(vertical: 27.h, horizontal: 10.w),
                  child: Container(
                    height: 414,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: CustomCalendarChat(
                      daysWithChat: datesWithChat,
                      onDateSelected: (DateTime date) {
                        context.read<CalendarChatsCubit>().chatPer(DateFormat(
                            'yyyy-MM-dd').format(date).toString());
                      },
                      onMonthChanged: (DateTime time) {},
                      hideBottomBar: false,
                      startOnMonday: true,
                      weekDays:[
                        'calendar.m'.tr(),
                        'calendar.t'.tr(),
                        'calendar.w'.tr(),
                        'calendar.r'.tr(),
                        'calendar.f'.tr(),
                        'calendar.s'.tr(),
                        'calendar.u'.tr(),
                      ],
                      events: const {},
                      isExpandable: false,
                      eventDoneColor: Colors.green,
                      selectedColor: Colors.pink,
                      todayColor: AppColors.orange,
                      eventColor: Colors.deepPurple,
                      locale: '${context.locale.languageCode},${context.locale
                          .countryCode}',
                      todayButtonText: '',
                      isExpanded: true,
                      dayOfWeekStyle: const TextStyle(
                        color: AppColors.grey2,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                isLoading == true ?  SizedBox(
                  height: 200.h,

                  child: const Center(child: CircularProgressIndicator(
                    color: AppColors.linearBlue,
                  ),),) :
                 (questions != null) ? QuestionsList(
                    questions: questions.reversed.toSet().toList()) : Container()
              ],
            );
          },
        );
      },
    );
  }
}
