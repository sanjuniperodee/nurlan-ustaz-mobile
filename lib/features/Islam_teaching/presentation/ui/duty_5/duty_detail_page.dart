import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/pillars_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/container_duty_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DutyDetailPage extends StatefulWidget {
  final PillarsDTO pillarsDTO;
  const DutyDetailPage({super.key, required this.pillarsDTO});

  @override
  State<DutyDetailPage> createState() => _DutyDetailPageState();
}

class _DutyDetailPageState extends State<DutyDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      bottomSheet: widget.pillarsDTO.url != null || widget.pillarsDTO.type == 2
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: const BoxDecoration(color: AppColors.white),
              child: AppButton(
                  onTap: () {
                    log('URL${widget.pillarsDTO.url}');
                    widget.pillarsDTO.type == 2
                        ? context.router.push(const NamazPatternPageRoute())
                        : _launchUrl(widget.pillarsDTO.url ?? '');
                  },
                  text: widget.pillarsDTO.type == 2
                      ? 'Намаз оқу үлгісі'
                      : widget.pillarsDTO.type == 3
                          ? 'Зекет беру'
                          : 'Қажылық'),
            )
          : const SizedBox(),
      body: SizedBox(
        height: 1.sh,
        child: Stack(
          children: [
            Image.asset(
              Assets.gradient,
              fit: BoxFit.cover,
            ),
            Positioned(
                // left: 280.r,
                top: 10.r,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/images/x.png',
                    // colorBlendMode: ,
                    // opacity: 0.1,
                    width: 1.sw,
                  ),
                )),
            SizedBox(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 46.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomAppBar(
                          title: widget.pillarsDTO.title ?? 'ERROR',
                        ),
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      ContainerDutyWidget(
                        title: widget.pillarsDTO.title ?? 'ERROR',
                        body: widget.pillarsDTO.text ?? 'ERROR',
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String _urll) async {
    final Uri _url = Uri.parse('${_urll}');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
