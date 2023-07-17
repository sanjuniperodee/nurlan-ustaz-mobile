import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

import '../../../../../../../core/common/colors.dart';
import '../../../../../../../core/platform/network_helper.dart';
import '../../data/models/question_model.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({Key? key, required this.questions, this.isSocket})
      : super(key: key);
  final List<QuestionDTO> questions;
  final bool? isSocket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...questions
            .map((e) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: isSocket != null
                                      ? e.avatar != null
                                          ? Center(
                                              child: CachedNetworkImage(
                                              imageUrl:
                                                  '${SERVER_ + e.avatar!}',
                                              fit: BoxFit.cover,
                                              height: 40.h,
                                              width: 40.w,
                                            ))
                                          : SvgPicture.asset(
                                              'assets/icons/user.svg')
                                      : e.user?.avatar != null
                                          ? Center(
                                              child: CachedNetworkImage(
                                              imageUrl: e.user?.avatar ?? '',
                                              fit: BoxFit.cover,
                                              height: 40.h,
                                              width: 40.w,
                                            ))
                                          : SvgPicture.asset(
                                              'assets/icons/user.svg')),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        isSocket != null
                                            ? e.fullName ?? ''
                                            : e.user?.fullName ?? '',
                                        style: getTextStyle(
                                                CustomTextStyles.s14w500)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(

                                        DateFormat('dd MMMM, hh:mm')
                                            .format(DateTime.parse(
                                                e.createdAt ?? ''))
                                            .toString(),
                                        style: getTextStyle(
                                                CustomTextStyles.s12w400)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                color: AppColors.grey1
                                                    .withOpacity(0.55)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  SizedBox(
                                      width: 245.w,
                                      child: Text(
                                        isSocket != null
                                            ? e.message ?? ''
                                            : e.body ?? '',
                                      )),
                                ],
                              )
                            ],
                          ),
                          if (e.is_allowed != null) ...[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.w, vertical: 15.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      backgroundColor: AppColors.white,
                                      child: Image.asset(
                                        'assets/images/imam_nurlan.png',
                                      )),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    'Жауап: ${e.is_allowed! ? 'Болады.' : 'Болмады.'}',
                                    style:
                                        getTextStyle(CustomTextStyles.s14w600)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Divider(
                        color: AppColors.black.withOpacity(0.3),
                      ),
                    )
                  ],
                ))
            .toList()
      ],
    );
  }
}
