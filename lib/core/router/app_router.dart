import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/services/connection_service.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/ayat_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/namaz_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/Allah_names_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/Islam_teaching_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/ayat_day_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/dhikr_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/dhikr_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/duty_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/duty_page.dart';

import 'package:nurlan_ustaz_flutter/features/app/auth_required_dialog.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/ui/base_page.dart';
import 'package:nurlan_ustaz_flutter/features/app/on_boarding/presentation/ui/on_boarding.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/namaz_pattern_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/namaz_read_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/duty_5/wudhu_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/name_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/prayers_page.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/ui/surah_page.dart';
import 'package:nurlan_ustaz_flutter/features/app/data/datasource/onboarding_local_ds.dart'
    show OnboardingLocalDs;
import 'package:nurlan_ustaz_flutter/features/auth/data/datasource/local/auth_local_ds.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/widgets/logout_confirmation_dialog.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/widgets/delete_profile_confirmation_dialog.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/registration/code_verification_page.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/registration/registration_tab.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/registration/registration_scope.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_password/code_verification_forgot.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_password/forgot_password_page.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_password/new_password_page.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/forgot_password/forgot_password_scope.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/authorization_page.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/ui/login_tab.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/charity_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/comment_sem_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/main_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/news_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/notifications_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/about_app_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/add_new_card_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/change_password_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/payment_check_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/payment_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_cards_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_info_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_notification_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/qr_scanner_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/technical_support_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/widgets/change_language_bottom_sheet.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/qiblah_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_detail_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/seminar_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/services_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/shop_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/ui/ustaz_aitinizhi.dart';

import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/geonames_page.dart';
import 'package:nurlan_ustaz_flutter/features/app/no_connection/no_connection_page.dart';
import 'package:nurlan_ustaz_flutter/features/tandaulilar/presentation/ui/tandaulilar_main_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/custom_tus_zhoru_details_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/question_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_details_page.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/ui/tus_zhoru_page.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/ui/zhosparym_page.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/presentation/widgets/holiday_details_page.dart';

import '../../features/Islam_teaching/presentation/ui/detail_prayers_page.dart';
import '../../features/Islam_teaching/presentation/ui/name_detail_page.dart';
import '../../features/Islam_teaching/presentation/ui/surah_detail_page.dart';
import '../../features/home/presentation/ui/comment_news_page.dart';
import '../../features/home/presentation/ui/live_broadcasts_page.dart';
import '../../features/home/presentation/ui/namaz_page.dart';
import '../../features/home/presentation/ui/news_detail_page.dart';
import '../../features/home/presentation/ui/profile/faq_page.dart';
import '../../features/zhosparlar/data/models/checklist_dto.dart';
import '../../features/zhosparlar/data/models/event_dto.dart';
import '../../features/zhosparlar/presentation/ui/ramazan_checklist.dart';

part 'app_router.gr.dart';

// guards
part 'guards/onboarding_guard.dart';
part 'guards/auth_guard.dart';
part 'guards/connection_guard.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({
    required this.authGuard,
    required this.connectionGuard,
    required this.onboardingGuard,
  });

  @protected
  final OnboardingGuard onboardingGuard;

  // TODO: add authGuard to routes, that should be accessible only with auth
  @protected
  final AuthGuard authGuard;

  @protected
  final ConnectionGuard connectionGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: AppFlow.page,
          guards: [connectionGuard],
          children: [
            AutoRoute(
              page: BaseRoute.page,
              path: '',
              guards: [onboardingGuard],
              children: [
                AutoRoute(
                  path: '',
                  page: MainRouterPage.page,
                ),
                AutoRoute(
                  path: 'islam-teaching',
                  page: IslamTeachingRouterPage.page,
                ),
                AutoRoute(
                  path: 'tus-zhoru',
                  page: TusZhoruRouterPage.page,
                ),
                AutoRoute(
                  path: 'tandaulilar',
                  page: TandaulilarMainRouterPage.page,
                ),
                AutoRoute(
                  path: 'zhosparym',
                  page: ZhosparymMainRouterPage.page,
                ),
              ],
            ),
            // AutoRoute(
            //   initial: true,
            //   page: SplashRoute.page,
            // ),
            AutoRoute(
              path: 'onboarding',
              page: OnBoardingRoute.page,
            ),
            AutoRoute(
              path: 'login',
              page: AuthorizationRoute.page,
              children: [
                AutoRoute(
                  path: '',
                  page: LoginTabRoute.page,
                ),
                AutoRoute(
                  path: 'registration',
                  page: RegistrationFlow.page,
                  children: [
                    AutoRoute(
                      path: '',
                      page: RegistrationTabRoute.page,
                    ),
                    AutoRoute(
                      path: 'code-verification',
                      page: CodeVerificationRoute.page,
                    ),
                  ],
                ),
              ],
            ),
            AutoRoute(
              path: 'forgot-password',
              page: ForgotPasswordFlow.page,
              children: [
                AutoRoute(
                  path: '',
                  page: ForgotPasswordRoute.page,
                ),
                AutoRoute(
                  path: 'code-verification-forgot',
                  page: CodeVerificationForgotRoute.page,
                ),
                AutoRoute(
                  path: 'new-password',
                  page: NewPasswordRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'geonames',
              page: GeonamesRoute.page,
            ),
            AutoRoute(
              path: 'technical-support',
              page: TechnicalSupportRoute.page,
            ),
            AutoRoute(
              path: 'ramazan-check-list',
              page: RamazanChecklistRoute.page,
            ),
            AutoRoute(
              path: 'add-new-card',
              page: AddNewCardRoute.page,
            ),
            AutoRoute(
              path: 'change-password',
              page: ChangePasswordRoute.page,
            ),
            AutoRoute(
              path: 'profile-notification',
              page: ProfileNotificationRoute.page,
            ),
            AutoRoute(
              path: 'faq',
              page: FaqRoute.page,
            ),
            AutoRoute(
              path: 'about-app',
              page: AboutAppRoute.page,
            ),
            //
            AutoRoute(
              path: 'profile-cards',
              page: ProfileCardsRoute.page,
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileMainRoute.page,
              guards: [authGuard],
            ),
            CustomRoute(
              path: 'change-language',
              page: ChangeLanguageBottomSheetRoute.page,
              customRouteBuilder: modalSheetBuilder,
            ),
            CustomRoute(
              path: 'confirm-logout',
              page: LogoutConfirmationDialogRoute.page,
              customRouteBuilder: dialogRouteBuilder,
            ),
            CustomRoute(
              path: 'confirm-delete-profile',
              page: DeleteProfileConfirmationDialogRoute.page,
              customRouteBuilder: dialogRouteBuilder,
            ),
            //
            AutoRoute(
              path: 'payments',
              page: PaymentsRoute.page,
            ),
            AutoRoute(
              path: 'profile-info',
              page: ProfileInfoRoute.page,
            ),
            AutoRoute(
              path: 'ustaz-aitinizh',
              page: UstazAitinizhiRoute.page,
            ),
            AutoRoute(
              path: 'seminar',
              page: SeminarRoute.page,
            ),
            AutoRoute(
              path: 'seminar-detail',
              page: SeminarDetailRoute.page,
            ),
            AutoRoute(
              path: 'notification',
              page: NotificationRoute.page,
            ),
            AutoRoute(
              path: 'charity',
              page: CharityRoute.page,
            ),
            AutoRoute(
              path: 'charity-detail',
              page: CharityDetailRoute.page,
            ),
            AutoRoute(
              path: 'services',
              page: ServicesRoute.page,
            ),
            AutoRoute(
              path: 'live-broadcast',
              page: LiveBroadcastsRoute.page,
            ),
            AutoRoute(
              path: 'shop',
              page: ShopRoute.page,
            ),
            AutoRoute(
              path: 'news',
              page: NewsRoute.page,
            ),
            AutoRoute(
              path: 'news-detail',
              page: NewsDetailRoute.page,
            ),
            AutoRoute(
              path: 'namaz',
              page: NamazRoute.page,
            ),
            AutoRoute(
              path: 'qiblah',
              page: QiblahRoute.page,
            ),
            AutoRoute(
              path: 'comment-seminar',
              page: CommentSemRoute.page,
            ),
            AutoRoute(
              path: 'comment-news',
              page: CommentNewsRoute.page,
            ),
            AutoRoute(
              path: 'saved-tus-zhoru',
              page: SavedTusZhoruRoute.page,
            ),
            AutoRoute(
              path: 'tus-zhoru-detail',
              page: TusZhoruDetailRoute.page,
            ),
            AutoRoute(
              path: 'custom-tus-zhoru-detail',
              page: CustomTusZhoruDetailRoute.page,
            ),
            AutoRoute(
              path: 'question',
              page: QuestionRoute.page,
            ),
            AutoRoute(
              path: 'ayat-day',
              page: AyatDayRoute.page,
            ),
            AutoRoute(
              path: 'duty',
              page: DutyRoute.page,
            ),
            AutoRoute(
              path: 'duty-detail',
              page: DutyDetailRoute.page,
            ),
            AutoRoute(
              path: 'Allah-names',
              page: AllahNamesRoute.page,
            ),
            AutoRoute(
              path: 'dhikr',
              page: DhikrRoute.page,
            ),
            AutoRoute(
              path: 'dhikr-detail',
              page: DhikrDetailRoute.page,
            ),
            AutoRoute(
              path: 'prayers',
              page: PrayersRoute.page,
            ),
            AutoRoute(
              path: 'prayers-detail',
              page: PrayersDetailRoute.page,
            ),
            AutoRoute(
              path: 'surah',
              page: SurahRoute.page,
            ),
            AutoRoute(
              path: 'surah-detail',
              page: SurahDetailRoute.page,
            ),
            AutoRoute(
              path: 'name',
              page: NameRoute.page,
            ),
            AutoRoute(
              path: 'name-detail',
              page: NameDetailRoute.page,
            ),
            AutoRoute(
              path: 'namaz-read',
              page: NamazReadRoute.page,
            ),
            AutoRoute(
              path: 'namaz-pattern',
              page: NamazPatternRoute.page,
            ),
            AutoRoute(
              path: 'wudhu',
              page: WudhuRoute.page,
            ),
            AutoRoute(
              path: 'holiday-detail',
              page: HolidayDetailRoute.page,
            ),
            AutoRoute(
              path: 'qr-scanner',
              page: QrScannerRoute.page,
            ),
            AutoRoute(
              path: 'payment-check',
              page: PaymentCheckRoute.page,
            )
          ],
        ),
        CustomRoute(
          path: '/auth-required-dialog',
          page: AuthRequiredDialogRoute.page,
          customRouteBuilder: dialogRouteBuilder,
        ),
        AutoRoute(
          path: '/no-connection',
          page: NoConnectionRoute.page,
        ),
        RedirectRoute(path: '*', redirectTo: '/'),
      ];
}

@RoutePage(name: 'AppFlow')
class AppScope extends AutoRouter {
  const AppScope({super.key});
}

Route<T> dialogRouteBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return DialogRoute(
    settings: page,
    builder: (context) => child,
    context: context,
    useSafeArea: false,
  );
}

Route<T> modalSheetBuilder<T>(
  BuildContext context,
  Widget child,
  AutoRoutePage<T> page,
) {
  return ModalBottomSheetRoute(
    settings: page,
    builder: (context) => child,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}
