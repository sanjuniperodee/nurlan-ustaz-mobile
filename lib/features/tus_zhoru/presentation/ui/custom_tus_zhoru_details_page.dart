import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/custom_tus_zhoru_details_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/tus_zhoru_custom_body.dart';

import '../../../app/presentation/widgets/custom_app_bar.dart';
import '../bloc/tus_zhoru_cubit.dart';

@RoutePage()
class CustomTusZhoruDetailPage extends StatefulWidget {
  const CustomTusZhoruDetailPage({super.key, required this.id});
  final int id;

  @override
  State<CustomTusZhoruDetailPage> createState() => _TusZhoruDetailPage();
}

class _TusZhoruDetailPage extends State<CustomTusZhoruDetailPage> {
  List images = [
    'assets/images/nur.png',
    'assets/images/nur.png',
    'assets/images/nur.png'
  ];

  @override
  void initState() {
    //BlocProvider.of<TusZhoruCubit>(context).secureScreen();
    BlocProvider.of<CustomTusZhoruDetailsCubit>(context)
        .getCustomTusZhoruById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomTusZhoruDetailsCubit, CustomTusZhoruDetailsState>(
      builder: (context, state) {
        if (state is CustomTusZhoruDetailsLoadingState) {
          return const Scaffold(
            body: TusZhoruCustomBody(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.linearBlue,
                ),
              ),
            ),
          );
        }

        if (state is CustomTusZhoruDetailsLoadedState) {
          final tusZhoruModel = state.tusZhoru;
          final bool isChecked = tusZhoruModel?.explanation != null;

          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: isChecked
                ? null
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border(
                            top: BorderSide(
                                color: AppColors.grey1.withOpacity(0.1)))),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Text(
                          'req_24'.tr(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
            backgroundColor: AppColors.white,
            body: TusZhoruCustomBody(
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: CustomAppBar(
                              title: tusZhoruModel?.title ?? '',
                              onTap: () async {
                                BlocProvider.of<TusZhoruCubit>(context)
                                    .unSecureScreen();
                                BlocProvider.of<TusZhoruCubit>(context)
                                    .getCustomTusZhoruT();

                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 50.h),
                            child: Container(
                              height: 1.1.sh,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      stops: [
                                        0.0,
                                        1.0
                                      ],
                                      colors: [
                                        AppColors.white.withOpacity(0.5),
                                        AppColors.white
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tusZhoruModel?.title ?? '',
                                    style:
                                        getTextStyle(CustomTextStyles.s20w700)
                                            .copyWith(
                                                fontSize: 24,
                                                fontFamily:
                                                    FontTypes.Philosopher.name),
                                    textAlign: TextAlign.start,
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    child: Text(
                                      tusZhoruModel?.description ?? '',
                                      style:
                                          getTextStyle(CustomTextStyles.s16w400)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name,
                                                  height: 1.5),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  SizedBox(height: 28.h),
                                  if (isChecked)
                                    Column(
                                      children: [
                                        Text(
                                          'response_horo'.tr(),
                                          style: getTextStyle(
                                                  CustomTextStyles.s14w400)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name,
                                                  color: AppColors.grey1),
                                        ),
                                        SizedBox(height: 15.h),
                                      ],
                                    ),
                                  Text(tusZhoruModel?.explanation ?? ''),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        // TODO: error widget
        return const SizedBox.shrink();
      },
    );
  }
}
