import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/create_tus_zhoru_cubit.dart';

import '../../features/auth/presentation/widgets/pdf_screen.dart';
import '../../features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';
import '../common/app_styles.dart';
import '../common/colors.dart';

class PayDialog extends StatefulWidget {
  const PayDialog(
      {Key? key, required this.price, required this.id, required this.isCustom})
      : super(key: key);
  final String price;
  final int id;
  final bool isCustom;

  @override
  State<PayDialog> createState() => _PayDialogState();
}

bool isLoading = false;

class _PayDialogState extends State<PayDialog> {
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
                child: SvgPicture.asset('assets/icons/money_transfer.svg'),
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "dream_payment".tr(),
                style: getTextStyle(CustomTextStyles.s16w400)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 27.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27)),
                height: 44,
                onPressed: isLoading == false
                    ? () async {
                        Navigator.of(context).pop();
                        widget.isCustom
                            ? BlocProvider.of<TusZhoruCubit>(context)
                                .getCustomTusZhoruT(page: 1)
                            : BlocProvider.of<TusZhoruCubit>(context)
                                .tosZhoruList;
                        setState(() {
                          isLoading = true;
                        });
                        BlocProvider.of<CreateTusZhoruCubit>(context)
                            .createCustomTusZhoruPayment(
                                widget.id, widget.isCustom)
                            .then((value) {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      }
                    : null,
                color: AppColors.orange,
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Center(
                        child: Text('${widget.price} тг ${"dream_pay".tr()}',
                            style: getTextStyle(CustomTextStyles.s14w400)
                                .copyWith(
                                    fontFamily: FontTypes.SF_Pro.name,
                                    color: AppColors.white)),
                      ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPdfViewer(
                              assetPdf: 'public_oferta.pdf',
                              title: 'publicOferta'.tr()),
                        ),
                      );
                    },
                    child: Text(
                      'publicOferta'.tr(),
                      style: getTextStyle(CustomTextStyles.s12w400).copyWith(
                        color: AppColors.blue,
                          fontFamily: FontTypes.SF_Pro.name,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),

                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPdfViewer(
                            assetPdf: 'payment_process.pdf',
                            title: 'payment_process'.tr(),
                          ),
                        ),
                      );
                    },
                    child: Text('payment_process'.tr(),
                        style: getTextStyle(CustomTextStyles.s12w400).copyWith(
                            fontFamily: FontTypes.SF_Pro.name,color: AppColors.blue,
                            decoration: TextDecoration.underline)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
