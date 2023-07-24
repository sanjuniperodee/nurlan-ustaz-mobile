import 'dart:developer';

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

class ChecklistTaskItem extends StatefulWidget {
  const ChecklistTaskItem(
      {Key? key,
      required this.index,
      required this.task,
      required this.checkListDayDto})
      : super(key: key);
  final int index;
  final CheckListTaskDto task;
  final CheckListDayDto checkListDayDto;

  @override
  State<ChecklistTaskItem> createState() => _ChecklistTaskItemState();
}

late bool isComplete;
late bool isLoading;

class _ChecklistTaskItemState extends State<ChecklistTaskItem> {
  @override
  void initState() {
    isComplete = widget.task.isCompleted!;
    isLoading = false;

    super.initState();
  }

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
        height: 56.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: widget.index == 0
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
                  widget.task.title,
                  style: getTextStyle(CustomTextStyles.s16w500)
                      .apply(color: AppColors.black),
                ),
              ],
            ),
            isLoading == true
                ? Container(
                    height: 20,
                    width: 20,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: AppColors.orange,
                    )),
                  )
                : GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });

                      setState(() {
                        context
                            .read<CheckListCubit>()
                            .completeTask(widget.checkListDayDto, widget.task,
                                !widget.task.isCompleted!)
                            .then((value) {
                          isLoading = false;
                        });
                      });
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
