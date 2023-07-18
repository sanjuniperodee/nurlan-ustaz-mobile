import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

import '../../../../core/common/colors.dart';

class TusZhoruDetailBody extends StatefulWidget {
  const TusZhoruDetailBody({Key? key, this.right, this.left, this.child})
      : super(key: key);
  final double? right;
  final double? left;
  final Widget? child;

  @override
  State<TusZhoruDetailBody> createState() => _TusZhoruDetailBodyState();
}

class _TusZhoruDetailBodyState extends State<TusZhoruDetailBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(duration: Duration(seconds: 20), vsync: this)
    ..repeat();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      child: Stack(
        children: [
          Image.asset(
            Assets.gradient,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Opacity(
              opacity: 1,
              child: BackdropFilter(
                filter: ImageFilter.blur(),
                blendMode: BlendMode.overlay,
                child: Image.asset(
                  color: AppColors.blue,
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
