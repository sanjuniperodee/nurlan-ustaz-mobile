import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../widgets/custom_button_timer.dart';

class CodeVerificationForgot extends StatefulWidget {
  const CodeVerificationForgot({
    Key? key, required this.email,
  }) : super(key: key);
  final String email;


  @override
  State<CodeVerificationForgot> createState() => _CodeVerificationForgotState();
}


bool isActiveButton = false;

class _CodeVerificationForgotState extends State<CodeVerificationForgot> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final defaultPinTheme = PinTheme(
    width: 64,
    height: 64,
    textStyle: const TextStyle(
      fontSize: 28,
      color: AppColors.black,
    ),
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 1, color: AppColors.blue)),
  );

  final submitted = PinTheme(
    width: 64,
    height: 64,
    textStyle: const TextStyle(
      fontSize: 28,
      color: AppColors.black,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
            colors: AppColors.gradientSecondaryActiveButton.colors)),
  );
  final focusPinTheme = PinTheme(
    width: 64,
    height: 64,
    textStyle: const TextStyle(
      fontSize: 28,
      color: AppColors.black,
    ),
    decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 4, color: AppColors.blue)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomAppButtonTimer(
            isActive: true,
            onTap: () async {
              await BlocProvider.of<ForgotPasswordCubitCubit>(context)
                  .getIdByMail(widget.email);
            },
            text: 'Қайта жіберу ',
          )),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            children: [
              SizedBox(
                height: 56.h,
              ),
               CustomAppBar(
                onTap: (){
                  BlocProvider.of<ForgotPasswordCubitCubit>(context).toInitialPage();
                },
                title: 'Растау коды',
                color: AppColors.black,
              ),

              SizedBox(
                height: 36.h,
              ),
              Text(
                'Растау кодын енгізіңіз. Код төменде көрсетілген поштаға жіберілді ${widget
                    .email}',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 18.h),
              Pinput(
                submittedPinTheme: submitted,
                focusedPinTheme: focusPinTheme,
                defaultPinTheme: defaultPinTheme,
                length: 6,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                useNativeKeyboard: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                ],
                controller: pinController,
                onCompleted: (String value) async {
                  await BlocProvider.of<ForgotPasswordCubitCubit>(context)
                      .toNewPasswordPage(code: value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
