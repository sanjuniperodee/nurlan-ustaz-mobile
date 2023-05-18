import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/common/app_styles.dart';
import '../../core/common/colors.dart';
import '../app/presentation/widgets/global_appbar_widget.dart';

class TusZhoruPage extends StatefulWidget {
  const TusZhoruPage({Key? key}) : super(key: key);

  @override
  State<TusZhoruPage> createState() => _TusZhoruPageState();
}

class _TusZhoruPageState extends State<TusZhoruPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F8FF),
      body: SingleChildScrollView(
          child: SizedBox(
            // height: 1.h,
            child: Stack(children: [
              const GlobalAppBar(),
              Column(
                children: [
                  Positioned(
                      top: 80.h,
                      left: 16.r,
                      right: 16.r,
                      child: Text(
                        'Түс жору',
                        textAlign: TextAlign.center,
                        style:
                        getTextStyle(CustomTextStyles.s36w700).apply(fontFamily: FontTypes.Philosopher.name).apply(color: AppColors.white),
                      )),
                ],
              )
            ]),
          )),
    );
  }
}
