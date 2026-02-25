import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/registration/registration_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/widgets/private_policy_text.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/app_button.dart';
import '../../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../../app/presentation/widgets/custom_text_form_profile.dart';

// TODO: регистрацию проверить не получилось из-за 500 ошибки сервера при отправке email
@RoutePage(name: 'RegistrationTabRoute')
class RegistrationTab extends StatefulWidget implements AutoRouteWrapper {
  const RegistrationTab({super.key});

  @override
  State<RegistrationTab> createState() => _RegistrationTabState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(authRepository: GetIt.I()),
      child: this,
    );
  }
}

void _showDialog(
  Widget child,
  BuildContext context,
) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: child,
      ),
    ),
  );
}

class _RegistrationTabState extends State<RegistrationTab> {
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(mask: '+###########');
  final obscureFirstPasswordNotifier = ValueNotifier(true);
  final obscureSecondPasswordNotifier = ValueNotifier(true);
  final privacyAcceptedNotifier = ValueNotifier(false);
  final genderNotifier = ValueNotifier(Gender.male);
  final formKey = GlobalKey<FormState>();
  final dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void dispose() {
    dateController.dispose();
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    //
    obscureFirstPasswordNotifier.dispose();
    obscureSecondPasswordNotifier.dispose();
    privacyAcceptedNotifier.dispose();
    genderNotifier.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: (data) {},
          success: (user) {
            context.router.replace(
              CodeVerificationRoute(
                userPayload: user,
              ),
            );
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
                keyboardType: TextInputType.name,
                controller: nameController,
                hintText: 'name-surname'.tr(),
                labelText: 'name-surname'.tr(),
                validator: ValidatorManager.notEmpty().call,
              ),
              SizedBox(height: 24.h),
              CustomTextFormProfile(
                inputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                hintText: 'E-mail',
                labelText: 'E-mail',
                validator: ValidatorManager.email().call,
              ),
              SizedBox(height: 24.h),
              CustomTextFormProfile(
                keyboardType: TextInputType.phone,
                inputFormatters: [maskFormatter],
                controller: numberController,
                hintText: 'phone_number'.tr(),
                labelText: 'phone_number'.tr(),
                validator: ValidatorManager.twelveSymbolsPhone().call,
              ),
              SizedBox(height: 24.h),
              CustomTextFormProfile(
                inputAction: TextInputAction.next,
                onTap: () {
                  _showDialog(
                      CupertinoDatePicker(
                        dateOrder: DatePickerDateOrder.dmy,
                        minimumYear: DateTime.now().year - 73,
                        maximumYear: DateTime.now().year - 10,

                        initialDateTime:
                            DateTime.now().subtract(Duration(days: 365 * 10)),
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        // This is called when the user changes the date.
                        onDateTimeChanged: (DateTime newDate) {
                          dateController.text = dateFormat.format(newDate);
                        },
                      ),
                      context);
                },
                readOnly: true,
                controller: dateController,
                validator: ValidatorManager.notEmpty().call,
                hintText: 'date_of_birth'.tr(),
                labelText: 'date_of_birth'.tr(),
              ),
              SizedBox(height: 24.h),
              ValueListenableBuilder<bool>(
                valueListenable: obscureFirstPasswordNotifier,
                builder: (context, obscureFirst, child) {
                  return CustomTextFormProfile(
                    inputAction: TextInputAction.next,
                    obscureText: obscureFirst,
                    obscure: () {
                      obscureFirstPasswordNotifier.value =
                          !obscureFirstPasswordNotifier.value;
                    },
                    helperColor: passwordController.value.text.isEmpty
                        ? AppColors.grey1
                        : passwordController.length < 8
                            ? AppColors.red
                            : AppColors.green,
                    keyboardType: TextInputType.visiblePassword,
                    helperText: 'password_8'.tr(),
                    controller: passwordController,
                    hintText: 'password'.tr(),
                    labelText: 'password'.tr(),
                    validator: ValidatorManager.password().call,
                  );
                },
              ),
              SizedBox(height: 24.h),
              ValueListenableBuilder<bool>(
                valueListenable: obscureSecondPasswordNotifier,
                builder: (context, obscureSecond, child) {
                  return CustomTextFormProfile(
                    obscure: () {
                      obscureSecondPasswordNotifier.value =
                          !obscureSecondPasswordNotifier.value;
                    },
                    obscureText: obscureSecond,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordRepeatController,
                    hintText: 'repeat_password'.tr(),
                    labelText: 'repeat_password'.tr(),
                    validator: (text) {
                      if (text != passwordController.text) {
                        return 'password_dont_match'.tr();
                      }
                      return null;
                    },
                  );
                },
              ),
              SizedBox(height: 24.h),
              Text('gender'.tr()),
              SizedBox(height: 8.h),
              ValueListenableBuilder<Gender>(
                valueListenable: genderNotifier,
                builder: (context, gender, child) {
                  return Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(gender == Gender.female
                                ? 'assets/icons/fill_checkbox.svg'
                                : 'assets/icons/empty_checkbox.svg'),
                            onPressed: () {
                              genderNotifier.value = Gender.female;
                            },
                          ),
                          SizedBox(
                            width: 8.h,
                          ),
                          Text('female'.tr())
                        ],
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(gender == Gender.male
                                ? 'assets/icons/fill_checkbox.svg'
                                : 'assets/icons/empty_checkbox.svg'),
                            onPressed: () {
                              genderNotifier.value = Gender.male;
                            },
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('male'.tr())
                        ],
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const PrivatePolicyText(),
                  ValueListenableBuilder<bool>(
                    valueListenable: privacyAcceptedNotifier,
                    builder: (context, isPrivacyAccepted, child) {
                      return Transform.scale(
                        scale: 0.8,
                        child: Switch.adaptive(
                          activeColor: AppColors.orange,
                          inactiveTrackColor: AppColors.grey2,
                          value: isPrivacyAccepted,
                          onChanged: (value) {
                            privacyAcceptedNotifier.value = value;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              AppButton(
                isLoading: state.isLoading,
                onTap: () async {
                  if (!privacyAcceptedNotifier.value) {
                    context.showErrorSnackBar('accept_agree'.tr());
                    return;
                  }
                  if (formKey.currentState?.validate() ?? false) {
                    context.read<RegistrationBloc>().add(
                          UserDto(
                            fullName: nameController.text,
                            email: emailController.text,
                            phoneNumber: numberController.text,
                            birthday: dateFormat.parse(dateController.text),
                            password: passwordController.text,
                            rePassword: passwordRepeatController.text,
                            gender: genderNotifier.value,
                          ),
                        );
                  }
                },
                text: 'registration'.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
