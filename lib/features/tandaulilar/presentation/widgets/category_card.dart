import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final List<String> imageList;
  final Color? titleColor;
  final void Function() onTap;

  const CategoryCard(
      {Key? key, required this.title, required this.imageList, this.titleColor, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 167.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title,
                style: getTextStyle(CustomTextStyles.s16w700,
                    color: titleColor ?? AppColors.white)),
            SizedBox(
              height: 10.h,
            ),
            Wrap(
                runSpacing: 2,
                spacing: 2,
                children: imageList.length < 4
                    ? imageList
                            .map(
                              (e) => Container(
                                height: 82,
                                width: 82,
                                child: Image.asset(e),
                              ),
                            )
                            .toList() +
                        List.generate(
                            4 - imageList.length,
                            (index) => Container(
                                  height: 82,
                                  width: 82,
                              decoration: BoxDecoration(
                                color: AppColors.grey1,

                                borderRadius: BorderRadius.circular(8.r),
                              ),
                                ))
                    : imageList
                        .map(
                          (e) => Container(
                            height: 82,
                            width: 82,
                            child: Image.asset(e),
                          ),
                        )
                        .toList()),
          ],
        ),
      ),
    );
  }
}
