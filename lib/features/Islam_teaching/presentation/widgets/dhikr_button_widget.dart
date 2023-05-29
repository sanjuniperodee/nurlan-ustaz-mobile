// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class DhikrButtonWidget extends StatelessWidget {
  final String svg;
  final void Function()? onTap;
  const DhikrButtonWidget({
    Key? key,
    required this.svg,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24).r,
        child: SvgPicture.asset(svg),
      ),
    );
  }
}
