import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_payload.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/rename_user_cubit.dart';

import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/profile_menu_item.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class ProfileInfoPage extends StatefulWidget {
  final UserDto userDTO;
  const ProfileInfoPage({Key? key, required this.userDTO}) : super(key: key);

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  Future onCameraTapped() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final maskFormatter = MaskTextInputFormatter(mask: '+7(###)-###-##-##');

  bool isPrivacyAccept = false;

  Gender? gender = Gender.male;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userDTO.fullName ?? "";
    numberController.text = widget.userDTO.phoneNumber ?? "";
    dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    emailController.text = widget.userDTO.email ?? "";
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
                      onCameraTapped();
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 47.r,
                          backgroundColor: AppColors.white,
                          backgroundImage: _image != null
                              ? FileImage(File(_image!.path))
                              : widget.userDTO.avatar != null
                                  ? NetworkImage(widget.userDTO.avatar!)
                                      as ImageProvider
                                  : null,
                          child: widget.userDTO.avatar == null
                              ? SvgPicture.asset(
                                  Assets.userSvg,
                                  width: 94.r,
                                  height: 94.r,
                                )
                              : null,
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
                    // : widget.userDTO.avatar != null
                    //     ? Column(
                    //         children: [
                    //           CircleAvatar(
                    //             radius: 47,
                    //             backgroundColor: AppColors.white,
                    //             child: Center(
                    //               child: SvgPicture.asset(
                    //                 Assets.userSvg,
                    //                 width: 94,
                    //                 height: 94,
                    //               ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 12.h,
                    //           ),
                    //           InkWell(
                    //             child: Text(
                    //               "Сурет таңдау",
                    //               style:
                    //                   getTextStyle(CustomTextStyles.s14w400)
                    //                       .copyWith(
                    //                           fontFamily:
                    //                               FontTypes.SF_Pro.name,
                    //                           color: AppColors.blue),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //     : Column(
                    //         children: [
                    //           CircleAvatar(
                    //             radius: 47,
                    //             backgroundImage:
                    //                 NetworkImage(widget.userDTO.avatar ?? ''),
                    //             backgroundColor: AppColors.white,
                    //             child: Center(
                    //               child: SvgPicture.asset(
                    //                 Assets.userSvg,
                    //                 width: 94,
                    //                 height: 94,
                    //               ),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             height: 12.h,
                    //           ),
                    //           InkWell(
                    //             child: Text(
                    //               "Сурет таңдау",
                    //               style:
                    //                   getTextStyle(CustomTextStyles.s14w400)
                    //                       .copyWith(
                    //                           fontFamily:
                    //                               FontTypes.SF_Pro.name,
                    //                           color: AppColors.blue),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    ),
                SizedBox(
                  height: 32.h,
                ),
                CustomTextFormProfile(
                    hintText: 'Аты-жөні',
                    labelText: 'Аты-жөні',
                    controller: nameController,
                    onChanged: (value) {}),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormProfile(
                    hintText: 'Email',
                    labelText: 'Email',
                    controller: emailController,
                    onChanged: (value) {}),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormProfile(
                    inputFormatters: [maskFormatter],
                    hintText: 'Телефон нөмірі',
                    labelText: 'Телефон нөмірі',
                    controller: numberController,
                    onChanged: (value) {}),
                SizedBox(
                  height: 24.h,
                ),
                CustomTextFormProfile(
                    onTap: () {
                      _showDialog(
                          CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            use24hFormat: true,
                            // This is called when the user changes the date.
                            onDateTimeChanged: (DateTime newDate) {
                              setState(
                                () => dateController.text =
                                    DateFormat('yyyy-MM-dd').format(newDate),
                              );
                            },
                          ),
                          context);
                    },
                    controller: dateController,
                    hintText: 'Туған күні',
                    labelText: 'Туған күні',
                    onChanged: (value) {}),
                SizedBox(
                  height: 16.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Жынысы'),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  gender = Gender.female;
                                });
                              },
                              icon: SvgPicture.asset(gender == Gender.female
                                  ? 'assets/icons/fill_checkbox.svg'
                                  : 'assets/icons/empty_checkbox.svg'),
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            const Text('Әйел')
                          ],
                        ),
                        SizedBox(
                          width: 100.h,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  gender = Gender.male;
                                });
                              },
                              icon: SvgPicture.asset(gender == Gender.male
                                  ? 'assets/icons/fill_checkbox.svg'
                                  : 'assets/icons/empty_checkbox.svg'),
                            ),
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
                    BlocListener<RenameUserCubit, RenameUserState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          errorState: (message) {
                            return buildErrorCustomSnackBar(context, message);
                          },
                          loadedState: (user) {
                            buildSuccessCustomSnackBar(context, 'Сәтті ауысты');
                          },
                        );
                        // TODO: implement listener
                      },
                      child: AppButton(
                          onTap: () {
                            final UserPayload userPayload = UserPayload(
                              fullName: nameController.text.isEmpty
                                  ? widget.userDTO.fullName
                                  : nameController.text,
                              email: emailController.text.isEmpty
                                  ? widget.userDTO.email
                                  : emailController.text,
                              phoneNumber: numberController.text.isEmpty
                                  ? widget.userDTO.phoneNumber
                                  : numberController.text,
                              birthday: dateController.text,
                              gender: gender,
                            );

                            BlocProvider.of<RenameUserCubit>(context)
                                .renameUser(user: userPayload, avatar: _image);
                          },
                          text: 'Өзгерісті сақтау'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(
    Widget child,
    BuildContext context,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
