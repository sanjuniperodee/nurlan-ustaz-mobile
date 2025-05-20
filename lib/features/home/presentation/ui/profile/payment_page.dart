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

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/custom_tab_bar.dart';

@RoutePage()
class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

int primaryIndex = 0;
int secondIndex = 0;

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
        if (state is PaymentTickLoadedState) {
          res = state.res;
          tus = state.res2;
        }
      },
      builder: (context, state) {
        return GlobalCustomBody(
          child: SizedBox(
            height: 1.1.sh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'Purchased_services'.tr(),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: CustomTabBar(
                      height: 50,
                      tabs: [
                        Tab(
                          text: 'seminars'.tr(),
                        ),
                        Tab(
                          text: 'dream_interpretation'.tr(),
                        ),
                      ],
                      onTap: (value) {
                        primaryIndex = value;
                        BlocProvider.of<PaymentTickCubit>(context).listHome =
                            [];
                        BlocProvider.of<PaymentTickCubit>(context).listTus = [];
                        log('INDEX:::${primaryIndex.toString()}');
                        if (primaryIndex == 0) {
                          BlocProvider.of<PaymentTickCubit>(context).seminar(
                              page: 1, isFirstCall: true, isPurchased: true);
                        } else if (primaryIndex == 1) {
                          BlocProvider.of<PaymentTickCubit>(context).tusZhoruT(
                              page: 1, isFirstCall: true, isPurchased: true);
                        }
                        // setState(() {});
                      },
                      length: 2,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  if (primaryIndex == 1)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: CustomTabBar(
                        height: 50,
                        tabs: [
                          Tab(
                            text: 'all'.tr(),
                          ),
                          Tab(
                            text: 'personal_dream'.tr(),
                          ),
                        ],
                        onTap: (value) {
                          secondIndex = value;
                          BlocProvider.of<PaymentTickCubit>(context).listHome =
                              [];
                          BlocProvider.of<PaymentTickCubit>(context).listTus =
                              [];
                          if (secondIndex == 0) {
                            BlocProvider.of<PaymentTickCubit>(context)
                                .tusZhoruT(page: 1, isFirstCall: true);
                          }
                          if (secondIndex == 1) {
                            BlocProvider.of<PaymentTickCubit>(context)
                                .getCustomTusZhoruT(page: 1, isFirstCall: true);
                          }
                          // setState(() {});
                        },
                        length: 2,
                      ),
                    ),
                  switch (state) {
                    PaymentTickLoadedState(:final res) => primaryIndex != 0
                        ? ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(16).r,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () async {
                                  await launchUrl(
                                    Uri.parse(tus[index].ticketUrl!),
                                    mode: LaunchMode.externalApplication,
                                  );
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
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (tus[index].createdAt != null)
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                DateFormat('dd.MM.yyyy').format(
                                                    tus[index].createdAt!),
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s12w400)
                                                    .copyWith(
                                                        fontFamily: FontTypes
                                                            .SFPro.name,
                                                        color: AppColors.grey1),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          SizedBox(
                                            width: 130.w,
                                            child: Text(
                                              '${tus[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w600)
                                                  .copyWith(
                                                      fontFamily:
                                                          FontTypes.SFPro.name,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      Spacer(),
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
                                  log('URL${res[index].ticketUrl}');
                                  _launchUrl(res[index].ticketUrl ?? "");
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
                                      Expanded(
                                        child: Column(
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
                                                  fontFamily:
                                                      FontTypes.SFPro.name,
                                                  color: AppColors.grey1,
                                                ),
                                              ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Text(
                                              '${res[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w600)
                                                  .copyWith(
                                                fontFamily:
                                                    FontTypes.SFPro.name,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${res[index].price!.toInt().toString()} ₸',
                                            style: getTextStyle(
                                                    CustomTextStyles.s16w600)
                                                .copyWith(
                                              color: AppColors.orange,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 13.w,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/chevron_right.svg',
                                            color: AppColors.orange,
                                          ),
                                        ],
                                      ),
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
                            itemCount: res.length,
                          ),
                    _ => Padding(
                        padding: const EdgeInsets.only(top: 250).h,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.linearBlue,
                          ),
                        ),
                      ),
                  }
                  // state.maybeWhen(
                  //   orElse: () {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(top: 250).h,
                  //       child: const Center(
                  //         child: CircularProgressIndicator(
                  //           color: AppColors.linearBlue,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   loaded: (res, res2) {
                  //     return
                  //   },
                  // )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}

Future<void> _launchUrl(String urll) async {
  final Uri url = Uri.parse(urll);
  log(url.toString());
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
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
