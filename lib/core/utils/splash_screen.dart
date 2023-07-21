import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: 375,
        height: 812,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFF6771F3)),
        child: Stack(
          children: [
            Positioned(
              left: -146.70,
              top: -139.19,
              child: Container(
                width: 570.73,
                height: 405.12,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 142.67,
                      child: Transform(
                        transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.46),
                        child: Container(
                          width: 320.01,
                          height: 293.20,
                          decoration: ShapeDecoration(
                            color: Color(0xFF1151C2),
                            shape: OvalBorder(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 250.71,
                      top: 81.19,
                      child: Container(
                        width: 320.01,
                        height: 274.72,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.87, -0.49),
                            end: Alignment(-0.87, 0.49),
                            colors: [Color(0xFF2E58F5), Color(0xFFA58AF7)],
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 191.70,
                      top: 100.77,
                      child: Container(
                        width: 277,
                        height: 160.42,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.62, -0.79),
                            end: Alignment(-0.62, 0.79),
                            colors: [Color(0xFF2941F4), Color(0xFF4E5BF3)],
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: 38,
                padding: const EdgeInsets.only(
                  top: 17.17,
                  left: 33.45,
                  right: 14.67,
                  bottom: 9.33,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 231.79),
                    Container(
                      width: 66.66,
                      height: 11.34,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 42.33,
                            top: 0,
                            child: Container(
                              width: 24.33,
                              height: 11.33,
                              child: Stack(children: [

                                  ]),
                            ),
                          ),
                          Positioned(
                            left: 22.03,
                            top: 0,
                            child: Container(
                              width: 15.27,
                              height: 10.97,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/15x11"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0.34,
                            child: Container(
                              width: 17,
                              height: 10.67,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/17x11"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 229.16,
              top: 207.96,
              child: Transform(
                transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(2.58),
                child: Container(
                  width: 74.94,
                  height: 74.28,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                ),
              ),
            ),
            Positioned(left: 16, top: 74, child: Container()),
            Positioned(
              left: 69,
              top: 374,
              child: Container(
                width: 237,
                height: 64,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/237x64"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
