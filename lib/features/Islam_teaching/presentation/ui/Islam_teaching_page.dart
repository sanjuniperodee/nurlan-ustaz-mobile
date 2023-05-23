import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class IslamTeachingPage extends StatefulWidget {
  const IslamTeachingPage({super.key});

  @override
  State<IslamTeachingPage> createState() => _IslamTeachingPageState();
}

class _IslamTeachingPageState extends State<IslamTeachingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 1.1.sh,
          child: Stack(children: []),
        ),
      ),
    );
  }
}
