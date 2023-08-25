import 'package:auto_route/auto_route.dart';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/payment_tick_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/models/tus_zhoru_dto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../../app/presentation/widgets/custom_tab_bar.dart';

@RoutePage()
class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

int currentIndex = 0;

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  void initState() {
    BlocProvider.of<PaymentTickCubit>(context)
        .seminar(page: 1, isFirstCall: true, isPurchased: true);

    super.initState();
  }

  List<ResultHomeDTO> res = [];
  List<TusZhoruDTO> tus = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PaymentTickCubit, PaymentTickState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (
            ress,
            res2,
          ) {
            res = ress;
            tus = res2;
          },
        );
        // TODO: implement listener
      },
      builder: (context, state) {
        return GlobalCustomBody(
          left: 0,
          right: 0,
          child: SizedBox(
            height: 1.1.sh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: CustomAppBar(
                      title: 'Purchased_services'.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  CustomTabBar(
                    height: 50,
                    tabs: [
                      Tab(
                        text: 'seminars'.tr(),
                      ),
                      Tab(
                        text: 'all_payment'.tr(),
                      ),
                      Tab(
                        text: 'dream_interpretations_ind'.tr(),
                      ),
                    ],
                    onTap: (value) {
                      currentIndex = value;
                     
                      log('INDEX:::${currentIndex.toString()}');
                      if (currentIndex == 0) {
                        BlocProvider.of<PaymentTickCubit>(context).seminar(
                            page: 1, isFirstCall: true, isPurchased: true);
                      } else if (currentIndex == 1) {
                        BlocProvider.of<PaymentTickCubit>(context).tusZhoruT(
                            page: 1, isFirstCall: true, isPurchased: true);
                      } else if (currentIndex == 2) {
                        BlocProvider.of<PaymentTickCubit>(context)
                            .getCustomTusZhoruT(
                          page: 1,
                          isFirstCall: true,
                        );
                      }
                      // setState(() {});
                    },
                    length: 3,
                  ),
                  state.maybeWhen(
                    orElse: () {
                      return Padding(
                        padding: const EdgeInsets.only(top: 48.0).r,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.linearBlue,
                          ),
                        ),
                      );
                    },
                    loaded: (res, res2) {
                      
                      return currentIndex != 0
                          ? ListView.separated(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(16).r,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    _launchUrl(tus[index].ticketUrl ?? "");
                                    // bottomSheet(
                                    //   FractionallySizedBox(
                                    //     heightFactor: 0.5,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(16.0),
                                    //       child: Column(
                                    //         crossAxisAlignment: CrossAxisAlignment.end,
                                    //         children: [
                                    //           InkWell(
                                    //             onTap: () {
                                    //               Navigator.of(context).pop();
                                    //             },
                                    //             child: SvgPicture.asset(
                                    //               Assets.cancelSvg,
                                    //               color: AppColors.black,
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             height: 15.h,
                                    //           ),
                                    //           Container(
                                    //             width: 343.w,
                                    //             height: 156.h,
                                    //             decoration: BoxDecoration(
                                    //                 color: AppColors.white,
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(20)),
                                    //             child: Center(
                                    //               child: Column(
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment.center,
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.spaceEvenly,
                                    //                 children: [
                                    //                   SvgPicture.asset(
                                    //                       'assets/icons/check_circle.svg'),
                                    //                   Text(
                                    //                     'Төленген',
                                    //                     style: getTextStyle(
                                    //                         CustomTextStyles.s16w400),
                                    //                   ),
                                    //                   Text('${res[index].price} ₸',
                                    //                       style: getTextStyle(
                                    //                           CustomTextStyles.s24w700))
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             height: 8.h,
                                    //           ),
                                    //           Container(
                                    //             width: 343.w,
                                    //             height: 155.h,
                                    //             decoration: BoxDecoration(
                                    //                 color: AppColors.white,
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(20)),
                                    //             child: Column(
                                    //               children: [
                                    //                 SizedBox(
                                    //                   height: 8.h,
                                    //                 ),
                                    //                 const TextWidget(
                                    //                   text1: 'Статус',
                                    //                   text2: 'Төленген',
                                    //                 ),
                                    //                 TextWidget(
                                    //                   text1: 'Билет бағасы',
                                    //                   text2: '${res[index].price} ₸',
                                    //                 ),
                                    //                 TextWidget(
                                    //                   text1: 'Төленді',
                                    //                   text2:
                                    //                       '${DateFormat('dd.MM.yyyy').format(res[index].createdAt!)}, ${DateFormat.Hm().format(res[index].createdAt!)}',
                                    //                 ),
                                    //                 TextWidget(
                                    //                   text1: 'Өткізілу уақыты',
                                    //                   text2:
                                    //                       '${DateFormat.yMMMMd('kk').format(res[index].startTime!)}, ${DateFormat.Hm().format(res[index].startTime!)}',
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   context,
                                    // );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 12.w),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (tus[index].createdAt != null)
                                              Text(
                                                DateFormat('dd.MM.yyyy').format(
                                                    tus[index].createdAt!),
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s12w400)
                                                    .copyWith(
                                                        fontFamily: FontTypes
                                                            .SF_Pro.name,
                                                        color: AppColors.grey1),
                                              ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            SizedBox(
                                              width: 250.w,
                                              child: Text(
                                                '${tus[index].title}',
                                                overflow: TextOverflow.ellipsis,
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s16w600)
                                                    .copyWith(
                                                        fontFamily: FontTypes
                                                            .SF_Pro.name,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${tus[index].price!.toInt().toString()} ₸',
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w600)
                                                  .copyWith(
                                                      color: AppColors.orange),
                                            ),
                                            SizedBox(
                                              width: 13.w,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/chevron_right.svg',
                                              color: AppColors.orange,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 12.h,
                                );
                              },
                              itemCount: tus.length)
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(16).r,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    _launchUrl(res[index].ticketUrl ?? "");
                                    // bottomSheet(
                                    //   FractionallySizedBox(
                                    //     heightFactor: 0.5,
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.all(16.0),
                                    //       child: Column(
                                    //         crossAxisAlignment: CrossAxisAlignment.end,
                                    //         children: [
                                    //           InkWell(
                                    //             onTap: () {
                                    //               Navigator.of(context).pop();
                                    //             },
                                    //             child: SvgPicture.asset(
                                    //               Assets.cancelSvg,
                                    //               color: AppColors.black,
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             height: 15.h,
                                    //           ),
                                    //           Container(
                                    //             width: 343.w,
                                    //             height: 156.h,
                                    //             decoration: BoxDecoration(
                                    //                 color: AppColors.white,
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(20)),
                                    //             child: Center(
                                    //               child: Column(
                                    //                 crossAxisAlignment:
                                    //                     CrossAxisAlignment.center,
                                    //                 mainAxisAlignment:
                                    //                     MainAxisAlignment.spaceEvenly,
                                    //                 children: [
                                    //                   SvgPicture.asset(
                                    //                       'assets/icons/check_circle.svg'),
                                    //                   Text(
                                    //                     'Төленген',
                                    //                     style: getTextStyle(
                                    //                         CustomTextStyles.s16w400),
                                    //                   ),
                                    //                   Text('${res[index].price} ₸',
                                    //                       style: getTextStyle(
                                    //                           CustomTextStyles.s24w700))
                                    //                 ],
                                    //               ),
                                    //             ),
                                    //           ),
                                    //           SizedBox(
                                    //             height: 8.h,
                                    //           ),
                                    //           Container(
                                    //             width: 343.w,
                                    //             height: 155.h,
                                    //             decoration: BoxDecoration(
                                    //                 color: AppColors.white,
                                    //                 borderRadius:
                                    //                     BorderRadius.circular(20)),
                                    //             child: Column(
                                    //               children: [
                                    //                 SizedBox(
                                    //                   height: 8.h,
                                    //                 ),
                                    //                 const TextWidget(
                                    //                   text1: 'Статус',
                                    //                   text2: 'Төленген',
                                    //                 ),
                                    //                 TextWidget(
                                    //                   text1: 'Билет бағасы',
                                    //                   text2: '${res[index].price} ₸',
                                    //                 ),
                                    //                 TextWidget(
                                    //                   text1: 'Төленді',
                                    //                   text2:
                                    //                       '${DateFormat('dd.MM.yyyy').format(res[index].createdAt!)}, ${DateFormat.Hm().format(res[index].createdAt!)}',
                                    //                 ),
                                    //                 TextWidget(
                                    //                   text1: 'Өткізілу уақыты',
                                    //                   text2:
                                    //                       '${DateFormat.yMMMMd('kk').format(res[index].startTime!)}, ${DateFormat.Hm().format(res[index].startTime!)}',
                                    //                 ),
                                    //               ],
                                    //             ),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ),
                                    //   context,
                                    // );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12.h, horizontal: 12.w),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.white,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (res[index].createdAt != null)
                                              Text(
                                                DateFormat('dd.MM.yyyy').format(
                                                    res[index].createdAt!),
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s12w400)
                                                    .copyWith(
                                                        fontFamily: FontTypes
                                                            .SF_Pro.name,
                                                        color: AppColors.grey1),
                                              ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            SizedBox(
                                              width: 250.w,
                                              child: Text(
                                                '${res[index].title}',
                                                overflow: TextOverflow.ellipsis,
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s16w600)
                                                    .copyWith(
                                                        fontFamily: FontTypes
                                                            .SF_Pro.name,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${res[index].price!.toInt().toString()} ₸',
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w600)
                                                  .copyWith(
                                                      color: AppColors.orange),
                                            ),
                                            SizedBox(
                                              width: 13.w,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/chevron_right.svg',
                                              color: AppColors.orange,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 12.h,
                                );
                              },
                              itemCount: res.length);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

Future<void> _launchUrl(String _urll) async {
  final Uri _url = Uri.parse('${_urll}');
  log(_url.toString());
  if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $_url');
  }
}

class TextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const TextWidget({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 8).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: getTextStyle(CustomTextStyles.s16w400)
                .apply(color: AppColors.black),
          ),
          Text(text2, style: getTextStyle(CustomTextStyles.s16w400))
        ],
      ),
    );
  }
}
