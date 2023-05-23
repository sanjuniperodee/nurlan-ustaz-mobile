import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahWidget extends StatefulWidget {
  const QiblahWidget({super.key});

  @override
  State<QiblahWidget> createState() => _QiblahWidgetState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahWidgetState extends State<QiblahWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 48, 48, 48),
        body: StreamBuilder(
          stream: FlutterQiblah.qiblahStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ));
            }

            final qiblahDirection = snapshot.data;
            animation = Tween(
                    begin: begin,
                    end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                .animate(_animationController!);
            begin = (qiblahDirection.qiblah * (pi / 180) * -1);
            _animationController!.forward(from: 0);

            return Scaffold(
              body: SizedBox(
                height: 1.1.sh,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          const Color(0xFF1151C2).withOpacity(0.9),
                          const Color(0xFF8F8CF7).withOpacity(0.9),
                        ],
                      )),
                    ),
                    Positioned(
                        top: 48.h,
                        left: 16.r,
                        right: 16.r,
                        child: SizedBox(
                          height: 1.sh,
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomAppBar(
                                title: 'Құбыла',
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                    height: 300,
                                    child: AnimatedBuilder(
                                      animation: animation!,
                                      builder: (context, child) =>
                                          Transform.rotate(
                                              angle: animation!.value,
                                              child: SvgPicture.asset(
                                                  'assets/icons/qibla.svg')),
                                    )),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: SvgPicture.asset(
                                      'assets/icons/build.svg'))
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
