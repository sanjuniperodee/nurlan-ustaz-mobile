import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../app/presentation/widgets/custom_app_bar.dart';
@RoutePage()
class PaymentCheckPage extends StatelessWidget {
  const PaymentCheckPage({Key? key, required this.checkUrl}) : super(key: key);
  final String checkUrl;

  @override
  Widget build(BuildContext context) {
    final  uri = Uri.parse(checkUrl);
    log(uri.toString());
    return Scaffold(
      body: GlobalCustomBody(
        child: SingleChildScrollView(
          child: Column(

            children: [
              CustomAppBar(title: 'salam',),
              Container(
                width: double.infinity,
                height: 500.h,
                child: WebView(
                  initialUrl: uri.toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebResourceError: (error) {
                    print('Error: ${error.description}');
                  },

                  onWebViewCreated: (WebViewController controller){
                    controller.loadUrl(uri.toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
