import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/login_bloc.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../app/presentation/widgets/custom_text_form_profile.dart';

@RoutePage(name: 'LoginTabRoute')
class LoginTab extends StatefulWidget implements AutoRouteWrapper {
  const LoginTab({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authRemoteDs: GetIt.I()),
      child: this,
    );
  }

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // bool obscure = true;
  final obscureNotifier = ValueNotifier(true);
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    obscureNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            if (context.mounted) context.router.pop();

            context.showSuccessSnackBar('success_authorization'.tr());
          },
          failure: context.showExceptionErrorSnackBar,
        );
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormProfile(
                inputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                // onChanged: (String value) {
                //   setState(() {});
                // },
                validator: (text) {
                  if (text?.isEmpty ?? true) {
                    return 'write_email'.tr();
                  }
                  if (!isValidEmail(text ?? '')) {
                    return 'write_correct_email'.tr();
                  }
                  return null;
                },
                controller: emailController,
                hintText: 'E-mail',
                labelText: 'E-mail',
              ),
              SizedBox(height: 24.h),
              ValueListenableBuilder<bool>(
                valueListenable: obscureNotifier,
                builder: (context, obscure, child) {
                  return CustomTextFormProfile(
                    keyboardType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.done,
                    obscureText: obscure,
                    obscure: () {
                      obscureNotifier.value = !obscureNotifier.value;
                    },
                    validator: (text) {
                      if (text?.isEmpty ?? true) {
                        return 'write_password'.tr();
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: 'password'.tr(),
                    labelText: 'password'.tr(),
                  );
                },
              ),
              SizedBox(
                height: 42.h,
              ),
              AppButton(
                textSize: 16.sp,
                isLoading: state.isLoading,
                onTap: () {
                  final isValid = formKey.currentState?.validate() ?? false;
                  if (isValid) {
                    context.read<LoginBloc>().add(
                          LoginEvent(
                            tokenCreateDTO: TokenCreateDTO(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                  }
                },
                text: 'entry'.tr(),
              ),
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: AppColors.gradientSecondaryActiveButton.colors),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(30)).r),
                child: MaterialButton(
                  onPressed: () {
                    context.router.replace(const ForgotPasswordFlow());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 339.w,
                    child: SizedBox(
                      child: Text(
                        'forgot_password'.tr(),
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                          CustomTextStyles.s16w700,
                          fontFamily: FontTypes.Philosopher,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
