import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_day_dto.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/checklist_task_dto.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../bloc/checklist_cubit.dart';

class TaskDetailsDialog extends StatelessWidget {
  TaskDetailsDialog({
    super.key,
    this.task,
    required this.day,
  });

  final CheckListTaskDto? task;
  final CheckListDayDto day;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (task != null) {
      _controller.text = task!.title!;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: 270,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 16),
            Text(
              'New_task'.tr(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: FontTypes.Philosopher.name,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'write_down'.tr(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: FontTypes.SFPro.name,
                  color: AppColors.grey1.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                constraints: BoxConstraints(minHeight: 32, maxHeight: 35),
                child: TextFormField(
                  showCursor: false,
                  minLines: 1,
                  maxLines: 2,
                  controller: _controller,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(30),
                  ],
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: 'Text'.tr(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: AppColors.grey1.withOpacity(0.2)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: AppColors.grey1.withOpacity(0.2)),
                    ),
                    filled: true,
                    fillColor: AppColors.blue.withOpacity(0.05),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 135,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Color(0xFFE7EAEB)),
                      top: BorderSide(color: Color(0xFFE7EAEB)),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel'.tr(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: FontTypes.SFPro.name,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 135,
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFFE7EAEB))),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (task != null) {
                        if (task!.title != _controller.text) {
                          if (_controller.text.isEmpty) {
                            buildErrorCustomSnackBar(
                                context, 'write_line'.tr());
                          } else {
                            Navigator.pop(context);
                            context
                                .read<CheckListCubit>()
                                .completeTask(
                                  day,
                                  task!.copyWith(title: _controller.value.text),
                                  task!.isCompleted!,
                                )
                                .then((value) {
                              buildSuccessCustomSnackBar(
                                  context, 'success'.tr());
                            });
                          }
                        } else {
                          Navigator.pop(context);
                        }
                      } else {
                        if (_controller.text.isNotEmpty) {
                          Navigator.pop(context);
                          context
                              .read<CheckListCubit>()
                              .postTask(day, _controller.text)
                              .then((value) {
                            buildSuccessCustomSnackBar(context, 'saved'.tr());
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: FontTypes.SFPro.name,
                        color: AppColors.blue,
                      ),
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
