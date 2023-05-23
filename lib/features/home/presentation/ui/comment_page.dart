import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/comment_deep_item_widget.dart';

import '../../../app/presentation/widgets/custom_app_bar.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 16).r,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      Assets.backButtonSvg,
                      color: AppColors.black,
                    )),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Пікірлеры',
                      textAlign: TextAlign.center,
                      style: getTextStyle(CustomTextStyles.s20w700)
                          .apply(color: AppColors.black),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            CommentDeepItemWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 65),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CommentDeepItemWidget(),
                      );
                    },
                    itemCount: 3,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
