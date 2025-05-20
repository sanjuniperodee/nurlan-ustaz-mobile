import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password/get_user_id_by_email_bloc.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/custom_text_form_profile.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget implements AutoRouteWrapper {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocListener<GetUserIdByEmailBloc, GetUserIdByEmailState>(
          listener: (context, state) {
            return state.maybeWhen(
              success: (data) {
                if (!context.mounted) return;
                context.replaceRoute(
                  CodeVerificationForgotRoute(
                    email: data.$1,
                    userId: data.$2,
                  ),
                );
              },
              orElse: (_) {},
            );
          },
        )
      ],
      child: this,
    );
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder<TextEditingValue>(
          valueListenable: emailController,
          builder: (context, editingValue, child) {
            return BlocSelector<GetUserIdByEmailBloc, GetUserIdByEmailState,
                bool>(
              selector: (state) => state.isLoading,
              builder: (context, isLoading) {
                return SizedBox(
                  height: 52.sp,
                  child: AppButton(
                    textSize: 16.sp,
                    isActive: isValidEmail(editingValue.text),
                    isLoading: isLoading,
                    onTap: () {
                      context
                          .read<GetUserIdByEmailBloc>()
                          .add(GetUserIdByEmailEvent(editingValue.text));
                    },
                    text: 'next'.tr(),
                  ),
                );
              },
            );
          },
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
                onTap: () {
                  context.router.navigate(const BaseRoute());
                },
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
                controller: emailController,
                hintText: 'E-mail',
                labelText: 'E-mail',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
