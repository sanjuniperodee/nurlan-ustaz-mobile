// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AboutAppPage]
class AboutAppRoute extends PageRouteInfo<void> {
  const AboutAppRoute({List<PageRouteInfo>? children})
      : super(AboutAppRoute.name, initialChildren: children);

  static const String name = 'AboutAppRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutAppPage();
    },
  );
}

/// generated route for
/// [AddNewCardPage]
class AddNewCardRoute extends PageRouteInfo<AddNewCardRouteArgs> {
  AddNewCardRoute({
    Key? key,
    required String addCardUrl,
    List<PageRouteInfo>? children,
  }) : super(
          AddNewCardRoute.name,
          args: AddNewCardRouteArgs(key: key, addCardUrl: addCardUrl),
          initialChildren: children,
        );

  static const String name = 'AddNewCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddNewCardRouteArgs>();
      return AddNewCardPage(key: args.key, addCardUrl: args.addCardUrl);
    },
  );
}

class AddNewCardRouteArgs {
  const AddNewCardRouteArgs({this.key, required this.addCardUrl});

  final Key? key;

  final String addCardUrl;

  @override
  String toString() {
    return 'AddNewCardRouteArgs{key: $key, addCardUrl: $addCardUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddNewCardRouteArgs) return false;
    return key == other.key && addCardUrl == other.addCardUrl;
  }

  @override
  int get hashCode => key.hashCode ^ addCardUrl.hashCode;
}

/// generated route for
/// [AllahNamesPage]
class AllahNamesRoute extends PageRouteInfo<void> {
  const AllahNamesRoute({List<PageRouteInfo>? children})
      : super(AllahNamesRoute.name, initialChildren: children);

  static const String name = 'AllahNamesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AllahNamesPage();
    },
  );
}

/// generated route for
/// [AppScope]
class AppFlow extends PageRouteInfo<void> {
  const AppFlow({List<PageRouteInfo>? children})
      : super(AppFlow.name, initialChildren: children);

  static const String name = 'AppFlow';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppScope();
    },
  );
}

/// generated route for
/// [AuthRequiredDialog]
class AuthRequiredDialogRoute
    extends PageRouteInfo<AuthRequiredDialogRouteArgs> {
  AuthRequiredDialogRoute({Key? key, List<PageRouteInfo>? children})
      : super(
          AuthRequiredDialogRoute.name,
          args: AuthRequiredDialogRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AuthRequiredDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthRequiredDialogRouteArgs>(
        orElse: () => const AuthRequiredDialogRouteArgs(),
      );
      return AuthRequiredDialog(key: args.key);
    },
  );
}

class AuthRequiredDialogRouteArgs {
  const AuthRequiredDialogRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthRequiredDialogRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthRequiredDialogRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [AuthorizationPage]
class AuthorizationRoute extends PageRouteInfo<void> {
  const AuthorizationRoute({List<PageRouteInfo>? children})
      : super(AuthorizationRoute.name, initialChildren: children);

  static const String name = 'AuthorizationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthorizationPage();
    },
  );
}

/// generated route for
/// [AyatDayPage]
class AyatDayRoute extends PageRouteInfo<AyatDayRouteArgs> {
  AyatDayRoute({
    Key? key,
    required AyatDTO ayatDTO,
    List<PageRouteInfo>? children,
  }) : super(
          AyatDayRoute.name,
          args: AyatDayRouteArgs(key: key, ayatDTO: ayatDTO),
          initialChildren: children,
        );

  static const String name = 'AyatDayRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AyatDayRouteArgs>();
      return AyatDayPage(key: args.key, ayatDTO: args.ayatDTO);
    },
  );
}

class AyatDayRouteArgs {
  const AyatDayRouteArgs({this.key, required this.ayatDTO});

  final Key? key;

  final AyatDTO ayatDTO;

  @override
  String toString() {
    return 'AyatDayRouteArgs{key: $key, ayatDTO: $ayatDTO}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AyatDayRouteArgs) return false;
    return key == other.key && ayatDTO == other.ayatDTO;
  }

  @override
  int get hashCode => key.hashCode ^ ayatDTO.hashCode;
}

/// generated route for
/// [BasePage]
class BaseRoute extends PageRouteInfo<void> {
  const BaseRoute({List<PageRouteInfo>? children})
      : super(BaseRoute.name, initialChildren: children);

  static const String name = 'BaseRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BasePage();
    },
  );
}

/// generated route for
/// [ChangeLanguageBottomSheet]
class ChangeLanguageBottomSheetRoute extends PageRouteInfo<void> {
  const ChangeLanguageBottomSheetRoute({List<PageRouteInfo>? children})
      : super(ChangeLanguageBottomSheetRoute.name, initialChildren: children);

  static const String name = 'ChangeLanguageBottomSheetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangeLanguageBottomSheet();
    },
  );
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
      : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordPage();
    },
  );
}

/// generated route for
/// [CharityDetailPage]
class CharityDetailRoute extends PageRouteInfo<CharityDetailRouteArgs> {
  CharityDetailRoute({
    Key? key,
    required ResultHomeDTO result,
    List<PageRouteInfo>? children,
  }) : super(
          CharityDetailRoute.name,
          args: CharityDetailRouteArgs(key: key, result: result),
          initialChildren: children,
        );

  static const String name = 'CharityDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharityDetailRouteArgs>();
      return CharityDetailPage(key: args.key, result: args.result);
    },
  );
}

class CharityDetailRouteArgs {
  const CharityDetailRouteArgs({this.key, required this.result});

  final Key? key;

  final ResultHomeDTO result;

  @override
  String toString() {
    return 'CharityDetailRouteArgs{key: $key, result: $result}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharityDetailRouteArgs) return false;
    return key == other.key && result == other.result;
  }

  @override
  int get hashCode => key.hashCode ^ result.hashCode;
}

/// generated route for
/// [CharityPage]
class CharityRoute extends PageRouteInfo<void> {
  const CharityRoute({List<PageRouteInfo>? children})
      : super(CharityRoute.name, initialChildren: children);

  static const String name = 'CharityRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CharityPage();
    },
  );
}

/// generated route for
/// [CodeVerificationForgotPage]
class CodeVerificationForgotRoute
    extends PageRouteInfo<CodeVerificationForgotRouteArgs> {
  CodeVerificationForgotRoute({
    Key? key,
    required String email,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          CodeVerificationForgotRoute.name,
          args: CodeVerificationForgotRouteArgs(
            key: key,
            email: email,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'CodeVerificationForgotRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CodeVerificationForgotRouteArgs>();
      return WrappedRoute(
        child: CodeVerificationForgotPage(
          key: args.key,
          email: args.email,
          userId: args.userId,
        ),
      );
    },
  );
}

class CodeVerificationForgotRouteArgs {
  const CodeVerificationForgotRouteArgs({
    this.key,
    required this.email,
    required this.userId,
  });

  final Key? key;

  final String email;

  final int userId;

  @override
  String toString() {
    return 'CodeVerificationForgotRouteArgs{key: $key, email: $email, userId: $userId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CodeVerificationForgotRouteArgs) return false;
    return key == other.key && email == other.email && userId == other.userId;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode ^ userId.hashCode;
}

/// generated route for
/// [CodeVerificationPage]
class CodeVerificationRoute extends PageRouteInfo<CodeVerificationRouteArgs> {
  CodeVerificationRoute({
    required UserDto userPayload,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CodeVerificationRoute.name,
          args: CodeVerificationRouteArgs(userPayload: userPayload, key: key),
          initialChildren: children,
        );

  static const String name = 'CodeVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CodeVerificationRouteArgs>();
      return WrappedRoute(
        child: CodeVerificationPage(
          userPayload: args.userPayload,
          key: args.key,
        ),
      );
    },
  );
}

class CodeVerificationRouteArgs {
  const CodeVerificationRouteArgs({required this.userPayload, this.key});

  final UserDto userPayload;

  final Key? key;

  @override
  String toString() {
    return 'CodeVerificationRouteArgs{userPayload: $userPayload, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CodeVerificationRouteArgs) return false;
    return userPayload == other.userPayload && key == other.key;
  }

  @override
  int get hashCode => userPayload.hashCode ^ key.hashCode;
}

/// generated route for
/// [CommentNewsPage]
class CommentNewsRoute extends PageRouteInfo<CommentNewsRouteArgs> {
  CommentNewsRoute({Key? key, required int id, List<PageRouteInfo>? children})
      : super(
          CommentNewsRoute.name,
          args: CommentNewsRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'CommentNewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentNewsRouteArgs>();
      return CommentNewsPage(key: args.key, id: args.id);
    },
  );
}

class CommentNewsRouteArgs {
  const CommentNewsRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CommentNewsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommentNewsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [CommentSemPage]
class CommentSemRoute extends PageRouteInfo<CommentSemRouteArgs> {
  CommentSemRoute({Key? key, required int id, List<PageRouteInfo>? children})
      : super(
          CommentSemRoute.name,
          args: CommentSemRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'CommentSemRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentSemRouteArgs>();
      return CommentSemPage(key: args.key, id: args.id);
    },
  );
}

class CommentSemRouteArgs {
  const CommentSemRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CommentSemRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CommentSemRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [CustomTusZhoruDetailPage]
class CustomTusZhoruDetailRoute
    extends PageRouteInfo<CustomTusZhoruDetailRouteArgs> {
  CustomTusZhoruDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CustomTusZhoruDetailRoute.name,
          args: CustomTusZhoruDetailRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'CustomTusZhoruDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomTusZhoruDetailRouteArgs>();
      return CustomTusZhoruDetailPage(key: args.key, id: args.id);
    },
  );
}

class CustomTusZhoruDetailRouteArgs {
  const CustomTusZhoruDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'CustomTusZhoruDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomTusZhoruDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [DeleteProfileConfirmationDialog]
class DeleteProfileConfirmationDialogRoute
    extends PageRouteInfo<DeleteProfileConfirmationDialogRouteArgs> {
  DeleteProfileConfirmationDialogRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DeleteProfileConfirmationDialogRoute.name,
          args: DeleteProfileConfirmationDialogRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DeleteProfileConfirmationDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DeleteProfileConfirmationDialogRouteArgs>(
        orElse: () => const DeleteProfileConfirmationDialogRouteArgs(),
      );
      return DeleteProfileConfirmationDialog(key: args.key);
    },
  );
}

class DeleteProfileConfirmationDialogRouteArgs {
  const DeleteProfileConfirmationDialogRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'DeleteProfileConfirmationDialogRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DeleteProfileConfirmationDialogRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [DhikrDetailPage]
class DhikrDetailRoute extends PageRouteInfo<DhikrDetailRouteArgs> {
  DhikrDetailRoute({
    Key? key,
    required ResultTeachingDTO result,
    List<PageRouteInfo>? children,
  }) : super(
          DhikrDetailRoute.name,
          args: DhikrDetailRouteArgs(key: key, result: result),
          initialChildren: children,
        );

  static const String name = 'DhikrDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DhikrDetailRouteArgs>();
      return DhikrDetailPage(key: args.key, result: args.result);
    },
  );
}

class DhikrDetailRouteArgs {
  const DhikrDetailRouteArgs({this.key, required this.result});

  final Key? key;

  final ResultTeachingDTO result;

  @override
  String toString() {
    return 'DhikrDetailRouteArgs{key: $key, result: $result}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DhikrDetailRouteArgs) return false;
    return key == other.key && result == other.result;
  }

  @override
  int get hashCode => key.hashCode ^ result.hashCode;
}

/// generated route for
/// [DhikrPage]
class DhikrRoute extends PageRouteInfo<DhikrRouteArgs> {
  DhikrRoute({Key? key, String? type, List<PageRouteInfo>? children})
      : super(
          DhikrRoute.name,
          args: DhikrRouteArgs(key: key, type: type),
          initialChildren: children,
        );

  static const String name = 'DhikrRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DhikrRouteArgs>(
        orElse: () => const DhikrRouteArgs(),
      );
      return DhikrPage(key: args.key, type: args.type);
    },
  );
}

class DhikrRouteArgs {
  const DhikrRouteArgs({this.key, this.type});

  final Key? key;

  final String? type;

  @override
  String toString() {
    return 'DhikrRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DhikrRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [DutyDetailPage]
class DutyDetailRoute extends PageRouteInfo<DutyDetailRouteArgs> {
  DutyDetailRoute({
    Key? key,
    required PillarsDTO pillarsDTO,
    List<PageRouteInfo>? children,
  }) : super(
          DutyDetailRoute.name,
          args: DutyDetailRouteArgs(key: key, pillarsDTO: pillarsDTO),
          initialChildren: children,
        );

  static const String name = 'DutyDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DutyDetailRouteArgs>();
      return DutyDetailPage(key: args.key, pillarsDTO: args.pillarsDTO);
    },
  );
}

class DutyDetailRouteArgs {
  const DutyDetailRouteArgs({this.key, required this.pillarsDTO});

  final Key? key;

  final PillarsDTO pillarsDTO;

  @override
  String toString() {
    return 'DutyDetailRouteArgs{key: $key, pillarsDTO: $pillarsDTO}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DutyDetailRouteArgs) return false;
    return key == other.key && pillarsDTO == other.pillarsDTO;
  }

  @override
  int get hashCode => key.hashCode ^ pillarsDTO.hashCode;
}

/// generated route for
/// [DutyPage]
class DutyRoute extends PageRouteInfo<void> {
  const DutyRoute({List<PageRouteInfo>? children})
      : super(DutyRoute.name, initialChildren: children);

  static const String name = 'DutyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DutyPage();
    },
  );
}

/// generated route for
/// [FaqPage]
class FaqRoute extends PageRouteInfo<void> {
  const FaqRoute({List<PageRouteInfo>? children})
      : super(FaqRoute.name, initialChildren: children);

  static const String name = 'FaqRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FaqPage();
    },
  );
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ForgotPasswordPage());
    },
  );
}

/// generated route for
/// [ForgotPasswordScope]
class ForgotPasswordFlow extends PageRouteInfo<void> {
  const ForgotPasswordFlow({List<PageRouteInfo>? children})
      : super(ForgotPasswordFlow.name, initialChildren: children);

  static const String name = 'ForgotPasswordFlow';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordScope();
    },
  );
}

/// generated route for
/// [GeonamesPage]
class GeonamesRoute extends PageRouteInfo<GeonamesRouteArgs> {
  GeonamesRoute({
    Key? key,
    void Function()? callback,
    String? type,
    List<PageRouteInfo>? children,
  }) : super(
          GeonamesRoute.name,
          args: GeonamesRouteArgs(key: key, callback: callback, type: type),
          initialChildren: children,
        );

  static const String name = 'GeonamesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GeonamesRouteArgs>(
        orElse: () => const GeonamesRouteArgs(),
      );
      return GeonamesPage(
        key: args.key,
        callback: args.callback,
        type: args.type,
      );
    },
  );
}

class GeonamesRouteArgs {
  const GeonamesRouteArgs({this.key, this.callback, this.type});

  final Key? key;

  final void Function()? callback;

  final String? type;

  @override
  String toString() {
    return 'GeonamesRouteArgs{key: $key, callback: $callback, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeonamesRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [HolidayDetailPage]
class HolidayDetailRoute extends PageRouteInfo<HolidayDetailRouteArgs> {
  HolidayDetailRoute({
    Key? key,
    required EventDto event,
    List<PageRouteInfo>? children,
  }) : super(
          HolidayDetailRoute.name,
          args: HolidayDetailRouteArgs(key: key, event: event),
          initialChildren: children,
        );

  static const String name = 'HolidayDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HolidayDetailRouteArgs>();
      return HolidayDetailPage(key: args.key, event: args.event);
    },
  );
}

class HolidayDetailRouteArgs {
  const HolidayDetailRouteArgs({this.key, required this.event});

  final Key? key;

  final EventDto event;

  @override
  String toString() {
    return 'HolidayDetailRouteArgs{key: $key, event: $event}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HolidayDetailRouteArgs) return false;
    return key == other.key && event == other.event;
  }

  @override
  int get hashCode => key.hashCode ^ event.hashCode;
}

/// generated route for
/// [IslamTeachingPage]
class IslamTeachingRouterPage extends PageRouteInfo<void> {
  const IslamTeachingRouterPage({List<PageRouteInfo>? children})
      : super(IslamTeachingRouterPage.name, initialChildren: children);

  static const String name = 'IslamTeachingRouterPage';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IslamTeachingPage();
    },
  );
}

/// generated route for
/// [LiveBroadcastsPage]
class LiveBroadcastsRoute extends PageRouteInfo<LiveBroadcastsRouteArgs> {
  LiveBroadcastsRoute({Key? key, String? type, List<PageRouteInfo>? children})
      : super(
          LiveBroadcastsRoute.name,
          args: LiveBroadcastsRouteArgs(key: key, type: type),
          initialChildren: children,
        );

  static const String name = 'LiveBroadcastsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LiveBroadcastsRouteArgs>(
        orElse: () => const LiveBroadcastsRouteArgs(),
      );
      return LiveBroadcastsPage(key: args.key, type: args.type);
    },
  );
}

class LiveBroadcastsRouteArgs {
  const LiveBroadcastsRouteArgs({this.key, this.type});

  final Key? key;

  final String? type;

  @override
  String toString() {
    return 'LiveBroadcastsRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LiveBroadcastsRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [LoginTab]
class LoginTabRoute extends PageRouteInfo<void> {
  const LoginTabRoute({List<PageRouteInfo>? children})
      : super(LoginTabRoute.name, initialChildren: children);

  static const String name = 'LoginTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginTab());
    },
  );
}

/// generated route for
/// [LogoutConfirmationDialog]
class LogoutConfirmationDialogRoute
    extends PageRouteInfo<LogoutConfirmationDialogRouteArgs> {
  LogoutConfirmationDialogRoute({Key? key, List<PageRouteInfo>? children})
      : super(
          LogoutConfirmationDialogRoute.name,
          args: LogoutConfirmationDialogRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LogoutConfirmationDialogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LogoutConfirmationDialogRouteArgs>(
        orElse: () => const LogoutConfirmationDialogRouteArgs(),
      );
      return LogoutConfirmationDialog(key: args.key);
    },
  );
}

class LogoutConfirmationDialogRouteArgs {
  const LogoutConfirmationDialogRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LogoutConfirmationDialogRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LogoutConfirmationDialogRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [MainPage]
class MainRouterPage extends PageRouteInfo<void> {
  const MainRouterPage({List<PageRouteInfo>? children})
      : super(MainRouterPage.name, initialChildren: children);

  static const String name = 'MainRouterPage';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [NamazPage]
class NamazRoute extends PageRouteInfo<NamazRouteArgs> {
  NamazRoute({
    Key? key,
    GeonamesDTO? geonamesDTO,
    List<PageRouteInfo>? children,
  }) : super(
          NamazRoute.name,
          args: NamazRouteArgs(key: key, geonamesDTO: geonamesDTO),
          initialChildren: children,
        );

  static const String name = 'NamazRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NamazRouteArgs>(
        orElse: () => const NamazRouteArgs(),
      );
      return NamazPage(key: args.key, geonamesDTO: args.geonamesDTO);
    },
  );
}

class NamazRouteArgs {
  const NamazRouteArgs({this.key, this.geonamesDTO});

  final Key? key;

  final GeonamesDTO? geonamesDTO;

  @override
  String toString() {
    return 'NamazRouteArgs{key: $key, geonamesDTO: $geonamesDTO}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NamazRouteArgs) return false;
    return key == other.key && geonamesDTO == other.geonamesDTO;
  }

  @override
  int get hashCode => key.hashCode ^ geonamesDTO.hashCode;
}

/// generated route for
/// [NamazPatternPage]
class NamazPatternRoute extends PageRouteInfo<void> {
  const NamazPatternRoute({List<PageRouteInfo>? children})
      : super(NamazPatternRoute.name, initialChildren: children);

  static const String name = 'NamazPatternRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NamazPatternPage();
    },
  );
}

/// generated route for
/// [NamazReadPage]
class NamazReadRoute extends PageRouteInfo<NamazReadRouteArgs> {
  NamazReadRoute({
    Key? key,
    required int id,
    required String gender,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
          NamazReadRoute.name,
          args:
              NamazReadRouteArgs(key: key, id: id, gender: gender, type: type),
          initialChildren: children,
        );

  static const String name = 'NamazReadRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NamazReadRouteArgs>();
      return NamazReadPage(
        key: args.key,
        id: args.id,
        gender: args.gender,
        type: args.type,
      );
    },
  );
}

class NamazReadRouteArgs {
  const NamazReadRouteArgs({
    this.key,
    required this.id,
    required this.gender,
    required this.type,
  });

  final Key? key;

  final int id;

  final String gender;

  final String type;

  @override
  String toString() {
    return 'NamazReadRouteArgs{key: $key, id: $id, gender: $gender, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NamazReadRouteArgs) return false;
    return key == other.key &&
        id == other.id &&
        gender == other.gender &&
        type == other.type;
  }

  @override
  int get hashCode =>
      key.hashCode ^ id.hashCode ^ gender.hashCode ^ type.hashCode;
}

/// generated route for
/// [NameDetailPage]
class NameDetailRoute extends PageRouteInfo<NameDetailRouteArgs> {
  NameDetailRoute({
    Key? key,
    required int id,
    int? index,
    List<PageRouteInfo>? children,
  }) : super(
          NameDetailRoute.name,
          args: NameDetailRouteArgs(key: key, id: id, index: index),
          initialChildren: children,
        );

  static const String name = 'NameDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NameDetailRouteArgs>();
      return NameDetailPage(key: args.key, id: args.id, index: args.index);
    },
  );
}

class NameDetailRouteArgs {
  const NameDetailRouteArgs({this.key, required this.id, this.index});

  final Key? key;

  final int id;

  final int? index;

  @override
  String toString() {
    return 'NameDetailRouteArgs{key: $key, id: $id, index: $index}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NameDetailRouteArgs) return false;
    return key == other.key && id == other.id && index == other.index;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode ^ index.hashCode;
}

/// generated route for
/// [NamePage]
class NameRoute extends PageRouteInfo<NameRouteArgs> {
  NameRoute({Key? key, String? type, List<PageRouteInfo>? children})
      : super(
          NameRoute.name,
          args: NameRouteArgs(key: key, type: type),
          initialChildren: children,
        );

  static const String name = 'NameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NameRouteArgs>(
        orElse: () => const NameRouteArgs(),
      );
      return NamePage(key: args.key, type: args.type);
    },
  );
}

class NameRouteArgs {
  const NameRouteArgs({this.key, this.type});

  final Key? key;

  final String? type;

  @override
  String toString() {
    return 'NameRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NameRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    required String email,
    required String sessionId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NewPasswordRoute.name,
          args: NewPasswordRouteArgs(
            email: email,
            sessionId: sessionId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewPasswordRouteArgs>();
      return WrappedRoute(
        child: NewPasswordPage(
          email: args.email,
          sessionId: args.sessionId,
          key: args.key,
        ),
      );
    },
  );
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    required this.email,
    required this.sessionId,
    this.key,
  });

  final String email;

  final String sessionId;

  final Key? key;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{email: $email, sessionId: $sessionId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewPasswordRouteArgs) return false;
    return email == other.email &&
        sessionId == other.sessionId &&
        key == other.key;
  }

  @override
  int get hashCode => email.hashCode ^ sessionId.hashCode ^ key.hashCode;
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    Key? key,
    required int id,
    String? search,
    List<PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(key: key, id: id, search: search),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsDetailRouteArgs>();
      return NewsDetailPage(key: args.key, id: args.id, search: args.search);
    },
  );
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.id, this.search});

  final Key? key;

  final int id;

  final String? search;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, id: $id, search: $search}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsDetailRouteArgs) return false;
    return key == other.key && id == other.id && search == other.search;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode ^ search.hashCode;
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<NewsRouteArgs> {
  NewsRoute({Key? key, String? type, List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          args: NewsRouteArgs(key: key, type: type),
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsRouteArgs>(
        orElse: () => const NewsRouteArgs(),
      );
      return NewsPage(key: args.key, type: args.type);
    },
  );
}

class NewsRouteArgs {
  const NewsRouteArgs({this.key, this.type});

  final Key? key;

  final String? type;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [NoConnectionPage]
class NoConnectionRoute extends PageRouteInfo<void> {
  const NoConnectionRoute({List<PageRouteInfo>? children})
      : super(NoConnectionRoute.name, initialChildren: children);

  static const String name = 'NoConnectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NoConnectionPage();
    },
  );
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationPage();
    },
  );
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardingPage();
    },
  );
}

/// generated route for
/// [PaymentCheckPage]
class PaymentCheckRoute extends PageRouteInfo<PaymentCheckRouteArgs> {
  PaymentCheckRoute({
    Key? key,
    required String checkUrl,
    List<PageRouteInfo>? children,
  }) : super(
          PaymentCheckRoute.name,
          args: PaymentCheckRouteArgs(key: key, checkUrl: checkUrl),
          initialChildren: children,
        );

  static const String name = 'PaymentCheckRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PaymentCheckRouteArgs>();
      return PaymentCheckPage(key: args.key, checkUrl: args.checkUrl);
    },
  );
}

class PaymentCheckRouteArgs {
  const PaymentCheckRouteArgs({this.key, required this.checkUrl});

  final Key? key;

  final String checkUrl;

  @override
  String toString() {
    return 'PaymentCheckRouteArgs{key: $key, checkUrl: $checkUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PaymentCheckRouteArgs) return false;
    return key == other.key && checkUrl == other.checkUrl;
  }

  @override
  int get hashCode => key.hashCode ^ checkUrl.hashCode;
}

/// generated route for
/// [PaymentsPage]
class PaymentsRoute extends PageRouteInfo<void> {
  const PaymentsRoute({List<PageRouteInfo>? children})
      : super(PaymentsRoute.name, initialChildren: children);

  static const String name = 'PaymentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaymentsPage();
    },
  );
}

/// generated route for
/// [PrayersDetailPage]
class PrayersDetailRoute extends PageRouteInfo<PrayersDetailRouteArgs> {
  PrayersDetailRoute({Key? key, required int id, List<PageRouteInfo>? children})
      : super(
          PrayersDetailRoute.name,
          args: PrayersDetailRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'PrayersDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrayersDetailRouteArgs>();
      return PrayersDetailPage(key: args.key, id: args.id);
    },
  );
}

class PrayersDetailRouteArgs {
  const PrayersDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'PrayersDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PrayersDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [PrayersPage]
class PrayersRoute extends PageRouteInfo<PrayersRouteArgs> {
  PrayersRoute({Key? key, String? type, List<PageRouteInfo>? children})
      : super(
          PrayersRoute.name,
          args: PrayersRouteArgs(key: key, type: type),
          initialChildren: children,
        );

  static const String name = 'PrayersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrayersRouteArgs>(
        orElse: () => const PrayersRouteArgs(),
      );
      return PrayersPage(key: args.key, type: args.type);
    },
  );
}

class PrayersRouteArgs {
  const PrayersRouteArgs({this.key, this.type});

  final Key? key;

  final String? type;

  @override
  String toString() {
    return 'PrayersRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PrayersRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [ProfileCardsPage]
class ProfileCardsRoute extends PageRouteInfo<void> {
  const ProfileCardsRoute({List<PageRouteInfo>? children})
      : super(ProfileCardsRoute.name, initialChildren: children);

  static const String name = 'ProfileCardsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileCardsPage();
    },
  );
}

/// generated route for
/// [ProfileInfoPage]
class ProfileInfoRoute extends PageRouteInfo<ProfileInfoRouteArgs> {
  ProfileInfoRoute({
    Key? key,
    required UserDto userDTO,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileInfoRoute.name,
          args: ProfileInfoRouteArgs(key: key, userDTO: userDTO),
          initialChildren: children,
        );

  static const String name = 'ProfileInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileInfoRouteArgs>();
      return WrappedRoute(
        child: ProfileInfoPage(key: args.key, userDTO: args.userDTO),
      );
    },
  );
}

class ProfileInfoRouteArgs {
  const ProfileInfoRouteArgs({this.key, required this.userDTO});

  final Key? key;

  final UserDto userDTO;

  @override
  String toString() {
    return 'ProfileInfoRouteArgs{key: $key, userDTO: $userDTO}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileInfoRouteArgs) return false;
    return key == other.key && userDTO == other.userDTO;
  }

  @override
  int get hashCode => key.hashCode ^ userDTO.hashCode;
}

/// generated route for
/// [ProfileMainPage]
class ProfileMainRoute extends PageRouteInfo<void> {
  const ProfileMainRoute({List<PageRouteInfo>? children})
      : super(ProfileMainRoute.name, initialChildren: children);

  static const String name = 'ProfileMainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileMainPage();
    },
  );
}

/// generated route for
/// [ProfileNotificationPage]
class ProfileNotificationRoute extends PageRouteInfo<void> {
  const ProfileNotificationRoute({List<PageRouteInfo>? children})
      : super(ProfileNotificationRoute.name, initialChildren: children);

  static const String name = 'ProfileNotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileNotificationPage();
    },
  );
}

/// generated route for
/// [QiblahPage]
class QiblahRoute extends PageRouteInfo<void> {
  const QiblahRoute({List<PageRouteInfo>? children})
      : super(QiblahRoute.name, initialChildren: children);

  static const String name = 'QiblahRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QiblahPage();
    },
  );
}

/// generated route for
/// [QrScannerPage]
class QrScannerRoute extends PageRouteInfo<void> {
  const QrScannerRoute({List<PageRouteInfo>? children})
      : super(QrScannerRoute.name, initialChildren: children);

  static const String name = 'QrScannerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QrScannerPage();
    },
  );
}

/// generated route for
/// [QuestionPage]
class QuestionRoute extends PageRouteInfo<void> {
  const QuestionRoute({List<PageRouteInfo>? children})
      : super(QuestionRoute.name, initialChildren: children);

  static const String name = 'QuestionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QuestionPage();
    },
  );
}

/// generated route for
/// [RamazanChecklistPage]
class RamazanChecklistRoute extends PageRouteInfo<RamazanChecklistRouteArgs> {
  RamazanChecklistRoute({
    Key? key,
    required CheckListDto checkList,
    List<PageRouteInfo>? children,
  }) : super(
          RamazanChecklistRoute.name,
          args: RamazanChecklistRouteArgs(key: key, checkList: checkList),
          initialChildren: children,
        );

  static const String name = 'RamazanChecklistRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RamazanChecklistRouteArgs>();
      return RamazanChecklistPage(key: args.key, checkList: args.checkList);
    },
  );
}

class RamazanChecklistRouteArgs {
  const RamazanChecklistRouteArgs({this.key, required this.checkList});

  final Key? key;

  final CheckListDto checkList;

  @override
  String toString() {
    return 'RamazanChecklistRouteArgs{key: $key, checkList: $checkList}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RamazanChecklistRouteArgs) return false;
    return key == other.key && checkList == other.checkList;
  }

  @override
  int get hashCode => key.hashCode ^ checkList.hashCode;
}

/// generated route for
/// [RegistrationScope]
class RegistrationFlow extends PageRouteInfo<void> {
  const RegistrationFlow({List<PageRouteInfo>? children})
      : super(RegistrationFlow.name, initialChildren: children);

  static const String name = 'RegistrationFlow';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegistrationScope();
    },
  );
}

/// generated route for
/// [RegistrationTab]
class RegistrationTabRoute extends PageRouteInfo<void> {
  const RegistrationTabRoute({List<PageRouteInfo>? children})
      : super(RegistrationTabRoute.name, initialChildren: children);

  static const String name = 'RegistrationTabRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const RegistrationTab());
    },
  );
}

/// generated route for
/// [SavedTusZhoruPage]
class SavedTusZhoruRoute extends PageRouteInfo<void> {
  const SavedTusZhoruRoute({List<PageRouteInfo>? children})
      : super(SavedTusZhoruRoute.name, initialChildren: children);

  static const String name = 'SavedTusZhoruRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SavedTusZhoruPage();
    },
  );
}

/// generated route for
/// [SeminarDetailPage]
class SeminarDetailRoute extends PageRouteInfo<SeminarDetailRouteArgs> {
  SeminarDetailRoute({
    Key? key,
    String? search,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          SeminarDetailRoute.name,
          args: SeminarDetailRouteArgs(key: key, search: search, id: id),
          initialChildren: children,
        );

  static const String name = 'SeminarDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeminarDetailRouteArgs>();
      return SeminarDetailPage(key: args.key, search: args.search, id: args.id);
    },
  );
}

class SeminarDetailRouteArgs {
  const SeminarDetailRouteArgs({this.key, this.search, required this.id});

  final Key? key;

  final String? search;

  final int id;

  @override
  String toString() {
    return 'SeminarDetailRouteArgs{key: $key, search: $search, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeminarDetailRouteArgs) return false;
    return key == other.key && search == other.search && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ search.hashCode ^ id.hashCode;
}

/// generated route for
/// [SeminarPage]
class SeminarRoute extends PageRouteInfo<SeminarRouteArgs> {
  SeminarRoute({Key? key, String? type, List<PageRouteInfo>? children})
      : super(
          SeminarRoute.name,
          args: SeminarRouteArgs(key: key, type: type),
          initialChildren: children,
        );

  static const String name = 'SeminarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SeminarRouteArgs>(
        orElse: () => const SeminarRouteArgs(),
      );
      return SeminarPage(key: args.key, type: args.type);
    },
  );
}

class SeminarRouteArgs {
  const SeminarRouteArgs({this.key, this.type});

  final Key? key;

  final String? type;

  @override
  String toString() {
    return 'SeminarRouteArgs{key: $key, type: $type}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SeminarRouteArgs) return false;
    return key == other.key && type == other.type;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}

/// generated route for
/// [ServicesPage]
class ServicesRoute extends PageRouteInfo<void> {
  const ServicesRoute({List<PageRouteInfo>? children})
      : super(ServicesRoute.name, initialChildren: children);

  static const String name = 'ServicesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ServicesPage();
    },
  );
}

/// generated route for
/// [ShopPage]
class ShopRoute extends PageRouteInfo<void> {
  const ShopRoute({List<PageRouteInfo>? children})
      : super(ShopRoute.name, initialChildren: children);

  static const String name = 'ShopRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ShopPage();
    },
  );
}

/// generated route for
/// [SurahDetailPage]
class SurahDetailRoute extends PageRouteInfo<SurahDetailRouteArgs> {
  SurahDetailRoute({
    Key? key,
    required ResultTeachingDTO result,
    List<PageRouteInfo>? children,
  }) : super(
          SurahDetailRoute.name,
          args: SurahDetailRouteArgs(key: key, result: result),
          initialChildren: children,
        );

  static const String name = 'SurahDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SurahDetailRouteArgs>();
      return SurahDetailPage(key: args.key, result: args.result);
    },
  );
}

class SurahDetailRouteArgs {
  const SurahDetailRouteArgs({this.key, required this.result});

  final Key? key;

  final ResultTeachingDTO result;

  @override
  String toString() {
    return 'SurahDetailRouteArgs{key: $key, result: $result}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SurahDetailRouteArgs) return false;
    return key == other.key && result == other.result;
  }

  @override
  int get hashCode => key.hashCode ^ result.hashCode;
}

/// generated route for
/// [SurahPage]
class SurahRoute extends PageRouteInfo<void> {
  const SurahRoute({List<PageRouteInfo>? children})
      : super(SurahRoute.name, initialChildren: children);

  static const String name = 'SurahRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SurahPage();
    },
  );
}

/// generated route for
/// [TandaulilarMainPage]
class TandaulilarMainRouterPage extends PageRouteInfo<void> {
  const TandaulilarMainRouterPage({List<PageRouteInfo>? children})
      : super(TandaulilarMainRouterPage.name, initialChildren: children);

  static const String name = 'TandaulilarMainRouterPage';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TandaulilarMainPage();
    },
  );
}

/// generated route for
/// [TechnicalSupportPage]
class TechnicalSupportRoute extends PageRouteInfo<void> {
  const TechnicalSupportRoute({List<PageRouteInfo>? children})
      : super(TechnicalSupportRoute.name, initialChildren: children);

  static const String name = 'TechnicalSupportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TechnicalSupportPage();
    },
  );
}

/// generated route for
/// [TusZhoruDetailPage]
class TusZhoruDetailRoute extends PageRouteInfo<TusZhoruDetailRouteArgs> {
  TusZhoruDetailRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          TusZhoruDetailRoute.name,
          args: TusZhoruDetailRouteArgs(key: key, id: id),
          initialChildren: children,
        );

  static const String name = 'TusZhoruDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TusZhoruDetailRouteArgs>();
      return TusZhoruDetailPage(key: args.key, id: args.id);
    },
  );
}

class TusZhoruDetailRouteArgs {
  const TusZhoruDetailRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'TusZhoruDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TusZhoruDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [TusZhoruPage]
class TusZhoruRouterPage extends PageRouteInfo<void> {
  const TusZhoruRouterPage({List<PageRouteInfo>? children})
      : super(TusZhoruRouterPage.name, initialChildren: children);

  static const String name = 'TusZhoruRouterPage';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TusZhoruPage();
    },
  );
}

/// generated route for
/// [UstazAitinizhiPage]
class UstazAitinizhiRoute extends PageRouteInfo<void> {
  const UstazAitinizhiRoute({List<PageRouteInfo>? children})
      : super(UstazAitinizhiRoute.name, initialChildren: children);

  static const String name = 'UstazAitinizhiRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UstazAitinizhiPage();
    },
  );
}

/// generated route for
/// [WudhuPage]
class WudhuRoute extends PageRouteInfo<WudhuRouteArgs> {
  WudhuRoute({
    Key? key,
    required List<NamazDTO> wudhu,
    List<PageRouteInfo>? children,
  }) : super(
          WudhuRoute.name,
          args: WudhuRouteArgs(key: key, wudhu: wudhu),
          initialChildren: children,
        );

  static const String name = 'WudhuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WudhuRouteArgs>();
      return WudhuPage(key: args.key, wudhu: args.wudhu);
    },
  );
}

class WudhuRouteArgs {
  const WudhuRouteArgs({this.key, required this.wudhu});

  final Key? key;

  final List<NamazDTO> wudhu;

  @override
  String toString() {
    return 'WudhuRouteArgs{key: $key, wudhu: $wudhu}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WudhuRouteArgs) return false;
    return key == other.key && const ListEquality().equals(wudhu, other.wudhu);
  }

  @override
  int get hashCode => key.hashCode ^ const ListEquality().hash(wudhu);
}

/// generated route for
/// [ZhosparymPage]
class ZhosparymMainRouterPage extends PageRouteInfo<void> {
  const ZhosparymMainRouterPage({List<PageRouteInfo>? children})
      : super(ZhosparymMainRouterPage.name, initialChildren: children);

  static const String name = 'ZhosparymMainRouterPage';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ZhosparymPage();
    },
  );
}
