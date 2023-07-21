import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/model/payment_model.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/bottom_sheet.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/payment_tick_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../../app/presentation/widgets/custom_tab_bar.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

int currentIndex = 1;

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  void initState() {
    BlocProvider.of<PaymentTickCubit>(context)
        .seminar(page: 1, isFirstCall: true, isPurchased: true);

    super.initState();
  }

  List<ResultHomeDTO> res = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GlobalCustomBody(
      child: SizedBox(
        height: 1.1.sh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const CustomAppBar(
              title: 'Сатып алынған қызметтер',
            ),
            const SizedBox(
              height: 36,
            ),
            CustomTabBar(
              tabs: const [
                Tab(
                  text: 'Семинарлар',
                ),
                Tab(
                  text: 'Түс жорулар',
                ),
              ],
              onTap: (int) {
                log('INDEX:::${currentIndex.toString()}');
                if (currentIndex != 0) {
                  log(1.toString());
                  BlocProvider.of<PaymentTickCubit>(context)
                      .seminar(page: 1, isFirstCall: true, isPurchased: true);
                } else {
                  log(2.toString());
                  BlocProvider.of<PaymentTickCubit>(context)
                      .tusZhoruT(page: 1, isFirstCall: true, isPurchased: true);
                }
                currentIndex = int;
              },
              length: 2,
            ),
            BlocConsumer<PaymentTickCubit, PaymentTickState>(
                listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                loaded: (
                  ress,
                ) {
                  res = ress;
                },
              );
            }, builder: (context, state) {
              state.whenOrNull(
                loadingState: () {
                  return const CircularProgressIndicator(
                    color: AppColors.danger,
                  );
                },
              );
              return ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('dd.MM.yyyy')
                                      .format(res[index].createdAt!),
                                  style: getTextStyle(CustomTextStyles.s12w400)
                                      .copyWith(
                                          fontFamily: FontTypes.SF_Pro.name,
                                          color: AppColors.grey1),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  '${res[index].title}',
                                  style: getTextStyle(CustomTextStyles.s16w600)
                                      .copyWith(
                                          fontFamily: FontTypes.SF_Pro.name,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${res[index].price} ₸',
                                  style: getTextStyle(CustomTextStyles.s16w600)
                                      .copyWith(color: AppColors.orange),
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
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 12.h,
                    );
                  },
                  itemCount: res.length);
            })
          ]),
        ),
      ),
    ));
  }
}

Future<void> _launchUrl(String _urll) async {
  final Uri _url = Uri.parse('${_urll}');
  if (!await launchUrl(_url)) {
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
