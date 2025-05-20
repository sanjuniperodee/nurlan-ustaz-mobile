import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../../../../core/common/app_styles.dart';
import '../../../../../../../core/common/assets.dart';
import '../../../../../../../core/common/colors.dart';
import '../ui/ustaz_aitinizhi.dart';

class SurakDialog extends StatefulWidget {
  const SurakDialog({super.key, required this.channelSocket});
  final IOWebSocketChannel? channelSocket;

  @override
  State<SurakDialog> createState() => _SurakDialogState();
}

TextEditingController _surakController = TextEditingController();

class _SurakDialogState extends State<SurakDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      elevation: 50000,
      backgroundColor: AppColors.white.withOpacity(0.000000000000000001),
      content: SizedBox(
        width: 320.w,
        height: 300.h,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 50.h,
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 320.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 48.h,
                    ),
                    Text(
                      'questions'.tr(),
                      style: getTextStyle(CustomTextStyles.s16w700)
                          .copyWith(fontFamily: FontTypes.Philosopher.name),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        width: 279.w,
                        constraints: BoxConstraints(minHeight: 32.h),
                        child: TextFormField(
                          onChanged: (String value) {
                            setState(() {});
                          },
                          minLines: 1,
                          maxLines: 10,
                          controller: _surakController,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(90),
                          ],
                          decoration: InputDecoration(
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            enabled: true,
                            labelText: "${'tell_me_ustaz'.tr()}...",
                            labelStyle: getTextStyle(CustomTextStyles.s14w600)
                                .copyWith(fontFamily: FontTypes.SFPro.name),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: AppColors.grey1.withOpacity(0.2)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  color: AppColors.grey1.withOpacity(0.2)),
                            ),
                            filled: true,
                            fillColor: AppColors.blue.withOpacity(0.05),
                            contentPadding: EdgeInsets.all(10),
                            //fillColor: Colors.green
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    InkWell(
                      onTap: _surakController.value.text.length <= 7
                          ? null
                          : () {
                              widget.channelSocket?.sink.add(jsonEncode(
                                  {"message": _surakController.value.text}));
                              Navigator.pop(context);
                            },
                      child: Container(
                        height: 52.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: _surakController.value.text.length <= 7
                                ? AppColors.gradientPrimaryDisabledButton
                                : AppColors.gradientPrimaryActiveButton,
                            color: AppColors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20.r),
                                bottomRight: Radius.circular(20.r))),
                        child: Center(
                            child: Text(
                          'send'.tr(),
                          style: getTextStyle(CustomTextStyles.s16w500)
                              .copyWith(
                                  color: AppColors.white,
                                  fontFamily: FontTypes.SFPro.name),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 115.w,
              bottom: 210.h,
              child: SizedBox(
                height: 74.h,
                width: 74.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(74.r),
                  child: CachedNetworkImage(
                    imageUrl: userSir.avatar ?? '',
                    fit: BoxFit.cover,
                    height: 74.h,
                    width: 74.w,
                    errorWidget: (a, b, c) => Center(
                      child: SvgPicture.asset(
                        Assets.userSvg,
                        width: 74.w,
                        height: 74.h,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
