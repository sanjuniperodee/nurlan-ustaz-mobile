import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../common/app_styles.dart';
import '../common/colors.dart';

class PayDialog extends StatelessWidget {
  const PayDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Container(
        height: 289,
        width: 311,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
                colors: [AppColors.blue, AppColors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.white),
              child: Center(
                child: SvgPicture.asset(
                    'assets/icons/money_transfer.svg'),
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Түс жорылуын алу үшін төлем жасауыңызды сұраймыз',
                style: getTextStyle(CustomTextStyles.s16w400)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27)),
                height: 44,
                onPressed: () {},
                color: AppColors.orange,
                child: Center(
                  child: Text('10 000 тг төлеу',
                      style:
                      getTextStyle(CustomTextStyles.s14w400)
                          .copyWith(
                          fontFamily:
                          FontTypes.SF_Pro.name,
                          color: AppColors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
