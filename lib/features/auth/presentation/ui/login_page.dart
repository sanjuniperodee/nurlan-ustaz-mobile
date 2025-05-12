import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_tab_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/registration_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/login_form.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/registration_form.dart';

import '../../../app/presentation/widgets/custom_snackbars.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

int currentIndex = 0;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<RegistrationCubit, RegistrationState>(
      listenWhen: (previous, current) =>
          current is RegistrationSuccessState ||
          current is RegistrationLoadedState,
      listener: (context, state) {
        setState(() {
          currentIndex = state is RegistrationLoadedState ? 1 : 0;
        });
      },
      child: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return switch (state) {
            AuthInitialPage(:final userDTO) => GlobalCustomBody(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomTabBar(
                            tabs: [
                              Tab(
                                text: 'Entry'.tr(),
                              ),
                              Tab(
                                text: 'register'.tr(),
                              ),
                            ],
                            onTap: (int) {
                              setState(() {
                                currentIndex = int;
                              });
                            },
                            length: 2),
                        SizedBox(height: 26.h),
                        (currentIndex == 0)
                            ? const LoginForm()
                            : RegistrationForm(
                                authCubit: BlocProvider.of<AuthCubit>(context),
                                user: userDTO,
                                isPrivacyAccept: isPrivacyAccept,
                                changeIndex: () {
                                  setState(() {
                                    currentIndex = 1;
                                  });
                                }),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            AuthLoadingState() => const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              ),
            AuthLoadedState() => GlobalCustomBody(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomTabBar(
                            tabs: [
                              Tab(
                                text: 'enter'.tr(),
                              ),
                              Tab(
                                text: 'register'.tr(),
                              ),
                            ],
                            onTap: (int) {
                              setState(() {
                                currentIndex = int;
                              });
                            },
                            length: 2),
                        if (currentIndex == 0) ...[
                          Text(
                            'welcome'.tr(),
                            style: getTextStyle(CustomTextStyles.s36w700)
                                .copyWith(
                                    fontFamily: FontTypes.Philosopher.name,
                                    fontSize: 32),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 32.h),
                          CustomTextFormProfile(
                              hintText: 'E-mail',
                              labelText: 'E-mail',
                              onChanged: (value) {}),
                          SizedBox(height: 24.h),
                          CustomTextFormProfile(
                              hintText: 'password'.tr(),
                              labelText: 'password'.tr(),
                              onChanged: (value) {}),
                          SizedBox(
                            height: 42.h,
                          ),
                          AppButton(onTap: () {}, text: 'Entry'.tr()),
                          SizedBox(height: 12.h),
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: AppColors
                                        .gradientSecondaryActiveButton.colors),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30))
                                        .r),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: 339.w,
                                child: SizedBox(
                                  child: Text('forgot_password'.tr(),
                                      textAlign: TextAlign.center,
                                      style:
                                          getTextStyle(CustomTextStyles.s16w200)
                                              .apply(
                                                  fontFamily: FontTypes
                                                      .Philosopher.name)
                                              .copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16.sp)
                                              .apply(
                                                color: AppColors.blue,
                                              )),
                                ),
                              ),
                            ),
                          )
                        ],
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            _ => const SizedBox.shrink(),
          };
        },
        listener: (context, state) {
          if (state is AuthErrorState) {
            buildErrorCustomSnackBar(context, state.message);
          }
        },
      ),
    ));
  }
}
