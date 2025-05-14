import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/services/connection_service.dart';

@RoutePage()
class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({super.key});

  @protected
  static const kTextStyle = TextStyle(
    height: 1.5,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: CustomScrollView(
          primary: false,
          slivers: [
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Icon(
                    Icons.wifi_off_rounded,
                    size: 153,
                    color: AppColors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: 'no_internet_text'.tr()),
                          TextSpan(text: '\n'),
                          TextSpan(text: 'no_internet_content'.tr()),
                        ],
                        style: kTextStyle.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: GetIt.I<ConnectionService>().checkConnection,
                    style: FilledButton.styleFrom(
                      fixedSize: Size(140, 48),
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.background1,
                    ),
                    child: Text('retry'.tr()),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
