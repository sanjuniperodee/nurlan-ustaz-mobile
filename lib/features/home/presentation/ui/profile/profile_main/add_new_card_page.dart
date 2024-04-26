
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/bloc/cards_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../core/common/colors.dart';

@RoutePage()
class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key, required this.addCardUrl}) : super(key: key);
  final String addCardUrl;

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

late WebViewController controller;

class _AddNewCardPageState extends State<AddNewCardPage> {
  @override
  Widget build(BuildContext context) {
    print('ssilka2-${widget.addCardUrl}');
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<CardsCubit>(context).getCardList();
        return true;
      },
      child: Scaffold(
        
          appBar: AppBar(
          title: Text(
            'add_card_title'.tr(),
            style:
                getTextStyle(CustomTextStyles.s20w700, color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: AppColors.gradientPrimaryActiveButton
                    .colors, // Specify your gradient colors
              ),
            ),
          ),
        ),
          body: Padding(
            padding:    Platform.isIOS ?  const EdgeInsets.only(bottom:30).r : EdgeInsets.zero,
            child: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  controller.loadUrl(widget.addCardUrl);
                },
                allowsInlineMediaPlayback: true,
                initialUrl: Uri.parse(widget.addCardUrl).toString(),
              ),
            ),
          )),
    );
  }
}
