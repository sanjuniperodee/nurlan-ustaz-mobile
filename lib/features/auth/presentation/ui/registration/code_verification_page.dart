import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/registration/resend_activation_code_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/registration/verify_code_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/custom_snackbars.dart';
import '../../widgets/custom_button_timer.dart';

@RoutePage()
class CodeVerificationPage extends StatefulWidget implements AutoRouteWrapper {
  const CodeVerificationPage({
    required this.userPayload,
    super.key,
  });

  final UserDto userPayload;

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResendActivationCodeBloc(
            authRepository: GetIt.I(),
          ),
        ),
        BlocProvider(
          create: (context) => VerifyCodeBloc(
            authRepository: GetIt.I(),
          ),
        ),

        // Listeners
        BlocListener<ResendActivationCodeBloc, ResendActivationCodeState>(
          listener: (context, state) {
            return state.maybeWhen(
              success: () =>
                  context.showSuccessSnackBar('code_sent_successfully'.tr()),
              failure: context.showExceptionErrorSnackBar,
              orElse: () {},
            );
          },
        ),
        BlocListener<VerifyCodeBloc, VerifyCodeState>(
          listener: (context, state) {
            return state.maybeWhen(
              success: () {
                if (context.mounted) {
                  context.router.pop();
                }
                context.showSuccessSnackBar('successful_registration'.tr());
              },
              failure: context.showExceptionErrorSnackBar,
              orElse: () {},
            );
          },
        )
      ],
      child: this,
    );
  }
}

class _CodeVerificationPageState extends State<CodeVerificationPage> {
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
      border: Border.all(width: 1, color: AppColors.blue),
    ),
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
      border: Border.all(width: 4, color: AppColors.blue),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomAppButtonTimer(
          onTap: () async {
            final bloc = context.read<ResendActivationCodeBloc>();
            final future = bloc.stream.firstWhere((e) => e.isExecuted);
            bloc.add(
                ResendActivationCodeEvent(email: widget.userPayload.email!));
            await future;
            return true;
          },
          text: 'send_again'.tr(),
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
                title: 'confirmation_code'.tr(),
                color: AppColors.black,
              ),
              SizedBox(
                height: 36.h,
              ),
              Text(
                '${'mail_code'.tr()} ${widget.userPayload.email!}',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 18.h),
              Pinput(
                submittedPinTheme: submitted,
                focusedPinTheme: focusPinTheme,
                defaultPinTheme: defaultPinTheme,
                length: 6,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                useNativeKeyboard: true,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                ],
                controller: pinController,
                onCompleted: (String value) async {
                  context.read<VerifyCodeBloc>().add(
                        VerifyCodeEvent(
                          code: pinController.text,
                          user: widget.userPayload,
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
