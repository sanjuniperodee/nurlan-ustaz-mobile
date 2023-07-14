import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_passwords_pages/new_password_page.dart';

import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../../app/presentation/widgets/custom_text_form_profile.dart';
import 'code_verification_forgot.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);


  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailController = TextEditingController();

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailController.value.text);
  }

  final bool isActiveButton = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubitCubit, ForgotPasswordState>(
      builder: (context, state) {
         return state.maybeWhen(
             loadingState: () {
               return const Scaffold(
                 body: Center(
                   child: CircularProgressIndicator(
                     color: AppColors.danger,
                   ),
                 ),
               );
             },

           verificationCodeState: (userId){
             return  CodeVerificationForgot(email: emailController.value.text,);
           },
           newPassword: (i){
             return NewPasswordPage( pinCode: i,);
           },

          orElse: () {
            return Container();
          },
          initialState: (){

            return Scaffold(
              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(16),
                child: AppButton(
                  textSize: 16.sp,
                    isActive:
                    (isValidEmail() && emailController.value.text.length >= 5),
                    onTap: () {
                      if (emailController.value.text.length <= 5) {
                        buildErrorCustomSnackBar(context, 'Введите почтовый адрес');
                      } else {
                        bool isValidEmail() {
                          return RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(emailController.value.text);
                        }

                        isValidEmail()
                            ? BlocProvider.of<ForgotPasswordCubitCubit>(context).getIdByMail(emailController.value.text)
                            : buildErrorCustomSnackBar(
                            context, 'Введите корректный почтовый адрес');
                      }

                      //context.read<CodeVerificationCubit>().sendCode(pinController.text, widget.userId,TokenCreateDTO(email: widget.email,password: widget.password));
                    },
                    text: 'Келесі'),
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
                        title: 'Құпия сөзді ұмыттым',
                        color: AppColors.black,
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      const Text(
                        'Жүйеге тіркелген почта немес телефон нөмірін енгізіңіз',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 18.h),
                      CustomTextFormProfile(
                        onChanged: (String) {
                          setState(() {});
                        },
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
        );







      },
      listener: (context, state) {
        state.maybeWhen(
          successConfirm: (){
             Navigator.of(context).pop();
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
