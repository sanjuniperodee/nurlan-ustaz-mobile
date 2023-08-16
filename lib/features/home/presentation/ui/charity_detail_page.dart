import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';

@RoutePage()
class CharityDetailPage extends StatefulWidget {
  final ResultHomeDTO result;
  const CharityDetailPage({super.key, required this.result});

  @override
  State<CharityDetailPage> createState() => _CharityDetailPageState();
}

class _CharityDetailPageState extends State<CharityDetailPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: widget.result.cover ?? '',
            fit: BoxFit.cover,
            width: 1.sw,
            errorWidget: (a, b, c) => SizedBox(
              width: 1.sw,
              height: 120.h,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            reverse: false,
            child: Padding(
                padding: const EdgeInsets.only(top: 280).r,
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(30).r,
                        topLeft: const Radius.circular(30).r,
                      )),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.result.title ?? 'ERROR',
                        style: getTextStyle(CustomTextStyles.s20w700)
                            .apply(color: AppColors.black),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        widget.result.text ?? 'ERROR',
                        style: getTextStyle(CustomTextStyles.s16w400)
                            .apply(color: AppColors.black),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Реквизиты',
                        style: getTextStyle(CustomTextStyles.s20w700)
                            .apply(color: AppColors.black),
                      ),
                      if (widget.result.requisites != null)
                        ListView.builder(
                          itemCount: widget.result.requisites!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0).r,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.orange.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20).r),
                                child: Theme(
                                  data: theme,
                                  child: ExpansionTile(
                                    collapsedIconColor: AppColors.orange,
                                    iconColor: AppColors.orange,
                                    title: Text(
                                      widget.result.requisites![index]
                                              .legalEntity ??
                                          'ERROR',
                                      style: getTextStyle(
                                          CustomTextStyles.s14w400),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                            'assets/icons/chari.svg'),
                                        // Assets.paymentCardSvg
                                        title: Text(
                                          widget.result.requisites![index]
                                                  .bankAccountNumber ??
                                              'ERROR',
                                          style: getTextStyle(
                                              CustomTextStyles.s14w400),
                                        ),
                                        trailing: InkWell(
                                            onTap: () async {
                                              await FlutterClipboard.copy(widget
                                                      .result
                                                      .requisites![index]
                                                      .bankAccountNumber!)
                                                  .then((value) =>
                                                      buildSuccessCustomSnackBar(
                                                          context, 'saved'.tr()));
                                            },
                                            child: SvgPicture.asset(
                                                Assets.copiedSvg)),
                                      ),
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading:
                                            SvgPicture.asset(Assets.phoneSvg),
                                        title: Text(
                                          widget.result.requisites![index]
                                                  .phoneNumber ??
                                              'ERROR',
                                          style: getTextStyle(
                                              CustomTextStyles.s14w400),
                                        ),
                                        trailing: InkWell(
                                            onTap: () async {
                                              await FlutterClipboard.copy(widget
                                                      .result
                                                      .requisites![index]
                                                      .phoneNumber!)
                                                  .then((value) =>
                                                      buildSuccessCustomSnackBar(
                                                          context, 'saved'.tr()));
                                            },
                                            child: SvgPicture.asset(
                                                Assets.copiedSvg)),
                                      ),
                                      CustomListTIle(
                                        widget: widget,
                                        svg: Assets.paymentCardSvg,
                                        text1: widget.result.requisites![index]
                                                .cardNumber ??
                                            'ERROR',
                                        text: widget.result.requisites![index]
                                                .cardNumber ??
                                            'ERROR',
                                      ),
                                      CustomListTIle(
                                        widget: widget,
                                        text1: widget.result.requisites![index]
                                                .bin ??
                                            'ERROR',
                                        text:
                                            '${'bin'.tr()}: ${widget.result.requisites![index].bin} ',
                                      ),
                                      CustomListTIle(
                                        widget: widget,
                                        text1: widget.result.requisites![index]
                                                .iic ??
                                            'ERROR',
                                        text:
                                            '${'iin'.tr()}: ${widget.result.requisites![index].iic} ',
                                      ),
                                      CustomListTIle(
                                        widget: widget,
                                        text1: widget.result.requisites![index]
                                                .bic ??
                                            'ERROR',
                                        text:
                                            'БИК: ${widget.result.requisites![index].bic}',
                                      ),
                                      CustomListTIle(
                                        text1: widget.result.requisites![index]
                                                .ppc ??
                                            'ERROR',
                                        widget: widget,
                                        text:
                                            '${'cnp'.tr()}: ${widget.result.requisites![index].ppc}',
                                      ),
                                      CustomListTIle(
                                        text1: widget.result.requisites![index]
                                                .url ??
                                            'ERROR',
                                        widget: widget,
                                        text: widget.result.requisites![index]
                                                .url ??
                                            'ERROR',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                )),
          ),
          Positioned(
              top: 54.r,
              left: 16.r,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(Assets.backStackSvg))),
        ],
      ),
    );
  }
}

class CustomListTIle extends StatelessWidget {
  final String text;
  final String text1;
  final String? svg;
  const CustomListTIle({
    super.key,
    required this.widget,
    required this.text,
    required this.text1,
    this.svg,
  });

  final CharityDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      leading: svg == null
          ? SvgPicture.asset(Assets.dontSvg)
          : SvgPicture.asset(svg!),
      title: Text(
        text,
        style: getTextStyle(CustomTextStyles.s14w400),
      ),
      trailing: InkWell(
          onTap: () async {
            await FlutterClipboard.copy(text1).then(
                (value) => buildSuccessCustomSnackBar(context, 'saved'.tr()));
          },
          child: SvgPicture.asset(Assets.copiedSvg)),
    );
  }
}
