import 'package:flutter/material.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

class _ProgressIndicator extends CircularProgressIndicator {
  const _ProgressIndicator() : super(color: AppColors.linearBlue);
}

class AppProgressIndicator extends StatelessWidget {
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: _ProgressIndicator());
  }
}

class AppProgressIndicatorSliver extends StatelessWidget {
  const AppProgressIndicatorSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Spacer(),
          _ProgressIndicator(),
          Spacer(),
        ],
      ),
    );
  }
}
