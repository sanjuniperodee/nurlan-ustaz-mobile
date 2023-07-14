import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/registration_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/registration_form.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/registration_form.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/widgets/private_policy_text.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../app/presentation/widgets/custom_text_form_profile.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm(
      {super.key,
      required this.authCubit,
      required this.user,
      required this.isPrivacyAccept});

  final bool isPrivacyAccept;
  final AuthCubit authCubit;
  final UserPayload user;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
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

TextEditingController dateController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController numberController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordRepeatController = TextEditingController();
final maskFormatter = MaskTextInputFormatter(mask: '+7(###)-###-##-##');

bool isPrivacyAccept = false;
bool isLoading = false;
bool obscureFirst = true;
bool obscureSecond = true;


Gender? gender = Gender.male;

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
      state.maybeWhen(
        loadingState: () {
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.danger,
            ),
          );
        },
        loadedState: (user) {
          context.router.push(CodeVerificationRoute(
              email: emailController.text,
              password: passwordController.text,
              userId: user.id ?? 0));
        },
        errorState: (message) {
          buildErrorCustomSnackBar(context, message);
        },
        orElse: () {},
      );
    }, builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Қош келдіңіз',
            style: getTextStyle(CustomTextStyles.s36w700)
                .copyWith(fontFamily: FontTypes.Philosopher.name, fontSize: 32),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 32.h),
          CustomTextFormProfile(
            keyboardType: TextInputType.name,
            controller: nameController,
            hintText: 'Аты-жөні',
            labelText: 'Аты-жөні',
          ),
          SizedBox(height: 24.h),
          CustomTextFormProfile(
            keyboardType: TextInputType.emailAddress,

            controller: emailController,
            hintText: 'E-mail',
            labelText: 'E-mail',
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomTextFormProfile(

            keyboardType:  TextInputType.phone,
            inputFormatters: [maskFormatter],
            controller: numberController,
            hintText: 'Телефон нөмірі',
            labelText: 'Телефон нөмірі',
          ),
          SizedBox(height: 24.h),
          CustomTextFormProfile(
            onTap: () {
              _showDialog(
                  CupertinoDatePicker(
                    dateOrder: DatePickerDateOrder.dmy,
                    minimumYear: DateTime.now().year - 100,
                    maximumYear: DateTime.now().year - 5,

                    initialDateTime: DateTime.now().subtract(Duration(days: 365*5)),
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      setState(
                        () => dateController.text =
                            DateFormat('yyyy-MM-dd').format(newDate),
                      );
                    },
                  ),
                  context);
            },
            readOnly: true,
            controller: dateController,
            hintText: 'Туған күні',
            labelText: 'Туған күні',
          ),
          SizedBox(height: 24.h),
          CustomTextFormProfile(
            obscureText: obscureFirst,
            obscure: (){
              setState(() {
                obscureFirst = !obscureFirst;
              });
            },
            keyboardType: TextInputType.visiblePassword,
            helperText: 'Пароль должен содержать буквы и цифры ',
            controller: passwordController,
            hintText: 'Құпия сөз',
            labelText: 'Құпия сөз',
          ),
          SizedBox(height: 24.h),
          CustomTextFormProfile(
            obscure: (){
              setState(() {
                obscureSecond = !obscureSecond;
              });
            },
            obscureText: obscureSecond,
            keyboardType: TextInputType.visiblePassword,

            controller: passwordRepeatController,
            hintText: 'Құпия сөзді қайталау',
            labelText: 'Құпия сөзді қайталау',
          ),
          SizedBox(height: 24.h),
          const Text('Жынысы'),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(gender == Gender.female
                        ? 'assets/icons/fill_checkbox.svg'
                        : 'assets/icons/empty_checkbox.svg'),
                    onPressed: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                  ),
                  SizedBox(
                    width: 8.h,
                  ),
                  const Text('Әйел')
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
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const Text('Ер')
                ],
              )
            ],
          ),
          SizedBox(
            height: 36.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const PrivatePolicyText(),
            Transform.scale(
              scale: 0.8,
              child: CupertinoSwitch(
                trackColor: AppColors.grey2,
                value: isPrivacyAccept,
                onChanged: (value) {
                  setState(() {
                    isPrivacyAccept = !isPrivacyAccept;
                  });
                },
                activeColor: AppColors.orange,
              ),
            )
          ]),
          SizedBox(
            height: 48.h,
          ),
          AppButton(
              onTap: () async {
                if (passwordController.text != passwordRepeatController.text) {
                  buildErrorCustomSnackBar(context, 'Пароли не совпадают');
                }

                if (nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    numberController.text.isEmpty ||
                    dateController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    passwordRepeatController.text.isEmpty) {
                  buildErrorCustomSnackBar(context, 'Заполните все поля');
                }

                isPrivacyAccept
                    ? context.read<RegistrationCubit>().postUser(UserPayload(
                        fullName: nameController.text,
                        email: emailController.text,
                        phoneNumber: numberController.text,
                        birthday: dateController.text.toString(),
                        password: passwordController.text,
                        rePassword: passwordRepeatController.text,
                        gender: gender))
                    : buildErrorCustomSnackBar(
                        context, 'Примите правила соглашения');
              },
              text: 'Кіру')
        ],
      );
    });
  }
}
