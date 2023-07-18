import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/app_button.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../../app/presentation/widgets/custom_text_form_profile.dart';
import '../../../../app/presentation/widgets/validators.dart';
import '../../bloc/forgot_password_cubit.dart';
import '../login_form.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key, required this.pinCode}) : super(key: key);
  final String pinCode;

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

TextEditingController firstPasswordController = TextEditingController();
TextEditingController secondPasswordController = TextEditingController();
bool obscureFirst = true;
bool obscureSecond = true;

class _NewPasswordPageState extends State<NewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: AppButton(
          textSize: 16.sp,
            isActive: (firstPasswordController.value.text ==
                    secondPasswordController.value.text &&
                firstPasswordController.value.text.isNotEmpty &&
                secondPasswordController.value.text.isNotEmpty && firstPasswordController.length > 8),

            onTap: () {
              (firstPasswordController.value.text ==
                  secondPasswordController.value.text &&
                  firstPasswordController.value.text.isNotEmpty &&
                  secondPasswordController.value.text.isNotEmpty && firstPasswordController.length > 8) ?
              context.read<ForgotPasswordCubitCubit>().resetConfirm(
                    code: widget.pinCode,
                    newPassword: firstPasswordController.value.text,
                    reNewPassword: secondPasswordController.value.text,

                  ) : (){
                return;
              };
            },
            text: 'Дайын'),
      ),
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
                onTap: () {
                  BlocProvider.of<ForgotPasswordCubitCubit>(context)
                      .toCodeVerificationPage();
                },
                title: 'Құпия сөзді қалпына келтіру',
                color: AppColors.black,
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomTextFormProfile(
                onChanged: (String) {
                  setState(() {});
                },
                controller: firstPasswordController,
                hintText: 'Жаңа құпия сөз',
                labelText: 'Жаңа құпия сөз',
                obscureText: obscureFirst,

                obscure: (){
                  setState(() {
                    obscureFirst = !obscureFirst;
                  });
                },
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomTextFormProfile(
                onChanged: (String) {
                  setState(() {});
                },
                controller: secondPasswordController,
                hintText: 'Жаңа құпия сөзді қайталаңыз',
                labelText: 'Жаңа құпия сөзді қайталаңыз',
                obscureText: obscureSecond,

                obscure: (){
                  setState(() {
                    obscureSecond = !obscureSecond;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
