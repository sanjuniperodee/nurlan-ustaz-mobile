import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class CommentDeepItemWidget extends StatefulWidget {
  const CommentDeepItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CommentDeepItemWidget> createState() => _CommentDeepItemWidgetState();
}

class _CommentDeepItemWidgetState extends State<CommentDeepItemWidget> {
  bool heart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8).copyWith(bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://i.pinimg.com/originals/6d/f8/bb/6df8bbb26f6cde4d1e2919e1340eeef3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Айнұр Саин',
                      style: getTextStyle(CustomTextStyles.s14w700)
                          .apply(color: AppColors.black),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      'Бүгін',
                      style: getTextStyle(CustomTextStyles.s12w700)
                          .apply(color: AppColors.grey1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '@Айнур Саин Алматыда',
                      style: getTextStyle(CustomTextStyles.s14w700)
                          .apply(color: AppColors.black),
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            heart = !heart;
                          });
                        },
                        child: SvgPicture.asset(
                            heart ? Assets.heartSvg : Assets.heart1Svg)),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {},
                  child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Жауап беру',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                            color: AppColors.grey2,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
