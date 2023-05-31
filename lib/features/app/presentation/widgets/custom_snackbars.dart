import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> buildSuccessCustomSnackBar(BuildContext context, String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: const Color.fromARGB(255, 204, 241, 220),
    textColor: Colors.black,
    fontSize: 16.0,
  );
}

Future<bool?> buildErrorCustomSnackBar(BuildContext context, String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: const Color.fromARGB(255, 236, 120, 118),
    textColor: Colors.white,
    fontSize: 16.0,
  );
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
