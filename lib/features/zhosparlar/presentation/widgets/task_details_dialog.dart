import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_day_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_task_dto.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../app/presentation/ui/on_boarding.dart';
import '../bloc/checklist_cubit.dart';

class TaskDetailsDialog extends StatelessWidget {
  TaskDetailsDialog({
    Key? key,
    this.task,
    required this.day,
  }) : super(key: key);

  final CheckListTaskDto? task;
  final CheckListDayDto day;

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      _controller.text = task!.title;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: 270.w,
        height: 170.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Text(
              'Жаңа тапсырма қосу',
              style: getTextStyle(CustomTextStyles.s16w700)
                  .copyWith(fontFamily: FontTypes.Philosopher.name),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Төменге тізімге енгізетін тапсырманы жазыңыз',
                style: getTextStyle(CustomTextStyles.s14w400)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name)
                    .copyWith(color: AppColors.grey1.withOpacity(0.5)),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 32,
                width: double.infinity,
                child: TextFormField(
                  controller: _controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    enabled: true,
                    labelText: "Текст",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          BorderSide(color: AppColors.grey1.withOpacity(0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          BorderSide(color: AppColors.grey1.withOpacity(0.2)),
                    ),
                    filled: true,
                    fillColor: AppColors.blue.withOpacity(0.05),
                    //fillColor: Colors.green
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 135.w,
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(color: Color(0xFFE7EAEB)),
                          top: BorderSide(color: Color(0xFFE7EAEB)))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Болдырмау',
                      style: getTextStyle(CustomTextStyles.s14w400)
                          .copyWith(fontFamily: FontTypes.SF_Pro.name),
                    ),
                  ),
                ),
                Container(
                  width: 135.w,
                  decoration: const BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Color(0xFFE7EAEB)))),
                  child: TextButton(
                    onPressed: () async {
                      if (task != null) {
                        if (task!.title != _controller.text) {
                          context.read<CheckListCubit>().completeTask(
                              day,
                              task!.copyWith(title: _controller.value.text),
                              task!.isCompleted!);
                        } else {
                          Navigator.pop(context);
                        }
                      } else {
                        if (_controller.value.text.isNotEmpty)
                          await context
                              .read<CheckListCubit>()
                              .postTask(day, _controller.text);
                        else {
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: Text(
                      'OK',
                      style: getTextStyle(CustomTextStyles.s14w500).copyWith(
                          fontFamily: FontTypes.SF_Pro.name,
                          color: AppColors.blue),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
