import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password/set_new_password_bloc.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/app_button.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/custom_text_form_profile.dart';

@RoutePage()
class NewPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const NewPasswordPage({
    required this.email,
    required this.sessionId,
    super.key,
  });

  @protected
  final String email;

  @protected
  final String sessionId;

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SetNewPasswordBloc(authRepository: GetIt.I()),
        ),
        //
        BlocListener<SetNewPasswordBloc, SetNewPasswordState>(
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                context
                    .showSuccessSnackBar('password_changed_successfully'.tr());
                if (context.mounted) {
                  context.router.navigate(const BaseRoute());
                }
              },
              failure: context.showExceptionErrorSnackBar,
              orElse: () {},
            );
          },
        ),
      ],
      child: this,
    );
  }
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final firstPasswordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  final obscureFirstNotifier = ValueNotifier(true);
  final obscureSecondNotifier = ValueNotifier(true);
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firstPasswordController.dispose();
    secondPasswordController.dispose();
    obscureFirstNotifier.dispose();
    obscureSecondNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:
            BlocSelector<SetNewPasswordBloc, SetNewPasswordState, bool>(
          selector: (state) => state.isLoading,
          builder: (context, isLoading) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 52.h,
                child: AppButton(
                  isLoading: isLoading,
                  textSize: 16.sp,
                  onTap: () {
                    if (formKey.currentState?.validate() ?? false) {
                      context.read<SetNewPasswordBloc>().add(
                            SetNewPasswordEvent(
                              email: widget.email,
                              sessionId: widget.sessionId,
                              newPassword: firstPasswordController.text,
                              reNewPassword: secondPasswordController.text,
                            ),
                          );
                    }
                  },
                  text: 'ready'.tr(),
                ),
              ),
            );
          },
        ),
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Column(
              children: [
                SizedBox(height: 56.h),
                //
                CustomAppBar(
                  onTap: () {
                    context.router.replace(const ForgotPasswordRoute());
                  },
                  title: 'Password_recovery'.tr(),
                  color: AppColors.black,
                ),
                //
                SizedBox(height: 36.h),
                //
                ValueListenableBuilder(
                  valueListenable: obscureFirstNotifier,
                  builder: (context, obscure, child) {
                    return CustomTextFormProfile(
                      controller: firstPasswordController,
                      hintText: 'new_password'.tr(),
                      labelText: 'new_password'.tr(),
                      obscureText: obscure,
                      obscure: () => obscureFirstNotifier.value = !obscure,
                      validator: ValidatorManager.password().call,
                    );
                  },
                ),
                //
                SizedBox(height: 18.h),
                //
                ValueListenableBuilder(
                  valueListenable: obscureSecondNotifier,
                  builder: (context, obscure, child) {
                    return CustomTextFormProfile(
                      controller: secondPasswordController,
                      hintText: 'repeat_new_password'.tr(),
                      labelText: 'repeat_new_password'.tr(),
                      obscureText: obscure,
                      obscure: () => obscureSecondNotifier.value = !obscure,
                      validator: (text) {
                        if (text != firstPasswordController.text) {
                          return 'password_dont_match'.tr();
                        }
                        return null;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
