import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_field.dart';

import '../../core/common/app_styles.dart';
import '../../core/common/colors.dart';
import '../app/presentation/widgets/app_button.dart';
import '../app/presentation/widgets/custom_app_bar.dart';
import '../app/presentation/widgets/global_custom_widget.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppButton(
          onTap: () {},
          text: 'Жіберу',
          color: AppColors.blue,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(
            children: [
              const GlobalCustomBody(),
              Positioned(
                top: 80.h,
                left: 16.r,
                right: 16.r,
                child: Column(
                  children: [
                    CustomAppBar(
                      title: 'Тапсырыс беру',
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 124,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Бұл бөлімде Нұрлан ұстаздан жеке түс жорытуға тапсырыс бере аласыз. Түскен сомадан сіздің атыңыздан түс садақасы беріледі',
                          style: getTextStyle(CustomTextStyles.s14w500),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        CustomTextFormField(hintText: 'Aтауы...'),
                        SizedBox(height: 40,),
                        CustomTextFormField(hintText: 'ff')
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
