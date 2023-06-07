import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/common/app_styles.dart';
import '../../../../../../../core/common/assets.dart';
import '../../../../../../../core/common/colors.dart';
import '../about_app_page.dart';

class RegionSettingsBottomSheet extends StatefulWidget {
  const RegionSettingsBottomSheet({Key? key}) : super(key: key);

  @override
  State<RegionSettingsBottomSheet> createState() =>
      _RegionSettingsBottomSheetState();
}

class _RegionSettingsBottomSheetState
    extends State<RegionSettingsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final List<String> regions = List.generate(40, (index) =>'Город ${index+1}');
    return Container(
      height:  MediaQuery.of(context).size.height * 0.75,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 34,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Аймағыңыз',
                style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                    fontFamily: FontTypes.SF_Pro.name,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            ListView.builder(
              itemCount: regions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
                      .r
                      .r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        regions[index],
                        style: getTextStyle(CustomTextStyles.s16w400)
                            .apply(fontFamily: FontTypes.SF_Pro.name),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: selectedIndex != index
                              ? SvgPicture.asset(Assets.radioCircleSvg)
                              : SvgPicture.asset(Assets.radioOnSvg)),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
