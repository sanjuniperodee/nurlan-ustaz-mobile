import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';

import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: AppButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            text: 'Сақтау'),
      ),
      body: SizedBox(
        height: 1.1.sh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const CustomAppBar(
                  color: AppColors.black,
                  title: 'Жаңа карта',
                ),
                const SizedBox(height: 44),
                 CustomTextFormProfile(
                    hintText: 'Карта нөмірі', labelText: 'Карта нөмірі',onChanged: (value){}),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150.w,
                        child: CustomTextFormProfile(
                            hintText: 'Жарамдылық мерзімі',
                            labelText: 'Жарамдылық мерзімі',onChanged: (value){})),
                    Container(
                        width: 150.w,
                        child: CustomTextFormProfile(
                            hintText: 'CVV',
                            labelText: 'CVV',onChanged: (value){})),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
