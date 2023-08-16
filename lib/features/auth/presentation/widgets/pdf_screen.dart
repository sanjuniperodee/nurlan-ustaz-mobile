import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyPdfViewer extends StatefulWidget {
  const MyPdfViewer({
    super.key,
  });
  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('agree3'.tr()),
        ),
        body: SfPdfViewer.asset('assets/PDF.pdf'));
  }
}
