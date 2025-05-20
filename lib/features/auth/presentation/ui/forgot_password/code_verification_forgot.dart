import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password/get_user_id_by_email_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password/verify_forgot_code_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../widgets/custom_button_timer.dart';

@RoutePage()
class CodeVerificationForgotPage extends StatefulWidget
    implements AutoRouteWrapper {
  const CodeVerificationForgotPage({
    super.key,
    required this.email,
    required this.userId,
  });

  @protected
  final String email;

  @protected
  final int userId;

  @override
  State<CodeVerificationForgotPage> createState() =>
      _CodeVerificationForgotPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VerifyForgotCodeBloc(authRemoteDs: GetIt.I()),
        ),
        //
        BlocListener<VerifyForgotCodeBloc, VerifyForgotCodeState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (data) {
                context.router.replace(NewPasswordRoute(
                  email: email,
                  sessionId: data,
                ));
              },
              failure: context.showExceptionErrorSnackBar,
              orElse: (_) {},
            );
          },
        ),
      ],
      child: this,
    );
  }
}

class _CodeVerificationForgotPageState
    extends State<CodeVerificationForgotPage> {
  bool isActiveButton = false;
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
        colors: AppColors.gradientSecondaryActiveButton.colors,
      ),
    ),
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
      floatingActionButton:
          BlocSelector<VerifyForgotCodeBloc, VerifyForgotCodeState, bool>(
        selector: (state) => state.isLoading,
        builder: (context, verifyCodeLoading) {
          return BlocSelector<GetUserIdByEmailBloc, GetUserIdByEmailState,
              bool>(
            selector: (state) => state.isLoading,
            builder: (context, getUserIdLoading) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 52.sp,
                  child: CustomAppButtonTimer(
                    isLoading: getUserIdLoading || verifyCodeLoading,
                    onTap: () async {
                      final bloc = context.read<GetUserIdByEmailBloc>();
                      final future =
                          bloc.stream.firstWhere((e) => e.isExecuted);
                      bloc.add(GetUserIdByEmailEvent(widget.email));
                      await future;
                      return true;
                    },
                    text: 'send_again'.tr(),
                  ),
                ),
              );
            },
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
              SizedBox(
                height: 56.h,
              ),
              CustomAppBar(
                onTap: () {
                  context.router.replace(ForgotPasswordRoute());
                },
                title: 'confirmation_code'.tr(),
                color: AppColors.black,
              ),
              SizedBox(
                height: 36.h,
              ),
              Text(
                '${'mail_code'.tr()} ${widget.email}',
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
                onCompleted: (String value) {
                  context.read<VerifyForgotCodeBloc>().add(
                        VerifyForgotCodeEvent(
                          userId: widget.userId,
                          code: value,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
