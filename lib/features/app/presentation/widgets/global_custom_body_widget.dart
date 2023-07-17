import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

class GlobalCustomBody extends StatefulWidget {
  const GlobalCustomBody({Key? key, this.right, this.left, this.child})
      : super(key: key);
  final double? right;
  final double? left;
  final Widget? child;

  @override
  State<GlobalCustomBody> createState() => _GlobalCustomBodyState();
}

class _GlobalCustomBodyState extends State<GlobalCustomBody>
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
            left: 200.r,
            top: 10.r,
            child: AnimatedBuilder(
              animation: _controller,
              child: SvgPicture.asset(
                Assets.oyuSvg,
                height: 210,
                width: 210,
              ),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * 3.14,
                  child: child,
                );
              },
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
