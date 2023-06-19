import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';

import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/profile_menu_item.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class ProfileInfoPage extends StatefulWidget {
  final UserDTO userDTO;
  const ProfileInfoPage({Key? key, required this.userDTO}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();
  Future _getImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      const SnackBar(content: Text('Фото добавлено'));
    });
  }

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
                const CustomAppBar(
                  title: 'Профиль',
                ),
                SizedBox(height: 44.h),
                InkWell(
                  onTap: () {
                    _getImage();

                    log('USERAVA${widget.userDTO.avatar.toString()}');
                  },
                  child: _image != null
                      ? Column(
                          children: [
                            CircleAvatar(
                              radius: 47,
                              backgroundColor: AppColors.white,
                              backgroundImage: FileImage(File(_image!.path)),
                              child: Center(
                                child: SvgPicture.asset(
                                  Assets.userSvg,
                                  width: 94,
                                  height: 94,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            InkWell(
                              child: Text(
                                "Сурет таңдау",
                                style: getTextStyle(CustomTextStyles.s14w400)
                                    .copyWith(
                                        fontFamily: FontTypes.SF_Pro.name,
                                        color: AppColors.blue),
                              ),
                            ),
                          ],
                        )
                      : widget.userDTO.avatar != null
                          ? Column(
                              children: [
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
                                  height: 12.h,
                                ),
                                InkWell(
                                  child: Text(
                                    "Сурет таңдау",
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                color: AppColors.blue),
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                CircleAvatar(
                                  radius: 47,
                                  backgroundImage:
                                      NetworkImage(widget.userDTO.avatar!),
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
                                  height: 12.h,
                                ),
                                InkWell(
                                  child: Text(
                                    "Сурет таңдау",
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                                color: AppColors.blue),
                                  ),
                                ),
                              ],
                            ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                CustomTextFormProfile(
                    hintText: 'Аты-жөні',
                    labelText: 'Аты-жөні',
                    onChanged: (value) {}),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormProfile(
                    hintText: 'Email',
                    labelText: 'Email',
                    onChanged: (value) {}),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormProfile(
                    hintText: 'Телефон нөмірі',
                    labelText: 'Телефон нөмірі',
                    onChanged: (value) {}),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormProfile(
                    hintText: 'Туған күні',
                    labelText: 'Туған күні',
                    onChanged: (value) {}),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Жынысы'),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/fill_checkbox.svg'),
                            SizedBox(
                              width: 8.h,
                            ),
                            Text('Әйел')
                          ],
                        ),
                        SizedBox(
                          width: 100.h,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/empty_checkbox.svg'),
                            SizedBox(
                              width: 8.h,
                            ),
                            const Text('Ер')
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ProfileMenuItem(
                        title: 'Аккаунты жою',
                        titleStyle: getTextStyle(CustomTextStyles.s16w500)
                            .copyWith(
                                fontFamily: FontTypes.SF_Pro.name,
                                color: AppColors.red,
                                fontWeight: FontWeight.w600),
                        onTap: () {}),
                    SizedBox(
                      height: 36.h,
                    ),
                    AppButton(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Өзгерісті сақтау')
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
