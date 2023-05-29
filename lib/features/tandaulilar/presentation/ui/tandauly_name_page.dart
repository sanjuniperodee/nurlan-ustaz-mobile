import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../../../app/presentation/widgets/custom_tab_bar.dart';

class TandaulyNamePage extends StatefulWidget {
  const TandaulyNamePage({super.key});

  @override
  State<TandaulyNamePage> createState() => _TandaulyNamePageState();
}

int currentIndex = 0;

class _TandaulyNamePageState extends State<TandaulyNamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
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
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 56.h,
                        ),
                        const CustomAppBar(
                          title: 'Таңдаулы eсімдер',
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        SearchWidget(onChanged: (string) {}),
                        SizedBox(
                          height: 22.h,
                        ),
                        CustomTabBar(
                          tabs: const [
                            Tab(
                              text: 'Ер',
                            ),
                            Tab(
                              text: 'Әйел',
                            ),
                          ],
                          onTap: (int) {
                            setState(() {
                              currentIndex = int;
                            });
                          },
                          length: 2,
                        ),
                        ListView.builder(
                          itemCount: 23,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    const NameDetailPageRoute(),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListTile(
                                      iconColor: AppColors.black,
                                      title: Text(
                                        currentIndex == 0 ? 'Аңсар' : 'Анара',
                                        style: getTextStyle(
                                            CustomTextStyles.s16w500),
                                      ),
                                      subtitle: Text(
                                        'Көмекшілер, қолдаушылар, жолсерік.',
                                        style: getTextStyle(
                                            CustomTextStyles.s14w400)
                                            .apply(color: AppColors.grey2),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: AppColors.orange,
                                      )),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
