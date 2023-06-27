import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_calendar/clean_calendar_event.dart';
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
    return BlocConsumer<CalendarChatsCubit, CalendarChatsState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
        loadingState: (){
          return Align(
            alignment: Alignment.center,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.danger,
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
                  color: AppColors.danger,
                ));
          },
          errorState: (message) {
            return const Center(
                child: CircularProgressIndicator(
                color: AppColors.danger,
            ));
          },
          initialState: (chats, questions) {
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
                        context.read<CalendarChatsCubit>().chatPer(DateFormat('yyyy-MM-dd').format(date).toString());

                      },
                      onMonthChanged: (DateTime time) {},
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
                      events: const {},
                      isExpandable: false,
                      eventDoneColor: Colors.green,
                      selectedColor: Colors.pink,
                      todayColor: AppColors.orange,
                      eventColor: Colors.deepPurple,
                      locale: 'kk_Kz',
                      todayButtonText: '',
                      isExpanded: true,
                      dayOfWeekStyle: TextStyle(
                        color: AppColors.grey2,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                if (questions != null) QuestionsList(questions: questions)
              ],
            );
          },
        );
      },
    );
  }
}
