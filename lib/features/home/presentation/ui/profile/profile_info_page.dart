import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/validators.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/enums/gender.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/delete_profile_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/update_profile_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/widgets/profile_menu_item.dart';

import '../../../../../core/common/assets.dart';
import '../../../../../core/common/colors.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class ProfileInfoPage extends StatefulWidget implements AutoRouteWrapper {
  final UserDto userDTO;
  const ProfileInfoPage({
    super.key,
    required this.userDTO,
  });

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateProfileBloc(
            authRepository: GetIt.I(),
            profileLocalDs: context.read(),
          ),
        ),
        BlocProvider(
          create: (context) => DeleteProfileBloc(
            authLocalDs: GetIt.I(),
            authRepository: GetIt.I(),
          ),
        ),
        //
        BlocListener<UpdateProfileBloc, UpdateProfileState>(
          listener: (context, state) {
            return state.maybeWhen(
              success: () {
                context.router.pop();
                context
                    .showSuccessSnackBar('profile_updated_successfully'.tr());
              },
              failure: context.showExceptionErrorSnackBar,
              orElse: () {},
            );
          },
        ),
        BlocListener<DeleteProfileBloc, DeleteProfileState>(
          listener: (context, state) {
            return state.maybeWhen(
              success: () {
                context
                    .showSuccessSnackBar('profile_removed_successfully'.tr());
              },
              failure: context.showExceptionErrorSnackBar,
              orElse: () {},
            );
          },
        ),
      ],
      child: this,
    );
  }
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final formKey = GlobalKey<FormState>();
  late final UserChangedNotifier userChangedNotifier;

  final ImagePicker picker = ImagePicker();

  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();

  final maskFormatter = MaskTextInputFormatter(
      mask: '+###########', type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    super.initState();
    final user = widget.userDTO;

    userChangedNotifier = UserChangedNotifier(original: user);
    nameController.text = user.fullName ?? "";
    numberController.text = user.phoneNumber ?? "";
    final bday = user.birthday;
    if (bday != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(bday);
    }
    emailController.text = user.email ?? "";
  }

  @override
  void dispose() {
    userChangedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        body: GlobalCustomBody(
          child: SizedBox(
            height: 1.1.sh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'My_data'.tr(),
                  ),
                  SizedBox(height: 44.h),
                  InkWell(
                      onTap: () async {
                        final image =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          userChangedNotifier.updateAvatar(image);
                        }
                      },
                      child: Column(
                        children: [
                          ListenableBuilder(
                            listenable: userChangedNotifier,
                            builder: (context, child) {
                              return CircleAvatar(
                                radius: 47.r,
                                backgroundColor: Colors.transparent,
                                backgroundImage: userChangedNotifier.avatar,
                                child: userChangedNotifier.avatar == null
                                    ? SvgPicture.asset(
                                        Assets.userSvg,
                                        width: 94.r,
                                        height: 94.r,
                                      )
                                    : null,
                              );
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          InkWell(
                            child: Text(
                              "Choose_picture".tr(),
                              style: getTextStyle(CustomTextStyles.s14w400)
                                  .copyWith(
                                      fontFamily: FontTypes.SFPro.name,
                                      color: AppColors.blue),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomTextFormProfile(
                    hintText: 'name-surname'.tr(),
                    labelText: 'name-surname'.tr(),
                    controller: nameController,
                    onChanged: userChangedNotifier.updateName,
                    validator: ValidatorManager.notEmpty().call,
                  ),
                  //
                  SizedBox(height: 24.h),
                  //
                  CustomTextFormProfile(
                    hintText: 'Email',
                    labelText: 'Email',
                    controller: emailController,
                    onChanged: userChangedNotifier.updateEmail,
                    validator: ValidatorManager.email().call,
                  ),
                  //
                  SizedBox(height: 24.h),
                  //
                  CustomTextFormProfile(
                    inputFormatters: [maskFormatter],
                    hintText: 'phone_number'.tr(),
                    labelText: 'phone_number'.tr(),
                    controller: numberController,
                    onChanged: userChangedNotifier.updatePhone,
                    validator: ValidatorManager.twelveSymbolsPhone().call,
                  ),
                  //
                  SizedBox(height: 24.h),
                  //
                  CustomTextFormProfile(
                    onTap: () {
                      _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: userChangedNotifier.draft.birthday,
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            dateController.text =
                                DateFormat('yyyy-MM-dd').format(newDate);
                            userChangedNotifier.updateBDay(newDate);
                          },
                        ),
                        context,
                      );
                    },
                    controller: dateController,
                    hintText: 'date_of_birth'.tr(),
                    labelText: 'date_of_birth'.tr(),
                    validator: ValidatorManager.notEmpty().call,
                  ),
                  //
                  SizedBox(height: 16.h),
                  //
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('gender'.tr()),
                      SizedBox(
                        height: 8.h,
                      ),
                      ListenableBuilder(
                        listenable: userChangedNotifier,
                        builder: (context, child) {
                          final gender = userChangedNotifier.draft.gender;
                          return Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      userChangedNotifier
                                          .updateGender(Gender.female);
                                    },
                                    icon: SvgPicture.asset(
                                      (gender?.isFemale ?? false)
                                          ? 'assets/icons/fill_checkbox.svg'
                                          : 'assets/icons/empty_checkbox.svg',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  Text('female'.tr())
                                ],
                              ),
                              SizedBox(
                                width: 100.h,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      userChangedNotifier
                                          .updateGender(Gender.male);
                                    },
                                    icon: SvgPicture.asset(
                                      (gender?.isMale ?? false)
                                          ? 'assets/icons/fill_checkbox.svg'
                                          : 'assets/icons/empty_checkbox.svg',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.h,
                                  ),
                                  Text('male'.tr())
                                ],
                              )
                            ],
                          );
                        },
                      ),
                      //
                      SizedBox(height: 20.h),
                      //
                      ProfileMenuItem(
                        title: 'Delete_account'.tr(),
                        titleStyle: getTextStyle(CustomTextStyles.s14w500),
                        onTap: () async {
                          final delete = await context.router.push<bool>(
                              DeleteProfileConfirmationDialogRoute());

                          if (delete == true && context.mounted) {
                            context
                                .read<DeleteProfileBloc>()
                                .add(const DeleteProfileEvent());
                          }
                        },
                      ),
                      //
                      SizedBox(height: 36.h),
                      //
                      ListenableBuilder(
                        listenable: userChangedNotifier,
                        builder: (context, child) {
                          return BlocSelector<DeleteProfileBloc,
                              DeleteProfileState, bool>(
                            selector: (state) => state.isLoading,
                            builder: (context, isLoadingDelete) {
                              return BlocSelector<UpdateProfileBloc,
                                  UpdateProfileState, bool>(
                                selector: (state) => state.isLoading,
                                builder: (context, isLoadingUpdate) {
                                  return AppButton(
                                    isActive: userChangedNotifier.hasChanged,
                                    isLoading:
                                        isLoadingUpdate || isLoadingDelete,
                                    onTap: () async {
                                      if (formKey.currentState?.validate() ??
                                          false) {
                                        context.read<UpdateProfileBloc>().add(
                                              UpdateProfileEvent(
                                                user: userChangedNotifier.draft,
                                              ),
                                            );
                                      }
                                    },
                                    text: 'Save_changes'.tr(),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),

                      SizedBox(height: 36.h),
                    ],
                  )
                ],
              ),
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

Future<XFile?> getImageXFileByUrl(String? url) async {
  if (url == null) {
    return null;
  }
  var file = await DefaultCacheManager().getSingleFile(url);
  XFile result = XFile(file.path);
  return result;
}

@visibleForTesting
class UserChangedNotifier extends ChangeNotifier {
  UserChangedNotifier({
    required this.original,
    UserDto? draft,
  })  : draft = draft ?? original.copyWith(),
        _hasChanged = false {
    final av = original.avatar;
    if (av != null) _avatar = CachedNetworkImageProvider(av);
  }

  @visibleForTesting
  final UserDto original;

  @visibleForTesting
  UserDto draft;

  bool _hasChanged;

  bool get hasChanged => _hasChanged;

  @protected
  ImageProvider? _avatar;

  ImageProvider? get avatar => _avatar;

  void updateAvatar(XFile newAvatar) {
    modify(draft.copyWith(avatar: newAvatar.path));
    _avatar = FileImage(File(newAvatar.path));
    notifyListeners();
  }

  void updateName(String newName) {
    modify(draft.copyWith(fullName: newName));
  }

  void updateEmail(String newEmail) {
    modify(draft.copyWith(email: newEmail));
  }

  void updatePhone(String newPhone) {
    modify(draft.copyWith(phoneNumber: newPhone));
  }

  void updateBDay(DateTime newBday) {
    modify(draft.copyWith(birthday: newBday));
  }

  void updateGender(Gender newGender) {
    modify(draft.copyWith(gender: newGender));
    notifyListeners();
  }

  @visibleForTesting
  void modify(UserDto user) {
    draft = user;
    checkHasChanged();
  }

  @visibleForTesting
  void checkHasChanged() {
    if (draft.avatar != null && !hasChanged) {
      _hasChanged = true;
      notifyListeners();
    }
    for (final shouldMarkAsChanged in [
      draft.avatar != null,
      //
      (draft.fullName?.isNotEmpty ?? false) &&
          draft.fullName != original.fullName,
      //
      (draft.email?.isNotEmpty ?? false) && draft.email != original.email,
      //
      (draft.phoneNumber?.isNotEmpty ?? false) &&
          draft.phoneNumber != original.phoneNumber,
      //
      draft.birthday != null && draft.birthday != original.birthday,
      //
      draft.gender != null && draft.gender != original.gender,
    ]) {
      if (shouldMarkAsChanged) {
        if (!hasChanged) {
          _hasChanged = true;
          notifyListeners();
        }
        return;
      }
    }
    // No field has been marked as changed
    if (hasChanged) {
      _hasChanged = false;
      notifyListeners();
    }
  }
}
