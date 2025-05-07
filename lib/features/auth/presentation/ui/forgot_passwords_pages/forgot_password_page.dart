import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_passwords_pages/new_password_page.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../../app/presentation/widgets/custom_text_form_profile.dart';
import 'code_verification_forgot.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailController.value.text);
  }

  final bool isActiveButton = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubitCubit, ForgotPasswordState>(
      builder: (context, state) {
        return switch (state) {
          ForgotPasswordLoadingState() => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.linearBlue,
                ),
              ),
            ),
          ForgotPasswordVerificationCodeState() => CodeVerificationForgotPage(
              email: emailController.value.text,
            ),
          ForgotPasswordNewPasswordState() => const NewPasswordPage(),
          ForgotPasswordInitialState() => Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(16),
                child: AppButton(
                  textSize: 16.sp,
                  isActive: (isValidEmail() &&
                      emailController.value.text.length >= 5),
                  onTap: () {
                    if (emailController.value.text.length <= 5) {
                      buildErrorCustomSnackBar(context, 'write_email'.tr());
                    } else {
                      bool isValidEmail() {
                        return RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(emailController.value.text);
                      }

                      isValidEmail()
                          ? BlocProvider.of<ForgotPasswordCubitCubit>(context)
                              .getIdByMail(emailController.value.text)
                          : buildErrorCustomSnackBar(
                              context, 'write_correct_email'.tr());
                    }

                    //context.read<CodeVerificationCubit>().sendCode(pinController.text, widget.userId,TokenCreateDTO(email: widget.email,password: widget.password));
                  },
                  text: 'next'.tr(),
                ),
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
                        title: 'forgot_password'.tr(),
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Text(
                        'enter_data'.tr(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 18.h),
                      CustomTextFormProfile(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (String) {
                          setState(() {});
                        },
                        controller: emailController,
                        hintText: 'E-mail',
                        labelText: 'E-mail',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          _ => const SizedBox.shrink(),
        };
      },
      listener: (context, state) {
        switch (state) {
          case ForgotPasswordSuccessConfirmState():
            Navigator.of(context).pop();
            buildSuccessCustomSnackBar(context, 'success'.tr());
            break;
          case ForgotPasswordErrorState(:final message):
            buildErrorCustomSnackBar(context, message);
            break;
          default:
        }
      },
    );
  }
}
