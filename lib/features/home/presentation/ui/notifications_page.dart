import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_noti_cubit.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<GetNotiCubit>(context).getNoti();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<GetNotiCubit, GetNotiState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.red,
                ),
              );
            },
            loaded: (res) {
              return GlobalCustomBody(
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                         CustomAppBar(
                          title: 'notifications'.tr(),
                        ),
                        if (res.news != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 28.0),
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
                                    'news'.tr(),
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400),
                                  ),
                                  children: <Widget>[
                                    for (int i = 0; i < res.news!.length; i++)
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                            Assets.orangeDotSvg),
                                        title: Text(
                                          res.news![i].title ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s14w400)
                                              .apply(color: AppColors.black),
                                        ),
                                        subtitle: Text(
                                          res.news![i].body ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s12w400)
                                              .apply(color: AppColors.grey2),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (res.dream != null)
                          Padding(
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
                                    'dream_interpretation'.tr(),
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400),
                                  ),
                                  children: <Widget>[
                                    for (int i = 0; i < res.dream!.length; i++)
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                            Assets.orangeDotSvg),
                                        title: Text(
                                          res.dream![i].title ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s14w400)
                                              .apply(color: AppColors.black),
                                        ),
                                        subtitle: Text(
                                          res.dream![i].body ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s12w400)
                                              .apply(color: AppColors.grey2),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (res.muslimName != null)
                          Padding(
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
                                    'name_meaning'.tr(),
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400),
                                  ),
                                  children: <Widget>[
                                    for (int i = 0;
                                        i < res.muslimName!.length;
                                        i++)
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                            Assets.orangeDotSvg),
                                        title: Text(
                                          res.muslimName![i].title ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s14w400)
                                              .apply(color: AppColors.black),
                                        ),
                                        subtitle: Text(
                                          res.muslimName![i].body ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s12w400)
                                              .apply(color: AppColors.grey2),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (res.live != null)
                          Padding(
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
                                    'live'.tr(),
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400),
                                  ),
                                  children: <Widget>[
                                    for (int i = 0; i < res.live!.length; i++)
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                            Assets.orangeDotSvg),
                                        title: Text(
                                          res.live![i].title ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s14w400)
                                              .apply(color: AppColors.black),
                                        ),
                                        subtitle: Text(
                                          res.live![i].body ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s12w400)
                                              .apply(color: AppColors.grey2),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (res.tellMe != null)
                          Padding(
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
                                    'can_ques'.tr(),
                                    style:
                                        getTextStyle(CustomTextStyles.s14w400),
                                  ),
                                  children: <Widget>[
                                    for (int i = 0; i < res.tellMe!.length; i++)
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                            Assets.orangeDotSvg),
                                        title: Text(
                                          res.tellMe![i].title ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s14w400)
                                              .apply(color: AppColors.black),
                                        ),
                                        subtitle: Text(
                                          res.tellMe![i].body ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s12w400)
                                              .apply(color: AppColors.grey2),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
