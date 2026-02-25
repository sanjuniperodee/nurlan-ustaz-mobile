import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/bloc/cards_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/common/colors.dart';

@RoutePage()
class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key, required this.addCardUrl});
  final String addCardUrl;

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      final controller = WebViewController();
      controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.addCardUrl));
      _controller = controller;
    }
  }

  Future<void> _openAddCardInBrowser() async {
    final uri = Uri.parse(widget.addCardUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && context.mounted) {
          BlocProvider.of<CardsCubit>(context).getCardList();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'add_card_title'.tr(),
            style: getTextStyle(CustomTextStyles.s20w700,
                color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: AppColors.gradientPrimaryActiveButton.colors,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: !kIsWeb && isIOS
              ? const EdgeInsets.only(bottom: 30).r
              : EdgeInsets.zero,
          child: kIsWeb
              ? _WebAddCardBody(
                  addCardUrl: widget.addCardUrl,
                  onOpenInBrowser: _openAddCardInBrowser,
                )
              : SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: WebViewWidget(controller: _controller!),
                ),
        ),
      ),
    );
  }
}

/// On web, WebView is not supported; open the URL in browser instead.
class _WebAddCardBody extends StatelessWidget {
  const _WebAddCardBody({
    required this.addCardUrl,
    required this.onOpenInBrowser,
  });

  final String addCardUrl;
  final VoidCallback onOpenInBrowser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'add_card_web_hint'.tr(),
              style: getTextStyle(CustomTextStyles.s14w400),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: onOpenInBrowser,
              child: Text('add_card_web_button'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
