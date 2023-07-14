import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/token_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/login_cubit.dart';

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
          children: [
            Text(
              'Қош келдіңіз',
              style: getTextStyle(CustomTextStyles.s36w700).copyWith(
                  fontFamily: FontTypes.Philosopher.name, fontSize: 32),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 32.h),
            CustomTextFormProfile(
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
              obscureText: obscure,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (String value) {
                setState(() {});
              },
              obscure: (){
                setState(() {
                  obscure = !obscure;
                });
              },
              controller: passwordController,
              hintText: 'Құпия сөз',
              labelText: 'Құпия сөз',
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
                    buildErrorCustomSnackBar(context, 'Введите логин и пароль');
                    return;
                  }
                  if (emailController.value.text.isEmpty) {
                    buildErrorCustomSnackBar(context, 'Введите логин');
                    return;
                  }
                  if (passwordController.value.text.isEmpty) {
                    buildErrorCustomSnackBar(context, 'Введите пароль');
                    return;
                  }
                  if (isValidEmail(emailController.value.text) == false) {
                    buildErrorCustomSnackBar(
                        context, 'Введите корректный почтовый адрес');
                    return;
                  } else {
                    context.read<LoginCubit>().createToken(TokenCreateDTO(
                        email: emailController.text,
                        password: passwordController.text));
                  }
                },
                text: 'Кіру'),
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
                    child: Text('Құпия сөзді ұмыттым',
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
            Center(
              child: CircularProgressIndicator(
                color: AppColors.danger,
              ),
            );
          },
          loadedState: () async {
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
