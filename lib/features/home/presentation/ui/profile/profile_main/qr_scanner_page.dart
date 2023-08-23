import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/bloc/qr_scanner_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPage();
}

class _QrScannerPage extends State<QrScannerPage> {
  bool _switchValue = false;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  Future<void> _requestCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
    } else {
      if (await Permission.camera.isDenied) {
        await Permission.camera.request();
      } else {
        await openAppSettings();
      }
    }
  }

  @override
  void initState() {
    _requestCameraPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QrScannerCubit, QrScannerState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loadedState: (message) {
            buildSuccessCustomSnackBar(context, message);
          },
          errorState: (message) {
            buildErrorCustomSnackBar(context, message);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(orElse: () {
          return Container();
        }, loadingState: () {
          return Scaffold(
            backgroundColor: AppColors.background1,
            body: SizedBox(
              height: 1.1.sh,
              child: const GlobalCustomBody(
                  child: Center(
                child: CircularProgressIndicator.adaptive(),
              )),
            ),
          );
        }, initialState: () {
          return Scaffold(
            backgroundColor: AppColors.background1,
            body: SizedBox(
              height: 1.1.sh,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CustomAppBar(
                        title: 'QR.qr_scanner'.tr(),
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Container(
                        height: 500.h,
                        width: double.infinity,
                        child: _buildQrView(context)),
                    SizedBox(
                      height: 30.h,
                    ),
                    IconButton(
                        onPressed: () async {
                          Future<bool?>? isFlash = controller?.getFlashStatus();
                          bool? resolvedBoolValue = await isFlash;
                          log(resolvedBoolValue.toString());
                          log(_switchValue.toString());
                          _switchValue = !_switchValue;
                          controller?.toggleFlash();
                          setState(() {});
                        },
                        icon: AnimatedCrossFade(
                          firstChild: const Icon(
                            Icons.flashlight_on,
                            color: AppColors.white,
                          ),
                          secondChild: const Icon(
                            Icons.flashlight_off,
                            color: AppColors.white,
                          ),
                          crossFadeState: _switchValue == true
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: Duration(milliseconds: 100),
                        )),
                  ]),
            ),
          );
        });
      },
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 300.0
        : 300.0;
    return QRView(
      cameraFacing: CameraFacing.back,
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: AppColors.blue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      if (!scanData.code
          .toString()
          .contains('https://dev.nurlanustaz.kz/api/banner/use-ticket')) {
        buildErrorCustomSnackBar(context, 'QR.qr_error_url'.tr());
      } else {
        controller.pauseCamera();
        context
            .read<QrScannerCubit>()
            .checkTicket(url: scanData.code.toString());
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('QR.qr_permission'.tr())),
      );
      Permission.camera;
    }
  }
}
