import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_settings_model.dart';

import '../../../../../../core/common/app_styles.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class ProfileNotificationPage extends StatefulWidget {
  const ProfileNotificationPage({Key? key}) : super(key: key);

  @override
  State<ProfileNotificationPage> createState() => _ProfileNotificationPage();
}

class _ProfileNotificationPage extends State<ProfileNotificationPage> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: GlobalCustomBody(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: 1.1.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h,),
                CustomAppBar(
                  title: 'Хабарлама',
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 17,
                    top: 20,
                    bottom: 20,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                      children: notifications
                          .map(
                            (e) => Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${e.title}',
                                    style:
                                        getTextStyle(CustomTextStyles.s16w500)
                                            .copyWith(
                                      fontFamily: FontTypes.SF_Pro.name,
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      value: _switchValue,
                                      onChanged: (value) {
                                        setState(() {
                                          _switchValue = value;
                                        });
                                      },
                                      activeColor: AppColors.orange,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList()

                      // [
                      //   ListView.builder(
                      //       shrinkWrap: true,
                      //       itemBuilder: (context, index) {
                      //         return Container(
                      //           color: Colors.black,
                      //           width: double.infinity,
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Text(
                      //                 '${notifications[index].title}',
                      //                 style: getTextStyle(CustomTextStyles.s16w500)
                      //                     .copyWith(
                      //                         fontFamily: FontTypes.SF_Pro.name,fontWeight: FontWeight.w600),
                      //               ),
                      //               CupertinoSwitch(
                      //                   value: notifications[index].status,
                      //                   onChanged: (value) {})
                      //             ],
                      //           ),
                      //         );
                      //       },
                      //       itemCount: notifications.length),
                      // ],
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<NotificationSettingsModel> notifications =
      List.generate(5, (index) {
    return NotificationSettingsModel(title: 'Намаз уақыты', status: true);
  });
}
