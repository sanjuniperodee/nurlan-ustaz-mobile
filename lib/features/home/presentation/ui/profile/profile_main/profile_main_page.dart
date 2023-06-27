import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/utils/alert_utilrs.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_profile_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/profile_menu_item.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/setings_language_bottom_sheet.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/settings_region_bottom_sheet.dart';

import '../../../../../../core/common/app_styles.dart';
import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../../core/router/app_router.dart';
import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({Key? key}) : super(key: key);

  @override
  State<ProfileMainPage> createState() => _ProfileMainPage();
}

class _ProfileMainPage extends State<ProfileMainPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetProfileCubit>(context).getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
          log(state.toString());
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.red,
                ),
              );
            },
            loaded: (user) {
              return GlobalCustomBody(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: 1.1.sh,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomAppBar(
                          title: 'Профиль',
                        ),
                        SizedBox(height: 44.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: CachedNetworkImage(
                            imageUrl: user.avatar ?? '',
                            fit: BoxFit.cover,
                            height: 94.h,
                            width: 94.w,
                            errorWidget: (a, b, c) => Center(
                              child: SvgPicture.asset(
                                Assets.userSvg,
                                width: 94,
                                height: 94,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          user.fullName ?? 'ERROR NAME',
                          style: getTextStyle(CustomTextStyles.s20w700)
                              .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: FontTypes.Philosopher.name),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 12, right: 17).r,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              ProfileMenuItem(
                                  title: 'Менің деректерім',
                                  onTap: () {
                                    context.router.push(
                                      ProfileInfoPageRoute(userDTO: user),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'Сатып алынған қызметтер',
                                  onTap: () {
                                    context.router.push(
                                      const PaymentsPageRoute(),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'Менің карталарым',
                                  onTap: () {
                                    context.router.push(
                                      const ProfileCardsPageRoute(),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 12, right: 17).r,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              ProfileMenuItem(
                                  title: 'Жоба туралы',
                                  onTap: () {
                                    context.router.push(
                                      const AboutAppPageRoute(),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'FAQ',
                                  onTap: () {
                                    context.router.push(
                                      const FaqPageRoute(),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'Техникалық қолдау',
                                  onTap: () {
                                    context.router.push(
                                      const TechnicalSupportPageRoute(),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 12, right: 17).r,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              ProfileMenuItem(
                                  title: 'Тіл',
                                  onTap: () {
                                    showModalBottomSheet(
                                        backgroundColor: AppColors.white
                                            .withOpacity(0.0000000009),
                                        context: context,
                                        builder: (context) {
                                          return const LanguageSettingsBottomSheet();
                                        });
                                  }),
                              ProfileMenuItem(
                                  title: 'Абай облысы',
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: AppColors.white
                                            .withOpacity(0.0000000009),
                                        context: context,
                                        builder: (context) {
                                          return const RegionSettingsBottomSheet();
                                        });
                                  }),
                              ProfileMenuItem(
                                  title: 'Құпия сөзді өзгерту',
                                  onTap: () {
                                    context.router.push(
                                      const ChangePasswordPageRoute(),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'Хабарлама',
                                  onTap: () {
                                    context.router.push(
                                      const ProfileNotificationPageRoute(),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 12, right: 17).r,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            children: [
                              ProfileMenuItem(
                                isExit: true,
                                title: 'Шығу',
                                onTap: () async {
                                  var logout =
                                      await AlertUtils.showTwoOptionDialog(
                                          context: context,
                                          messageKey:
                                              'Вы точно хотите выйти из аккаунта',
                                          title: 'Выход',
                                          button1Text: "Отмена",
                                          button2Text: 'Выйти');
                                  if (logout) {
                                    BlocProvider.of<AppBloc>(context)
                                        .add(const AppEvent.exiting());
                                    context.router.push(const LoginPageRoute());
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
