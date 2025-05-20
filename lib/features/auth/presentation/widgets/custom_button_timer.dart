import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';

class CustomAppButtonTimer extends StatefulWidget {
  const CustomAppButtonTimer({
    super.key,
    required this.onTap,
    required this.text,
    this.isLoading = false,
    this.timeoutSeconds = 15,
    this.launchOnInit = true,
  });

  final String text;
  final bool isLoading;
  final int timeoutSeconds;
  final bool launchOnInit;

  /// true - relaunch timer. false - don't
  final Future<bool> Function() onTap;

  @override
  State<CustomAppButtonTimer> createState() => _CustomAppButtonTimerState();
}

class _CustomAppButtonTimerState extends State<CustomAppButtonTimer> {
  late final _TimerNotifier timerNotifier;

  @override
  void initState() {
    timerNotifier = _TimerNotifier(
      widget.launchOnInit ? widget.timeoutSeconds : null,
      timeoutSeconds: widget.timeoutSeconds,
    );

    if (widget.launchOnInit) timerNotifier.launch();
    super.initState();
  }

  @override
  void dispose() {
    timerNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: timerNotifier,
      builder: (context, value, child) {
        final isRunning = value != null;
        final timerText = isRunning ? ' | $value ${"seconds_short".tr()}' : '';
        final onTapIsActive = !isRunning && !widget.isLoading;
        return AppButton(
          isLoading: widget.isLoading,
          textSize: 16.sp,
          isActive: !isRunning,
          textColor: AppColors.white,
          inactiveTextColor: AppColors.white,
          // onTap: null,
          onTap: isRunning
              ? null
              : () async {
                  if (!onTapIsActive) return;
                  final launchTimer = await widget.onTap();
                  if (launchTimer) timerNotifier.launch();
                },
          text: '${widget.text}$timerText',
        );
      },
    );
  }
}

class _TimerNotifier extends ValueNotifier<int?> {
  _TimerNotifier(super.value, {required this.timeoutSeconds});

  @protected
  final int timeoutSeconds;

  Timer? timer;

  void launch() {
    timer?.cancel();
    value = timeoutSeconds;
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        final v = value;
        if (v == null) return timer.cancel();
        if (v <= 0) return value = null;
        value = v - 1;
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }
}
