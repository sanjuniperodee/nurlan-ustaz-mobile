import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/change_pass_cubit.dart';

import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController curPasController = TextEditingController();
  TextEditingController newPasController = TextEditingController();
  TextEditingController pasController = TextEditingController();
  bool isLoading = false;
  bool obscureCurPass = true;
  bool obscureNewPass = true;
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SizedBox(
          height: 50.h,
          child: AppButton(
              isLoading: isLoading,
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if (newPasController.text != pasController.text) {
                  return buildErrorCustomSnackBar(
                      context, 'Пароли не совпадают');
                }
                if (curPasController.text.isEmpty ||
                    newPasController.text.isEmpty ||
                    pasController.text.isEmpty) {
                  return buildErrorCustomSnackBar(
                      context, 'Заполните все поля');
                }
                BlocProvider.of<ChangePassCubit>(context)
                    .changePass(
                        newPass: newPasController.text,
                        curPass: curPasController.text,
                        pass: pasController.text)
                    .then((value) {
                  setState(() {
                    isLoading = false;
                  });
                });
              },
              text: 'ready'.tr()),
        ),
      ),
      body: BlocConsumer<ChangePassCubit, ChangePassState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (status) {
              buildSuccessCustomSnackBar(context, 'SUCCESS');
            },
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
            orElse: () {},
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return SizedBox(
            height: 1.1.sh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                     CustomAppBar(
                      color: AppColors.black,
                      title: 'password_change'.tr(),
                    ),
                    SizedBox(height: 44.h),
                    CustomTextFormProfile(
                        obscureText: obscureCurPass,
                        obscure: () {
                          setState(() {
                            obscureCurPass = !obscureCurPass;
                          });
                        },
                        controller: curPasController,
                        hintText: 'current_password'.tr(),
                        labelText: 'current_password'.tr(),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextFormProfile(
                        controller: newPasController,
                        obscureText: obscureNewPass,
                        obscure: () {
                          setState(() {
                            obscureNewPass = !obscureNewPass;
                          });
                        },
                        hintText: 'new_password'.tr(),
                        labelText: 'new_password'.tr(),
                        onChanged: (value) {}),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomTextFormProfile(
                        obscureText: obscurePass,
                        obscure: () {
                          setState(() {
                            obscurePass = !obscurePass;
                          });
                        },
                        controller: pasController,
                        hintText: 'repeat_new_password'.tr(),
                        labelText: 'repeat_new_password'.tr(),
                        onChanged: (value) {}),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
