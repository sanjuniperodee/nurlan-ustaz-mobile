import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';

class GlobalCustomBody extends StatefulWidget {
  const GlobalCustomBody({
    super.key,
    this.padding = const EdgeInsets.only(
      top: 60,
      left: 16,
      right: 16,
      bottom: 0,
    ),
    this.topGradientOffset,
    this.topOrnamentOffset,
    this.child,
  });

  @protected
  final EdgeInsets padding;

  @protected
  final Widget? child;

  @protected
  final double? topGradientOffset;

  @protected
  final double? topOrnamentOffset;

  @override
  State<GlobalCustomBody> createState() => _GlobalCustomBodyState();
}

class _GlobalCustomBodyState extends State<GlobalCustomBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(minutes: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      child: Stack(
        children: [
          Positioned(
            top: widget.topGradientOffset,
            left: 0,
            right: 0,
            child: Image.asset(
              Assets.gradient,
            ),
          ),
          Positioned(
            top: widget.topOrnamentOffset,
            left: 185.r,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Colors.transparent, Colors.red],
                ).createShader(Rect.fromLTRB(0, 12, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: AnimatedBuilder(
                animation: _controller,
                child: SvgPicture.asset(
                  Assets.oyuSvg,
                  height: 210.r,
                  width: 210.r,
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.4 * 3.04,
                    child: child!,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: widget.padding.r,
            child: widget.child ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
