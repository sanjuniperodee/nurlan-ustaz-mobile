import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../data/models/tus_zhoru_dto.dart';

class TusZhoruList extends StatelessWidget {
  const TusZhoruList({super.key, required this.tusZhoruList});
  final List<TusZhoruDTO> tusZhoruList;

  @override
  Widget build(BuildContext context) {
    final list = tusZhoruList;

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 30.h, top: 20.h),
      itemCount: list.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = list[index];
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.sp),
          child: GestureDetector(
            onTap: () {
              context.router.push(TusZhoruDetailRoute(
                id: item.id!,
              ));
            },
            child: Container(
              height: 75.h,
              decoration: BoxDecoration(
                color: item.isPurchased!
                    ? AppColors.orange
                    : AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          item.title ?? '',
                          style: getTextStyle(CustomTextStyles.s16w500)
                              .copyWith(
                              fontWeight: FontWeight.w600,
                              fontFamily: FontTypes.SF_Pro.name,
                              color: item.isPurchased!
                                  ? AppColors.white
                                  : null),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 250.w,
                        child: buildDescriptionText(item),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/chevronDown.svg',
                      color: item.isPurchased!
                          ? AppColors.white
                          : AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 8.h,
        );
      },
    );
  }

  Widget buildDescriptionText(TusZhoruDTO item) {
    final isPurchased = item.isPurchased ?? false;
    final text = isPurchased
        ? item.fullExplanation
        : item.isFree!
        ? item.fullExplanation
        : item.partialExplanation;

    final textStyle = getTextStyle(CustomTextStyles.s14w400).apply(
        fontFamily: FontTypes.SF_Pro.name,
        color: isPurchased
        ? AppColors.white
            : AppColors.grey1.withOpacity(0.55),
    );

    return Text(
    text ?? '',
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: textStyle,
    );
  }
}