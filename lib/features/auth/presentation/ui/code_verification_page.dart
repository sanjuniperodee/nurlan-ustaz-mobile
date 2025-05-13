import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/code_verification_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/common/colors.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../widgets/custom_button_timer.dart';

@RoutePage()
class CodeVerificationPage extends StatefulWidget {
  const CodeVerificationPage(
      {super.key,
      required this.email,
      required this.userId,
      required this.password,
      required this.userPayload});
  final UserPayload userPayload;
  final String email;
  final int userId;
  final String password;

  @override
  State<CodeVerificationPage> createState() => _CodeVerificationPageState();
}

bool isLoading = false;

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
    return BlocConsumer<CodeVerificationCubit, CodeVerificationState>(
      builder: (context, state) {
        if (state is CodeVerificationLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is CodeVerificationInitialState) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
                padding: const EdgeInsets.all(16),
                child: CustomAppButtonTimer(
                  isActive: true,
                  onTap: () async {
                    context
                        .read<CodeVerificationCubit>()
                        .resendCode(widget.email);
                  },
                  text: 'send_again'.tr(),
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
                      title: 'confirmation_code'.tr(),
                      color: AppColors.black,
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Text(
                      '${'mail_code'.tr()}${widget.email}',
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
                        context.read<CodeVerificationCubit>().sendCode(
                            pinController.text,
                            widget.userId,
                            TokenCreateDTO(
                                email: widget.email,
                                password: widget.password));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        // TODO: error widget
        return const SizedBox.shrink();
      },
      listener: (context, state) {
        switch (state) {
          case CodeVerificationLoadedState():
            context.router.push(const BaseRoute());
            break;
          case CodeVerificationErrorState(:final message):
            pinController.clear();
            buildErrorCustomSnackBar(context, message);
            break;
          default:
        }
      },
    );
  }
}
