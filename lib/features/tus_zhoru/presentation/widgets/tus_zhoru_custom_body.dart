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
          Positioned.fill(
            child: Container(
                child: Lottie.asset(
                    'assets/animations/tus_zhoru_background.json',fit: BoxFit.fill)),
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
