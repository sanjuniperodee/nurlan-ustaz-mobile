
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final List<ResultHomeDTO> imageList;
  final Color? titleColor;
  final void Function() onTap;

  const CategoryCard(
      {Key? key,
      required this.title,
      required this.imageList,
      this.titleColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
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
              children: List.generate(
                4,
                    (index) {
                  if (index < imageList.length) {
                    final imageUrl = imageList[index].cover;
                    if (imageUrl != null && imageUrl.isNotEmpty) {
                      return Container(
                        height: 82.h,
                        width: 82.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            isAntiAlias: false,
                            filterQuality: FilterQuality.low,
                          ),
                        ),
                      );
                    }
                  }
                  return Container(
                    height: 82.h,
                    width: 82.w,
                    decoration: BoxDecoration(
                      color: AppColors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  );
                },
              ),
            )



          ],
        ),
      ),
    );
  }
}
