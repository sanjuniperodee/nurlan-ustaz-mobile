import 'dart:developer';

import 'package:flutter/material.dart';
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

class ChecklistTaskItem extends StatefulWidget {
  const ChecklistTaskItem(
      {super.key,
      required this.index,
      required this.task,
      required this.checkListDayDto, required this.selectedDate});
  final int index;
  final CheckListTaskDto task;
  final CheckListDayDto checkListDayDto;
  final DateTime selectedDate;

  @override
  State<ChecklistTaskItem> createState() => _ChecklistTaskItemState();
}

class _ChecklistTaskItemState extends State<ChecklistTaskItem> {
  late bool isComplete;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isComplete = widget.task.isCompleted!;
  }

  @override
  Widget build(BuildContext context) {
    log(widget.task.title!);
    log(widget.task.title!.isEmpty.toString());
    return Slidable(
      
      
      closeOnScroll: true,
      endActionPane: ActionPane(
        extentRatio: 0.3.w,
        motion: const ScrollMotion(),
        children: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => TaskDetailsDialog(
                        task: widget.task,
                        day: widget.checkListDayDto,
                      ));
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
              context
                  .read<CheckListCubit>()
                  .deleteTask(widget.checkListDayDto, widget.task);
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
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: widget.index == 0
              ? BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))
              : null,
        ),
        padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 16.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.task.title}',
                  // widget.task.title,
                  style: getTextStyle(CustomTextStyles.s16w500)
                      .apply(color: AppColors.black),
                ),
              ],
            ),
            isLoading == true
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.linearBlue,
                    )),
                  )
                : GestureDetector(
                    onTap: () async {
                      setState(() => isLoading = true);
                      await context
                          .read<CheckListCubit>()
                          .completeTask(widget.checkListDayDto, widget.task,
                              !widget.task.isCompleted!);
                      if (mounted) setState(() => isLoading = false);
                    },
                    child: widget.task.isCompleted! == false
                        ? SvgPicture.asset('assets/icons/empty_eclipse.svg')
                        : SvgPicture.asset('assets/icons/Unchecked.svg')),
          ],
        ),
      ),
    );
  }
}
