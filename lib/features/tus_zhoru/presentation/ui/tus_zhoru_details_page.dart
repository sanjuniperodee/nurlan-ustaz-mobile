import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_details_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/tus_zhoru_detail_body.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/pay_dialog.dart';
import '../../../app/app_dinamic_link.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';
import '../bloc/tus_zhoru_cubit.dart';

class TusZhoruDetailPage extends StatefulWidget {
  const TusZhoruDetailPage({super.key, required this.id});

  final int id;

  @override
  State<TusZhoruDetailPage> createState() => _TusZhoruDetailPage();
}

class _TusZhoruDetailPage extends State<TusZhoruDetailPage> {
  late bool _isFav;

  @override
  void initState() {
    BlocProvider.of<TusZhoruDetailsCubit>(context).getTusZhoruById(widget.id);
    BlocProvider.of<TusZhoruCubit>(context).secureScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TusZhoruDetailsCubit, TusZhoruDetailsState>(
        builder: (context, state) {
      return state.maybeWhen(
        loadingState: () {
          return const Scaffold(
            body: TusZhoruDetailBody(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.linearBlue,
                ),
              ),
            ),
          );
        },
        orElse: () {
          return const Center();
        },
        loaded: (tusZhoruModel) {
          _isFav = tusZhoruModel!.isSaved!;

          final bool isFree = tusZhoruModel.isFree == true;
          final bool isPaid = tusZhoruModel.isPurchased == true;
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: isFree
                  ? null
                  : isPaid
                      ? null
                      : AppButton(
                          onTap: () {
                            Navigator.pop(context);

                            showDialog(
                                context: context,
                                builder: (context) {

                                  return PayDialog(
                                    price: tusZhoruModel.price
                                            ?.toInt()
                                            .toString() ??
                                        '',
                                    id: tusZhoruModel.id!,
                                    isCustom: false,
                                  );

                                });

                          },
                          text: 'show_all'.tr(),
                        ),
            ),
            backgroundColor: AppColors.white,
            body: BlocBuilder<TusZhoruDetailsCubit, TusZhoruDetailsState>(
                builder: (context, state) {
              return TusZhoruDetailBody(
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    child: Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: CustomAppBar(
                              title: tusZhoruModel.title ?? '',
                              onTap: () async {
                                 BlocProvider.of<TusZhoruCubit>(context)
                                    .unSecureScreen();
                                 BlocProvider.of<TusZhoruCubit>(context)
                                     .tusZhoruT(page: 1, isFirstCall: true);
                                Navigator.pop(context);

                              },
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minHeight: 1.0.sh,
                            ),
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
                                  tusZhoruModel.title ?? '',
                                  style: getTextStyle(CustomTextStyles.s20w700)
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
                                  child: Stack(
                                    children: [
                                      Text(
                                        isFree
                                            ? tusZhoruModel.fullExplanation ??
                                                ''
                                            : isPaid
                                                ? tusZhoruModel
                                                        .fullExplanation ??
                                                    ''
                                                : '${tusZhoruModel.partialExplanation}...' ??
                                                    '',
                                        style: getTextStyle(
                                                CustomTextStyles.s16w400)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                height: 1.5),
                                        overflow: TextOverflow.fade,
                                      ),
                                      if (tusZhoruModel.isPurchased! == false &&
                                          tusZhoruModel.partialExplanation !=
                                              null)
                                        Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            height: 20,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: AppColors.white
                                                      .withOpacity(0.7)),
                                            ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 28.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          BlocProvider.of<TusZhoruDetailsCubit>(
                                                  context)
                                              .likeTusZhoru(tusZhoruModel.id!);
                                          _isFav = !_isFav;
                                        });
                                      },
                                      child: Container(
                                        width: 150.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: const Color(0xFF8F8CF7)
                                              .withOpacity(0.13),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14.w, vertical: 13.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Favourite'.tr(),
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w500)
                                                  .copyWith(
                                                      fontFamily: FontTypes
                                                          .SF_Pro.name),
                                            ),
                                            _isFav == false
                                                ? SvgPicture.asset(
                                                    'assets/icons/bookmark.svg',
                                                    color: AppColors.orange,
                                                  )
                                                : SvgPicture.asset(
                                                    'assets/icons/bookmark_1.svg',
                                                    color: AppColors.orange,
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        String unguessableDynamicLink =
                                            await DynamicLink()
                                                .createTusZhoruLink(
                                                    tusZhoruModel.id!);
                                        print(unguessableDynamicLink);
                                        await Share.share(
                                          unguessableDynamicLink,
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Color(0xFF8F8CF7)
                                              .withOpacity(0.13),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14, vertical: 13),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'share'.tr(),
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w500)
                                                  .copyWith(
                                                      fontFamily: FontTypes
                                                          .SF_Pro.name),
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/share.svg',
                                              color: AppColors.orange,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              );
            }),
          );
        },
      );
    });
  }
}
