import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/action_result_widget.dart';
import 'package:nurlan_ustaz_flutter/core/widgets/app_progress_indicator.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/load_profile_bloc.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/profile_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/widgets/profile_menu_item.dart';

import '../../../../../core/common/assets.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class ProfileMainPage extends StatelessWidget {
  const ProfileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userLoadState = context.watch<LoadProfileBloc>().state;
    final user = context.watch<ProfileCubit>().state.toNullable;

    return Scaffold(
      body: GlobalCustomBody(
        child: CustomScrollView(
          slivers: [
            ...userLoadState.maybeWhen(
              orElse: (_) => [AppProgressIndicatorSliver()],
              failure: (_) => [
                ActionResultWidget.error(
                  automaticallyImplyPopButton: false,
                  automaticallyImplyCloseButton: false,
                  content: 'error.information_passed_to_developers'.tr(),
                  bottom: AppButton(
                    onTap: () {
                      context.read<LoadProfileBloc>().add(const LoadProfileEvent());
                    },
                    text: context.tr('retry'),
                  ),
                ),
              ],
              success: (d) {
                final data = user ?? d;

                final avatar = data.avatar;
                return [
                  SliverList.list(
                    children: [
                      CustomAppBar(
                        title: 'profile'.tr(),
                      ),
                      SizedBox(height: 44.h),
                      CircleAvatar(
                        radius: 47.r,
                        backgroundColor: Colors.transparent,
                        backgroundImage: avatar != null
                            ? NetworkImage(
                                avatar,
                                // fit: BoxFit.cover,
                              ) as ImageProvider
                            : null,
                        child: avatar == null
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
                        data.fullName ?? 'Unknown',
                        style: getTextStyle(CustomTextStyles.s20w700).copyWith(
                          fontWeight: FontWeight.w400,
                          fontFamily: FontTypes.Philosopher.name,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      _ProfileItemsGroup(
                        items: [
                          ProfileMenuItem(
                              title: 'My_data'.tr(),
                              onTap: () {
                                context.router.push(
                                  ProfileInfoRoute(userDTO: data),
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
                      //
                      SizedBox(height: 12.h),
                      //
                      _ProfileItemsGroup(
                        items: [
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
                      //
                      SizedBox(height: 12.h),
                      //
                      _ProfileItemsGroup(
                        items: [
                          ProfileMenuItem(
                            title: context.tr(
                              'language',
                            ),
                            onTap: () {
                              context.router
                                  .push(const ChangeLanguageBottomSheetRoute());
                            },
                          ),
                          // TODO: вообще не реализовано
                          // ProfileMenuItem(
                          //   title: userLoadState.geo.name!,
                          //   onTap: () {
                          //     context.router.push(
                          //       GeonamesRoute(type: 'profile'),
                          //     );
                          //   },
                          // ),
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
                          if (data.isStaff == true)
                            ProfileMenuItem(
                              title: 'QR.qr_scanner'.tr(),
                              onTap: () {
                                context.router.push(
                                  const QrScannerRoute(),
                                );
                              },
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),

                      _ProfileItemsGroup(
                        items: [
                          ProfileMenuItem(
                            isExit: true,
                            title: 'exit'.tr(),
                            onTap: () async {
                              final logout = await context.router
                                  .push<bool>(LogoutConfirmationDialogRoute());
                              if (logout != true || !context.mounted) return;
                              context.router.pop();
                              context.read<AuthCubit>().logout();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileItemsGroup extends StatelessWidget {
  const _ProfileItemsGroup({required this.items});

  @protected
  final List<ProfileMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: items,
      ),
    );
  }
}
