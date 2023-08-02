import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/login_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../app/presentation/widgets/custom_text_form_profile.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool obscure = true;

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'welcome'.tr(),
              style: getTextStyle(CustomTextStyles.s36w700).copyWith(
                  fontFamily: FontTypes.Philosopher.name, fontSize: 32),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 32.h),
            CustomTextFormProfile(
              inputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                setState(() {});
              },
              controller: emailController,
              hintText: 'E-mail',
              labelText: 'E-mail',
            ),
            SizedBox(height: 24.h),
            CustomTextFormProfile(
              keyboardType: TextInputType.visiblePassword,
              inputAction: TextInputAction.done,
              onChanged: (String value) {
                setState(() {});
              },
              obscureText: obscure,
              obscure: () {
                setState(() {
                  obscure = !obscure;
                });
              },
              controller: passwordController,
              hintText: 'password'.tr(),
              labelText: 'password'.tr(),
            ),
            SizedBox(
              height: 42.h,
            ),
            AppButton(
                textSize: 16.sp,
                isActive: (isValidEmail(emailController.value.text) &&
                    passwordController.value.text.isNotEmpty),
                onTap: () {
                  if (emailController.value.text.isEmpty &&
                      passwordController.value.text.isEmpty) {
                    buildErrorCustomSnackBar(context, 'write_email_or_password'.tr());
                    return;
                  }
                  if (emailController.value.text.isEmpty) {
                    buildErrorCustomSnackBar(context, 'write_email'.tr());
                    return;
                  }
                  if (passwordController.value.text.isEmpty) {
                    buildErrorCustomSnackBar(context, 'write_password'.tr());
                    return;
                  }
                  if (isValidEmail(emailController.value.text) == false) {
                    buildErrorCustomSnackBar(
                        context, 'write_correct_email'.tr());
                    return;
                  } else {
                    context.read<LoginCubit>().createToken(TokenCreateDTO(
                        email: emailController.text,
                        password: passwordController.text));
                  }
                },
                text: 'enter'.tr()),
            SizedBox(height: 12.h),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: AppColors.gradientSecondaryActiveButton.colors),
                  borderRadius: const BorderRadius.all(Radius.circular(30)).r),
              child: MaterialButton(
                onPressed: () {
                  context.router.push(const ForgotPasswordPageRoute());
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 339.w,
                  child: SizedBox(
                    child: Text('forgot_password'.tr(),
                        textAlign: TextAlign.center,
                        style: getTextStyle(CustomTextStyles.s16w200)
                            .apply(fontFamily: FontTypes.Philosopher.name)
                            .copyWith(
                                fontWeight: FontWeight.w700, fontSize: 16.sp)
                            .apply(
                              color: AppColors.blue,
                            )),
                  ),
                ),
              ),
            )
          ],
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loadingState: () {
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.linearBlue,
              ),
            );
          },
          loadedState: () async {
            emailController.clear();
            passwordController.clear();
            context.router.popAndPush(const LauncherAppRoute(),);
          },
          errorState: (message) {
            buildErrorCustomSnackBar(context, message);
          },
          orElse: () {},
        );
      },
    );
  }
}
