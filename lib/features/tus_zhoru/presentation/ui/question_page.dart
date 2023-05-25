import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/utils/pay_dialog.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_field.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/question_page.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';


class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

 TextEditingController controllerForAtau = TextEditingController();
 TextEditingController controllerForTusimbde = TextEditingController();

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppButton(
          onTap: () {
            showDialog(context: context, builder: (context){
              return PayDialog();
            });

          },
          text: 'Жіберу',
          color: AppColors.blue,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        primary: true,
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
                        CustomTextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(60),
                          ],
                          onChanged: (value){
                            setState(() {
                            });

                          },
                          hintText: 'Aтауы...',
                          controller: controllerForAtau,
                        ),
                        SizedBox(height: 8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${controllerForAtau.value.text.length}/60',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomTextFormField(
                          minLines: 15,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(999),
                          ],
                          onChanged: (value){
                            setState(() {
                            });
                          },
                          hintText: 'ff',
                          controller: controllerForTusimbde,
                        ),
                        SizedBox(height: 8,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${controllerForTusimbde.text.length}/999',
                            ),
                          ],
                        ),
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
