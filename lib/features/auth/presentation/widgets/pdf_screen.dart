import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/common/colors.dart';


class MyPdfViewer extends StatefulWidget {
  const MyPdfViewer({
    super.key,
    required this.assetPdf,
    required this.title,
  });

  final String title;
  final String assetPdf;

  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style:
                getTextStyle(CustomTextStyles.s20w700, color: AppColors.white),
            textAlign: TextAlign.center,
          ),
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
        body: SfPdfViewer.asset('assets/${widget.assetPdf}'));
  }
}
