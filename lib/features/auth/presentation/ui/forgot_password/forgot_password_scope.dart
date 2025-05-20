import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/auth/presentation/bloc/forgot_password/get_user_id_by_email_bloc.dart';

@RoutePage(name: 'ForgotPasswordFlow')
class ForgotPasswordScope extends AutoRouter {
  const ForgotPasswordScope({super.key});

  @override
  Widget Function(BuildContext context, Widget content)? get builder {
    return (context, content) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetUserIdByEmailBloc(authRemoteDs: GetIt.I()),
          ),
          //
          BlocListener<GetUserIdByEmailBloc, GetUserIdByEmailState>(
            listenWhen: (previous, current) => current.isFailure,
            listener: (context, state) {
              return state.maybeWhen(
                failure: context.showExceptionErrorSnackBar,
                orElse: (e) {},
              );
            },
          )
        ],
        child: content,
      );
    };
  }
}
