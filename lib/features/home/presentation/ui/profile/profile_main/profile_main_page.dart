import 'dart:developer';

import 'package:auto_route/auto_route.dart';
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
import '../../../../../zhosparlar/presentation/bloc/zhosparym_cubit.dart';

@RoutePage()
class ProfileMainPage extends StatefulWidget {
  const ProfileMainPage({Key? key}) : super(key: key);

  @override
  State<ProfileMainPage> createState() => _ProfileMainPage();
}

class _ProfileMainPage extends State<ProfileMainPage> {
  @override
  void initState() {
    BlocProvider.of<GetProfileCubit>(context).getUser();
    chosenLang = getIt<AuthLocalDs>().getLocale();
    chosenLang = (chosenLang == 'kz' || chosenLang == 'kk') ? 'kk' : 'ru';
    super.initState();
  }

  Map<String, String> langMap = {
    //'🇷🇺 Русский': 'ru',
    '🇰🇿 Қазақша': 'kk',
  };

  Map<String, String> localMap = {
    //'ru': '🇷🇺 Русский ',
    'kk': '🇰🇿 Қазақша',
  };
  Map<String, String> langMapText = {
    //'ru': 'Русский',
    'kk': 'Қазақша',
  };
  String? chosenLang;
  TextEditingController devc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<GetProfileCubit, GetProfileState>(
        listener: (context, state) {
          // state.whenOrNull(
          //   errorState: (message) {
          //     // context.router.pop();
          //   },
          // );
        },
        builder: (context, state) {
          if (state is! GetProfileLoadedState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.linearBlue,
              ),
            );
          }

          return GlobalCustomBody(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: 1.5.sh,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomAppBar(
                      title: 'profile'.tr(),
                    ),
                    SizedBox(height: 44.h),
                    CircleAvatar(
                      radius: 47.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: state.user.avatar != null
                          ? NetworkImage(
                              state.user.avatar!,
                              // fit: BoxFit.cover,
                            ) as ImageProvider
                          : null,
                      child: state.user.avatar == null
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
                    Text(
                      state.user.fullName ?? 'ERROR NAME',
                      style: getTextStyle(CustomTextStyles.s20w700).copyWith(
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
                                  ProfileInfoRoute(userDTO: state.user),
                                );
                              }),
                          ProfileMenuItem(
                              title: 'Purchased_services'.tr(),
                              onTap: () {
                                context.router.push(
                                  const PaymentsRoute(),
                                );
                              }),
                          ProfileMenuItem(
                              title: 'my_cards'.tr(),
                              onTap: () {
                                context.router.push(
                                  const ProfileCardsRoute(),
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
                                  const AboutAppRoute(),
                                );
                              }),
                          ProfileMenuItem(
                              title: 'FAQ',
                              onTap: () {
                                context.router.push(
                                  const FaqRoute(),
                                );
                              }),
                          ProfileMenuItem(
                              title: 'tech_support'.tr(),
                              onTap: () {
                                context.router.push(
                                  const TechnicalSupportRoute(),
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
                              title: chosenLang == 'kk'
                                  ? 'Қазақша'
                                  : langMapText[chosenLang].toString(),
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w, vertical: 40.h),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft:
                                                const Radius.circular(20.0).r,
                                            // Adjust the radius as needed
                                            topRight: const Radius.circular(
                                                    20.0)
                                                .r, // Adjust the radius as needed
                                          ),
                                        ),
                                        height: 273.h,
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'change_language'.tr(),
                                              style: getTextStyle(
                                                      CustomTextStyles.s20w700)
                                                  .copyWith(
                                                      fontFamily: FontTypes
                                                          .SF_Pro.name),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            ...langMap.keys
                                                .toList()
                                                .map((r) => Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                              onTap: () {
                                                                log('язык был $chosenLang');
                                                                log('язык выбрал ${langMap[r]}');
                                                                if (r != null) {
                                                                  chosenLang =
                                                                      langMap[
                                                                          r];

                                                                  log(chosenLang
                                                                      .toString());
                                                                  context
                                                                      .setLocale(
                                                                    Locale(
                                                                        langMap[
                                                                            r]!),
                                                                  );

                                                                  debugPrint(context
                                                                      .locale
                                                                      .toString());
                                                                  final String
                                                                      newLocal =
                                                                      langMap[
                                                                          r]!;

                                                                  final appState =
                                                                      BlocProvider.of<AppBloc>(
                                                                              context)
                                                                          .state;
                                                                  appState
                                                                      .maybeWhen(
                                                                    inApp: () {
                                                                      BlocProvider.of<
                                                                          LanguageCubit>(
                                                                        context,
                                                                      ).changeLanguage(
                                                                        language:
                                                                            newLocal,
                                                                      );
                                                                      BlocProvider.of<ZhosparymCubit>(
                                                                              context)
                                                                          .calendarEvents(
                                                                              DateTime.now());
                                                                    },
                                                                    orElse: () {
                                                                      BlocProvider.of<
                                                                          LanguageCubit>(
                                                                        context,
                                                                      ).changeLocal();
                                                                      BlocProvider.of<ZhosparymCubit>(
                                                                              context)
                                                                          .calendarEvents(
                                                                              DateTime.now());
                                                                    },
                                                                  );
                                                                  setState(
                                                                      () {});
                                                                }
                                                                Navigator.pop(
                                                                    context);
                                                                // setState(() {
                                                                //   selectedIndex = index;
                                                                // });
                                                              },
                                                              child: langMap[
                                                                          r] ==
                                                                      chosenLang
                                                                  ? SvgPicture
                                                                      .asset(Assets
                                                                          .radioOnSvg)
                                                                  : SvgPicture
                                                                      .asset(Assets
                                                                          .radioCircleSvg)),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          Text(
                                                            r,
                                                            style: getTextStyle(
                                                                    CustomTextStyles
                                                                        .s16w400)
                                                                .copyWith(
                                                                    fontFamily:
                                                                        FontTypes
                                                                            .SF_Pro
                                                                            .name),
                                                          ),
                                                        ],
                                                      ),
                                                    ))
                                          ],
                                        ),
                                      );
                                    });
                              }),
                          ProfileMenuItem(
                              title: state.geo.name!,
                              onTap: () {
                                context.router.push(
                                  GeonamesRoute(type: 'profile'),
                                );
                              }),
                          ProfileMenuItem(
                              title: 'password_change'.tr(),
                              onTap: () {
                                context.router.push(
                                  const ChangePasswordRoute(),
                                );
                              }),
                          ProfileMenuItem(
                              title: 'notification'.tr(),
                              onTap: () {
                                context.router.push(
                                  const ProfileNotificationRoute(),
                                );
                              }),
                          if (state.user.isStaff == true)
                            ProfileMenuItem(
                                title: 'QR.qr_scanner'.tr(),
                                onTap: () {
                                  context.router.push(
                                    const QrScannerRoute(),
                                  );
                                }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    // TextField(
                    //   controller: devc,
                    // ),
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
                              var logout = await AlertUtils.showTwoOptionDialog(
                                  context: context,
                                  messageKey: 'exit_des'.tr(),
                                  title: 'exit'.tr(),
                                  button1Text: 'cancel'.tr(),
                                  button2Text: 'exit2'.tr());
                              if (logout) {
                                BlocProvider.of<AppBloc>(context)
                                    .add(const AppEvent.exiting());
                                context.router.push(const LoginRoute());
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
      ),
    );
  }
}
