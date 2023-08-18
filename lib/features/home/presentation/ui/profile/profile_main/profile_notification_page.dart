import 'package:auto_route/auto_route.dart';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_settings_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/profile_notification_cubit.dart';

import '../../../../../../core/common/app_styles.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class ProfileNotificationPage extends StatefulWidget {
  const ProfileNotificationPage({Key? key}) : super(key: key);

  @override
  State<ProfileNotificationPage> createState() => _ProfileNotificationPage();
}

class _ProfileNotificationPage extends State<ProfileNotificationPage> {
  bool _switchValue = false;

  @override
  void initState() {
    //BlocProvider.of<TusZhoruCubit>(context).secureScreen();
    BlocProvider.of<ProfileNotificationCubit>(context).getNotificationDto();
    super.initState();
  }

  String handleString(String namazTime) {
    switch (namazTime) {
      case 'custom_dreams':
        return ('dream_interpretations'.tr());
        // Code for case1
        break;
      case 'prayer_times':
        return ('Namaz'.tr());
        // Code for case2
        break;
      case 'ayat_of_the_day':
        return ('Ayat_of_the_day'.tr());
        // Code for case3
        break;
      case 'live_broadcasts':
        return ('live'.tr());
        // Code for case3
        break;
      case 'tell_me_ustaz':
        return ('tell_me_ustaz'.tr());
        // Code for case3
        break;
      case 'checklist_results':
        return ('Чек-лист'.tr());
        // Code for case3
        break;
      case 'seminar_tickets':
        return ('seminar'.tr());
        // Code for case3
        break;
      case 'new_content':
        return ('news'.tr());
        // Code for case3
        break;

      default:
        return ('Invalid input');
        // Code for default case
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return BlocConsumer<ProfileNotificationCubit, ProfileNotificationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeWhen(orElse: () {
          return Container();
        }, loadingState: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        }, initialState: (items, notification) {
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
                      CustomAppBar(
                        title: 'notifications'.tr(),
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
                            children:
                                //notificationMap.entries.toList().sublist(8,15)
                                items
                                    .map(
                                      (e) => Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 4),
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              handleString(e.title ?? ''),
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w500)
                                                  .copyWith(
                                                fontFamily:
                                                    FontTypes.SF_Pro.name,
                                              ),
                                            ),
                                            Transform.scale(
                                              scale: 0.8,
                                              child: CupertinoSwitch(
                                                value: e.status!,
                                                onChanged: (value) {
                                                  log(value.toString());
                                                  context
                                                      .read<
                                                          ProfileNotificationCubit>()
                                                      .switchNotify(e, value);
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
                      SizedBox(
                        height: 20.h,
                      ),
                      AppButton(
                          onTap: () {
                            context
                                .read<ProfileNotificationCubit>()
                                .saveChanges()
                                .then((value) => buildSuccessCustomSnackBar(
                                    context, 'success'.tr()));
                          },
                          text: 'save'.tr())
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }

  final List<NotificationSettingsModel> notifications =
      List.generate(5, (index) {
    return NotificationSettingsModel(title: 'Namaz_time'.tr(), status: true);
  });
}
