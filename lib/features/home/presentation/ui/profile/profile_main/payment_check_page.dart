import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class PaymentCheckPage extends StatefulWidget {
  const PaymentCheckPage({super.key, required this.checkUrl});
  final String checkUrl;

  @override
  State<PaymentCheckPage> createState() => _PaymentCheckPageState();
}

class _PaymentCheckPageState extends State<PaymentCheckPage> {
  final controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.checkUrl));
  }

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(widget.checkUrl);
    log(uri.toString());
    return Scaffold(
      body: GlobalCustomBody(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'salam',
              ),
              SizedBox(
                width: double.infinity,
                height: 500.h,
                child: WebViewWidget(
                  controller: controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
