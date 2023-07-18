import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/code_verification_cubit.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification(
      {Key? key, required this.email, required this.userId, required this.password})
      : super(key: key);
  final String email;
  final int userId;
  final String password;

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}
bool isLoading = false;

class _CodeVerificationState extends State<CodeVerification> {
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
    print(widget.password);
    return BlocConsumer<CodeVerificationCubit, CodeVerificationState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(16),
            child: AppButton(
                onTap: () {

                  context.read<CodeVerificationCubit>().sendCode(pinController.text, widget.userId,TokenCreateDTO(email: widget.email,password: widget.password));
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
                  const CustomAppBar(
                    title: 'Растау коды',
                    color: AppColors.black,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Text(
                    'Растау кодын енгізіңіз. Код төменде көрсетілген поштаға жіберілді: ${widget.email}',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18.h),
                  Pinput(
                    submittedPinTheme: submitted,
                    focusedPinTheme: focusPinTheme,
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    useNativeKeyboard: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                    ],
                    controller: pinController,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        state.maybeWhen(
          loadingState: () {},
          loadedState: () {
            context.router.push(const LauncherAppRoute());
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
