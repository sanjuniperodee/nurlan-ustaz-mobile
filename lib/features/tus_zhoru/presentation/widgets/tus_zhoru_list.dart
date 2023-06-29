import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../data/models/tus_zhoru_dto.dart';

class TusZhoruList extends StatefulWidget {
  const TusZhoruList({Key? key, required this.tusZhoruList}) : super(key: key);
  final List<TusZhoruDTO> tusZhoruList;

  @override
  State<TusZhoruList> createState() => _TusZhoruListState();
}

class _TusZhoruListState extends State<TusZhoruList> {
  @override
  Widget build(BuildContext context) {
    final list = widget.tusZhoruList;

    return ListView.separated(
      padding: EdgeInsets.only(bottom: 100, top: 20.h),
      itemCount: list.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.sp),
          child: GestureDetector(
            onTap: () {
              context.router.push(TusZhoruDetailPageRoute(
                id: list[index].id!,
              ));
            },
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: list[index].isPurchased!
                    ? AppColors.orange
                    : AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].title ?? '',
                        style: getTextStyle(CustomTextStyles.s16w500).apply(
                            fontFamily: FontTypes.SF_Pro.name,
                            color: list[index].isPurchased!
                                ? AppColors.white
                                : null),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        list[index].isFree!
                            ? list[index].fullExplanation ?? ''
                            : list[index].isPurchased!
                                ? list[index].fullExplanation ?? ''
                                : list[index].partialExplanation ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getTextStyle(CustomTextStyles.s14w400).apply(
                            fontFamily: FontTypes.SF_Pro.name,
                            color: list[index].isPurchased!
                                ? AppColors.white
                                : AppColors.grey1.withOpacity(0.55)),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      'assets/icons/chevronDown.svg',
                      color: list[index].isPurchased!
                          ? AppColors.white
                          : AppColors.primaryColor,
                    ),
                  )
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
}
