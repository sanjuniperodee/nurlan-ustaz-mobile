import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_day_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_task_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/task_details_dialog.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../bloc/checklist_cubit.dart';

class ChecklistTaskItem extends StatelessWidget {
  const ChecklistTaskItem({Key? key,
    required this.index,
    required this.task,
    required this.checkListDayDto})
      : super(key: key);
  final int index;
  final CheckListTaskDto task;
  final CheckListDayDto checkListDayDto;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.33,
        motion: const ScrollMotion(),
        children: [
          InkWell(
            onTap: () {

              showDialog(
                  context: context,
                  builder: (context) =>
                      TaskDetailsDialog(task: task, day: checkListDayDto,));
            },
            child: Container(
              width: 56.w,
              height: 56.h,
              color: Color(0xFF26292D),
              child: Center(child: SvgPicture.asset('assets/icons/edit.svg')),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<CheckListCubit>().deleteTask(checkListDayDto, task);
            },
            child: Container(
              width: 56.w,
              height: 56.h,
              color: AppColors.red,
              child: Center(
                  child: SvgPicture.asset('assets/icons/delete_busket.svg')),
            ),
          ),
        ],
      ),
      key: UniqueKey(),
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: index == 0
              ? BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))
              : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: getTextStyle(CustomTextStyles.s16w500)
                      .apply(color: AppColors.black),
                ),
              ],
            ),
            GestureDetector(
                onTap: () {
                  context
                      .read<CheckListCubit>()
                      .completeTask(checkListDayDto, task, !task.isCompleted!);
                },
                child: task.isCompleted == null
                    ? SvgPicture.asset('assets/icons/empty_eclipse.svg')
                    : !task.isCompleted!
                    ? SvgPicture.asset('assets/icons/empty_eclipse.svg')
                    : SvgPicture.asset('assets/icons/Unchecked.svg')),
          ],
        ),
      ),
    );
  }
}
