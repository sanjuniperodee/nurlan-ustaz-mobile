import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_appbar_widget.dart';

class SeminarPage extends StatefulWidget {
  const SeminarPage({super.key});

  @override
  State<SeminarPage> createState() => _SeminarPageState();
}

class _SeminarPageState extends State<SeminarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F8FF),
      body: SingleChildScrollView(
          child: SizedBox(
        // height: 1.h,
        child: Stack(children: [
          const GlobalAppBar(),
          Positioned(
              top: 80.h,
              left: 16.r,
              right: 16.r,
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(Assets.backButtonSvg),
                      Text(
                        'Семинар',
                        style:
                            AppStyles.sp20fw700.apply(color: AppColors.white),
                      )
                    ],
                  )
                ],
              ))
        ]),
      )),
    );
  }
}
