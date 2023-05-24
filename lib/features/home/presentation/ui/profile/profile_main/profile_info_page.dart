import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/profile_menu_item.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlobalCustomBody(
        child: SizedBox(
          height: 1.1.sh,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Профиль',
                ),
                SizedBox(height: 44),
                CircleAvatar(
                  radius: 47,
                  backgroundColor: AppColors.white,
                  child: Center(
                    child: SvgPicture.asset(
                      Assets.userSvg,
                      width: 94,
                      height: 94,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  child: Text(
                    "Сурет таңдау",
                    style: getTextStyle(CustomTextStyles.s14w400).copyWith(
                        fontFamily: FontTypes.SF_Pro.name,
                        color: AppColors.blue),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                CustomTextFormProfile(
                    hintText: 'Аты-жөні', labelText: 'Аты-жөні'),
                SizedBox(
                  height: 24,
                ),
                CustomTextFormProfile(hintText: 'Email', labelText: 'Email'),
                SizedBox(
                  height: 24,
                ),
                CustomTextFormProfile(
                    hintText: 'Телефон нөмірі', labelText: 'Телефон нөмірі'),
                SizedBox(
                  height: 24,
                ),
                CustomTextFormProfile(
                    hintText: 'Туған күні', labelText: 'Туған күні'),
                SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Жынысы'),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/fill_checkbox.svg'),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Әйел')
                          ],
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/empty_checkbox.svg'),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Ер')
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileMenuItem(
                        title: 'Аккаунты жою',
                        titleStyle: getTextStyle(CustomTextStyles.s16w500)
                            .copyWith(
                                fontFamily: FontTypes.SF_Pro.name,
                                color: AppColors.red,
                                fontWeight: FontWeight.w600),
                        onTap: () {}),
                    SizedBox(height: 36,),
                    AppButton(onTap: (){
                      Navigator.of(context).pop();
                    }, text: 'Өзгерісті сақтау')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
