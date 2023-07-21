import 'dart:developer';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/pay_dialog.dart';
import '../../data/models/tus_zhoru_dto.dart';

class CustomTusZhoruList extends StatefulWidget {
  const CustomTusZhoruList({Key? key, required this.tusZhoruList})
      : super(key: key);
  final List<TusZhoruDTO> tusZhoruList;

  @override
  State<CustomTusZhoruList> createState() => _CustomTusZhoruListState();
}

class _CustomTusZhoruListState extends State<CustomTusZhoruList> {
  @override
  Widget build(BuildContext context) {
    log(widget.tusZhoruList.toString());
    log('madi');
    final list = widget.tusZhoruList;

    return list.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.only(bottom: 100, top: 20.h),
            itemCount: list.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.sp),
                child: GestureDetector(
                  onTap: () {
                    if (list[index].isPaid == false) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return PayDialog(
                              price:
                                  list[index].price?.toInt().toString() ?? '',
                              id: list[index].id!,
                              isCustom: true,
                            );
                          });
                      return;
                    }
                    context.router.push(CustomTusZhoruDetailPageRoute(
                      id: list[index].id!,
                    ));
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 70.h,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: list[index].isPaid!
                                ? null
                                : Border.all(
                                    color: Colors.red,
                                    width: 1,
                                  )),
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 16.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200.w,
                                  child: Text(
                                    list[index].title ?? '',
                                    style: getTextStyle(CustomTextStyles.s16w500)
                                        .apply(fontFamily: FontTypes.SF_Pro.name),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    list[index].description ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400)
                                            .apply(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                color: AppColors.grey1
                                                    .withOpacity(0.55)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Center(
                              child: SvgPicture.asset(
                                'assets/icons/chevronDown.svg',
                                color: AppColors.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                      list[index].explanation == null &&
                              list[index].isPaid! == true
                          ? Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.white.withOpacity(0.4)),
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 8.h,
              );
            },
          )
        : Padding(
            padding: EdgeInsets.only(top: 121.h, left: 10.w, right: 10.w),
            child: Center(
              child: Text(
                "Бұл бөлімде Нұрлан ұстаздан жеке түс жорытуға тапсырыс бере аласыз. Түскен сомадан сіздің атыңыздан түс садақасы беріледі",
                textAlign: TextAlign.center,
                style: getTextStyle(CustomTextStyles.s14w500)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name),
              ),
            ),
          );
  }
}
