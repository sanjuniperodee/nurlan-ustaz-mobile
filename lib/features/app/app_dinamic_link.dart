import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/services.dart';

class DynamicLink {
  /// When Firebase Dynamic Links is not available (e.g. on web), returns the
  /// long link so payment/share flows still work.
  static String _fallbackLink(String path) =>
      'https://nurlanustazflutter.page.link$path';

  Future<String> createTusZhoruLink(int id) async {
    final path = '/tusZhoru?type=tusZhoru&id=$id';
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse('https://nurlanustazflutter.page.link$path'),
        uriPrefix: "https://nurlanustazflutter.page.link",
        androidParameters:
            const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
        iosParameters: const IOSParameters(
          bundleId: "com.nurlan.ustaz.flutter",
          appStoreId: '6451202657',
        ),
      );
      final dynamicLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParams);
      return dynamicLink.shortUrl.toString();
    } on MissingPluginException {
      return _fallbackLink(path);
    }
  }

  Future<String> createCustomTusZhoruLink(int id) async {
    final path = '/tusZhoru?type=customTusZhoru&id=$id';
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse('https://nurlanustazflutter.page.link$path'),
        uriPrefix: "https://nurlanustazflutter.page.link",
        androidParameters:
            const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
        iosParameters: const IOSParameters(
            bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6451202657'),
      );
      final dynamicLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParams);
      return dynamicLink.shortUrl.toString();
    } on MissingPluginException {
      return _fallbackLink(path);
    }
  }

  Future<String> createSeminarLink(int id) async {
    final path = '/seminar?type=seminar&id=$id';
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse('https://nurlanustazflutter.page.link$path'),
        uriPrefix: "https://nurlanustazflutter.page.link",
        androidParameters:
            const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
        iosParameters: const IOSParameters(
            bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6451202657'),
      );
      final dynamicLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParams);
      return dynamicLink.shortUrl.toString();
    } on MissingPluginException {
      return _fallbackLink(path);
    }
  }

  Future<String> createDuhasLink(int id) async {
    final path = '/duas?type=duas&id=$id';
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse('https://nurlanustazflutter.page.link$path'),
        uriPrefix: "https://nurlanustazflutter.page.link",
        androidParameters:
            const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
        iosParameters: const IOSParameters(
            bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6451202657'),
      );
      final dynamicLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParams);
      return dynamicLink.shortUrl.toString();
    } on MissingPluginException {
      return _fallbackLink(path);
    }
  }

  Future<String> createNamesLink(int id) async {
    final path = '/muslim_names?type=muslim_names&id=$id';
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse('https://nurlanustazflutter.page.link$path'),
        uriPrefix: "https://nurlanustazflutter.page.link",
        androidParameters:
            const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
        iosParameters: const IOSParameters(
            bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6451202657'),
      );
      final dynamicLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParams);
      return dynamicLink.shortUrl.toString();
    } on MissingPluginException {
      return _fallbackLink(path);
    }
  }

  Future<String> createNewsLink(int id) async {
    final path = '/news?type=news&id=$id';
    try {
      final dynamicLinkParams = DynamicLinkParameters(
        link: Uri.parse('https://nurlanustazflutter.page.link$path'),
        uriPrefix: "https://nurlanustazflutter.page.link",
        androidParameters:
            const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
        iosParameters: const IOSParameters(
            bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6451202657'),
      );
      final dynamicLink = await FirebaseDynamicLinks.instance
          .buildShortLink(dynamicLinkParams);
      return dynamicLink.shortUrl.toString();
    } on MissingPluginException {
      return _fallbackLink(path);
    }
  }
}
