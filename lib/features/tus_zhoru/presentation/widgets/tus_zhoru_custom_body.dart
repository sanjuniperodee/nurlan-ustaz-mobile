import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

import '../../../../core/common/colors.dart';

class TusZhoruCustomBody extends StatefulWidget {
  const TusZhoruCustomBody({Key? key, this.right, this.left, this.child})
      : super(key: key);
  final double? right;
  final double? left;
  final Widget? child;

  @override
  State<TusZhoruCustomBody> createState() => _TusZhoruCustomBodyState();
}

class _TusZhoruCustomBodyState extends State<TusZhoruCustomBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.sh,
      child: Stack(
        children: [

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.white.withOpacity(0.0000000000000001),
                  Color(0xFFECF5FF).withOpacity(0.9) //Color(0xFFECF5FF),

                  //Color(0xFFECF5FF),
                ],
              ),
            ),
            child: Image.asset(
              Assets.gradient,
              fit: BoxFit.cover,
            ),
          ),
          Lottie.asset('assets/tus_zhoru.json',
              height: 200,width: 500),


          Positioned(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    AppColors.white.withOpacity(0.0000000000000001),
                    Color(0xFECF5FF)//Color(0xFFECF5FF),

                    //Color(0xFFECF5FF),


                  ],
                  stops: [
                    0.8,0.2
                  ]
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(),
                blendMode: BlendMode.overlay,
                child:
                  Image.asset(
                    // color: AppColors.gradientPrimaryActiveButton.colors.first,
                    fit:BoxFit.fill,
                    'assets/images/tus_zhoru_list_background.png',
                    height: 375.h,
                    width: 500.w,
                      colorBlendMode: BlendMode.overlay,
                    filterQuality: FilterQuality.high,
                    ),

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                    top: 40, left: widget.left ?? 16, right: widget.right ?? 16)
                .r,
            child: widget.child ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
