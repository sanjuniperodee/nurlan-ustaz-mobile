import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_device_dto.dart';
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
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  NotificationDeviceDTO? noti;
  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  height: 20.h,
                ),
                const CustomAppBar(
                  title: 'Хабарлама',
                ),
                SizedBox(
                  height: 32.h,
                ),
                // Container(
                //   padding: const EdgeInsets.only(
                //     left: 12,
                //     right: 17,
                //     top: 20,
                //     bottom: 20,
                //   ).r,
                //   width: double.maxFinite,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.white),
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: noti.,
                //     itemBuilder: (context, index) {
                //       return Container(
                //         color: Colors.black,
                //         width: double.infinity,
                //         child: Row(
                //           mainAxisAlignment:
                //               MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               '${notifications[index].title}',
                //               style:
                //                   getTextStyle(CustomTextStyles.s16w500)
                //                       .copyWith(
                //                           fontFamily:
                //                               FontTypes.SF_Pro.name,
                //                           fontWeight: FontWeight.w600),
                //             ),
                //             CupertinoSwitch(
                //                 value: notifications[index].status,
                //                 onChanged: (value) {})
                //           ],
                //         ),
                //       );
                //     },
                //   ),

                // ),
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
