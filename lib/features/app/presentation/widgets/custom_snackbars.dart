import 'package:dry_bloc/dry_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';

extension SnackBarExtension on BuildContext {
  Future<SnackBarClosedReason> showSuccessSnackBar(String message) {
    return buildSuccessCustomSnackBar(this, message);
  }

  Future<SnackBarClosedReason> showErrorSnackBar(String message) {
    return buildErrorCustomSnackBar(this, message);
  }

  Future<SnackBarClosedReason> showExceptionErrorSnackBar(
    DryBlocException exc, [
    String? defaultMessage,
  ]) {
    final def = defaultMessage ?? 'error.information_passed_to_developers'.tr();
    return buildErrorCustomSnackBar(
      this,
      exc.maybeWhen(
        fatal: (error) {
          if (error is! ServerException) return def;
          return error.maybeWhenServerException(
            orElse: (_, __) => 'error.server'.tr(),
            client: (message, statusCode) => message,
          );
        },
        orElse: (_) => def,
      ),
    );
  }
}

Future<SnackBarClosedReason> buildSuccessCustomSnackBar(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color.fromARGB(255, 204, 241, 220),
        ),
      )
      .closed;
}

Future<SnackBarClosedReason> buildErrorCustomSnackBar(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color.fromARGB(255, 236, 120, 118),
        ),
      )
      .closed;
}

// buildErrorCustomSnackBar

// ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
//     buildErrorCustomSnackBar(BuildContext context, String message) {
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       elevation: 6.0,
//       behavior: SnackBarBehavior.floating,
//       content: Text(
//         message,
//         textAlign: TextAlign.center,
//       ),
//       backgroundColor: Colors.red,
//     ),
//   );
// }

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildIconSnackBar(
  BuildContext context,
  String message,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
      elevation: 6.0,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      backgroundColor: const Color(0xff00BA88),
    ),
  );
}

ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
    buildTopSnack(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      content: Row(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),

      // leading: const Icon(Icons.info),
      // padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
      backgroundColor: const Color(0xff00BA88),
      actions: [
        TextButton(
          child: const Text('Dismiss'),
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        ),
      ],
    ),
  );
}
