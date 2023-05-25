import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';

import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: AppButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            text: 'Дайын'),
      ),
      body: SizedBox(
        height: 1.1.sh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: const [
                SizedBox(height: 80,),
                CustomAppBar(
                  color: AppColors.black,
                  title: 'Құпия сөзді өзгерту',
                ),
                SizedBox(height: 44),
                CustomTextFormProfile(
                    hintText: 'Ағымдағы құпия сөз', labelText: 'Ағымдағы құпия сөз'),
                SizedBox(
                  height: 24,
                ),
                CustomTextFormProfile(hintText: 'Жаңа құпия сөз', labelText: 'Жаңа құпия сөз'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
