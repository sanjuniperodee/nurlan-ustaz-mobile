import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/core/utils/alert_utilrs.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/other_list_bloc/language_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_profile_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/profile_menu_item.dart';

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
    chosenLang = getIt<AuthLocalDs>().getLocale();
    super.initState();
  }

  Map<String, String> langMap = {
    '🇷🇺 Русский': 'ru',
    '🇰🇿 Қазақша': 'kk',
  };

  Map<String, String> localMap = {
    'ru': '🇷🇺 Русский ',
    'kk': '🇰🇿 Қазақша',
  };
  Map<String, String> langMapText = {
    'ru': 'Русский',
    'kk': 'Қазақша',
  };
  String? chosenLang;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
          log('STATE:::${state.toString()}');
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.red,
                ),
              );
            },
            loaded: (user, geo) {
              log('chosenLang::::${chosenLang.toString()}');
              return GlobalCustomBody(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: 1.1.sh,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomAppBar(
                          title: 'profile'.tr(),
                        ),
                        SizedBox(height: 44.h),
                        user.avatar != null
                            ? CircleAvatar(
                                radius: 57.r,
                                backgroundColor: AppColors.white,
                                backgroundImage: NetworkImage(user.avatar!))
                            : SvgPicture.asset(
                                Assets.userSvg,
                                width: 94,
                                height: 94,
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
                                  title: 'My_data'.tr(),
                                  onTap: () {
                                    context.router.push(
                                      ProfileInfoPageRoute(userDTO: user),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'Purchased_services'.tr(),
                                  onTap: () {
                                    context.router.push(
                                      const PaymentsPageRoute(),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'my_cards'.tr(),
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
                                  title: 'project_info'.tr(),
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
                                  title: 'tech_support'.tr(),
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
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  itemHeight: 30,
                                  items: langMap.keys
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Text(
                                            langMapText[value] ?? "",
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 5.0,
                                            ),
                                            child: Text(
                                              value,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  // dropdownPadding: const EdgeInsets.only(bottom: 10),
                                  dropdownWidth:
                                      MediaQuery.of(context).size.width,
                                  customButton: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          chosenLang == 'kz'
                                              ? 'Қазақша'
                                              : langMapText[chosenLang]
                                                  .toString(),
                                          style: getTextStyle(
                                                  CustomTextStyles.s16w400)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                        ),
                                        SvgPicture.asset(
                                            'assets/icons/chevron_right.svg'),
                                      ],
                                    ),
                                  ),
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      chosenLang = langMap[value];

                                      log(chosenLang.toString());
                                      context.setLocale(
                                        Locale(langMap[value] ?? 'kk'),
                                      );

                                      debugPrint(context.locale.toString());
                                      final String newLocal =
                                          (langMap[value] ?? 'ru') == 'kk'
                                              ? 'kz'
                                              : (langMap[value] ?? 'kk');

                                      final appState =
                                          BlocProvider.of<AppBloc>(context)
                                              .state;
                                      appState.maybeWhen(
                                        inAppState: () {
                                          BlocProvider.of<LanguageCubit>(
                                            context,
                                          ).changeLanguage(
                                            language: newLocal,
                                          );
                                        },
                                        orElse: () {
                                          BlocProvider.of<LanguageCubit>(
                                            context,
                                          ).changeLocal();
                                        },
                                      );
                                      setState(() {
                                        log('QQQQ');
                                      });
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                      'assets/icons/chevron_right.svg'),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              ProfileMenuItem(
                                  title: geo.name!,
                                  onTap: () {
                                    context.router.push(
                                      GeonamesPageRoute(),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'password_change'.tr(),
                                  onTap: () {
                                    context.router.push(
                                      const ChangePasswordPageRoute(),
                                    );
                                  }),
                              ProfileMenuItem(
                                  title: 'notification'.tr(),
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
                                title: 'exit'.tr(),
                                onTap: () async {
                                  var logout =
                                      await AlertUtils.showTwoOptionDialog(
                                          context: context,
                                          messageKey: 'exit_des'.tr(),
                                          title: 'exit'.tr(),
                                          button1Text: 'cancel'.tr(),
                                          button2Text: 'exit2'.tr());
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
