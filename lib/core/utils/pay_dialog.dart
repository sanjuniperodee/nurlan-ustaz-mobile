import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/utils/succes_pay_dialog.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/create_tus_zhoru_cubit.dart';

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
                'Түс жорылуын алу үшін төлем жасауыңызды сұраймыз',
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
                onPressed: () async {
                   setState(() {
                    isLoading = true;
                  });
                   BlocProvider.of<CreateTusZhoruCubit>(context)
                      .createCustomTusZhoruPayment(widget.id, widget.isCustom);

                  Navigator.of(context).pop();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SuccesPayDialog(
                          price: '',
                          id: widget.id,
                          isCustom: widget.isCustom,
                        );
                      });
                },
                color: AppColors.orange,
                child: isLoading
                    ? CircularProgressIndicator()
                    : Center(
                        child: Text('${widget.price} тг төлеу',
                            style: getTextStyle(CustomTextStyles.s14w400)
                                .copyWith(
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
