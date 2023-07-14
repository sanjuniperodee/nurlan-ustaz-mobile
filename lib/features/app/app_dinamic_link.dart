import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLink {
  Future<String> createTusZhoruLink(int id) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(
          'https://nurlanustazflutter.page.link/tusZhoru?type=tusZhoru&id=$id'), //Uri.parse("https://nefuptown.kz/news?type=news&id=$id"),
      uriPrefix: "https://nurlanustazflutter.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
      iosParameters: const IOSParameters(
          bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6450172719'),
    );
    ShortDynamicLink dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }

  Future<String> createCustomTusZhoruLink(int id) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(
          'https://nurlanustazflutter.page.link/tusZhoru?type=customTusZhoru&id=$id'), //Uri.parse("https://nefuptown.kz/news?type=news&id=$id"),
      uriPrefix: "https://nurlanustazflutter.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
      iosParameters: const IOSParameters(
          bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6450172719'),
    );
    ShortDynamicLink dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }

  Future<String> createSeminarLink(int id) async {
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(
          'https://nurlanustazflutter.page.link/seminar?type=seminar&id=$id'), //Uri.parse("https://nefuptown.kz/news?type=news&id=$id"),
      uriPrefix: "https://nurlanustazflutter.page.link",
      androidParameters:
          const AndroidParameters(packageName: "com.nurlan_ustaz_flutter"),
      iosParameters: const IOSParameters(
          bundleId: "com.nurlan.ustaz.flutter", appStoreId: '6450172719'),
    );
    ShortDynamicLink dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);

    return dynamicLink.shortUrl.toString();
  }
}
