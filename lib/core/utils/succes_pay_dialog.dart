import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/custom_tus_zhoru_details_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_details_cubit.dart';

import '../../features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';
import '../common/app_styles.dart';
import '../common/colors.dart';

class SuccesPayDialog extends StatelessWidget {
  const SuccesPayDialog(
      {Key? key, required this.price, required this.id, required this.isCustom})
      : super(key: key);
  final String price;
  final int id;
  final bool isCustom;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Container(
        height: 289.h,
        width: 311.w,
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
              height: 64.h,
              width: 64.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.white),
              child: Center(
                child: SvgPicture.asset('assets/icons/success_check.svg'),
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Өтінішіңіз қабылданды. 24 сағат ішінде  жауап ала аласыз',
                style: getTextStyle(CustomTextStyles.s16w400)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 27.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.r)),
                height: 44.h,
                onPressed: () async {
                  if (isCustom == true) {
                    var customTusZhoru =
                        await BlocProvider.of<CustomTusZhoruDetailsCubit>(context)
                            .getCustomTusZhoruById(id);
                    log(customTusZhoru.toString());
                    Navigator.of(context).pop();
                    if (customTusZhoru != null) {
                      context.router.push(
                          CustomTusZhoruDetailRoute(id: customTusZhoru.id!));
                      BlocProvider.of<TusZhoruCubit>(context).customTusZhoruList;

                    }
                  } else {
                    var tusZhoru = await BlocProvider.of<TusZhoruDetailsCubit>(context)
                        .getTusZhoruById(id);
                    Navigator.of(context).pop();
                    log(tusZhoru.toString());
                    if (tusZhoru != null) {
                      context.router.push(
                          TusZhoruDetailRoute(id: tusZhoru.id!));
                    }

                  }


                },
                color: AppColors.orange,
                child: Center(
                  child: Text('Керемет',
                      style: getTextStyle(CustomTextStyles.s14w400).copyWith(
                          fontFamily: FontTypes.SF_Pro.name,
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
