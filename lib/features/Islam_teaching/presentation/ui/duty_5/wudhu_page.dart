import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lottie/lottie.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/namaz_dto.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class WudhuPage extends StatefulWidget {
  final List<NamazDTO> wudhu;
  const WudhuPage({super.key, required this.wudhu});

  @override
  State<WudhuPage> createState() => _WudhuPageState();
}

class _WudhuPageState extends State<WudhuPage> {
  int currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: const BoxDecoration(color: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (_pageController.page! > 0) {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.orange,
                ),
              ),
              InkWell(
                onTap: () {
                  if (_pageController.page! < widget.wudhu.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.orange,
                ),
              )
            ],
          )),
      body: SizedBox(
        height: 1.sh,
        child: Stack(
          children: [
            Image.asset(
              Assets.gradient,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              // left: 280.r,
                child: Opacity(
                  opacity: 0.5,
                  child:  Lottie.asset('assets/animations/Book_V04.json',fit: BoxFit.cover),
                )),
            SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 56.h,
                  ),
                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomAppBar(
                      title: 'cleaning'.tr(),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: widget.wudhu.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListView(
                          padding: const EdgeInsets.all(16),
                          shrinkWrap: true,
                          children: [
                            Text(widget.wudhu[index].title ?? 'ERROR'),
                            Center(
                                child: HtmlWidget(
                              widget.wudhu[index].text ?? '',
                              onErrorBuilder: (context, element, error) =>
                                  Text('$element error: $error'),
                              onLoadingBuilder:
                                  (context, element, loadingProgress) =>
                                      const CircularProgressIndicator(),
                            )),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
