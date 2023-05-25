import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';

import '../../../../core/common/assets.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: GlobalCustomBody(
        child: SizedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Хабарламалар',
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Theme(
                          data: theme,
                          child: ExpansionTile(
                            collapsedIconColor: AppColors.orange,
                            iconColor: AppColors.orange,
                            title: Text(
                              'Жаңалықтар',
                              style: getTextStyle(CustomTextStyles.s14w400),
                            ),
                            children: <Widget>[
                              ListTile(
                                minLeadingWidth: 0,
                                leading: SvgPicture.asset(Assets.orangeDotSvg),
                                title: Text(
                                  'Таң намазы',
                                  style: getTextStyle(CustomTextStyles.s14w400)
                                      .apply(color: AppColors.black),
                                ),
                                subtitle: Text(
                                  'Жаңа ғана',
                                  style: getTextStyle(CustomTextStyles.s12w400)
                                      .apply(color: AppColors.grey2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
