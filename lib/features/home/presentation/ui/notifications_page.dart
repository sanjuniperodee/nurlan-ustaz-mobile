import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_noti_cubit.dart';


@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    BlocProvider.of<GetNotiCubit>(context).getNoti();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<GetNotiCubit, GetNotiState>(
        builder: (context, state) {
          if (state is! GetNotiLoadedState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.linearBlue,
              ),
            );
          }
          final res = state.res;
          log('уведомления-$res');
          return GlobalCustomBody(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'notifications'.tr(),
                  ),
                  _buildExpansionTile(
                    res.news,
                    'news'.tr(),
                  ),
                  _buildExpansionTile(
                    res.dream,
                    'dream_interpretation'.tr(),
                  ),
                  _buildExpansionTile(
                    res.muslimName,
                    'name_meaning'.tr(),
                  ),
                  _buildExpansionTile(
                    res.live,
                    'live'.tr(),
                  ),
                  _buildExpansionTile(
                    res.tellMe,
                    'can_ques'.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildExpansionTile(List<MediaDTO>? items, String titleKey) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    if (items == null || items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          height: 53.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Theme(
              data: theme,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15).w,
                child: Row(
                  children: [
                    Text(
                      titleKey,
                      style: getTextStyle(CustomTextStyles.s14w400),
                    ),
                  ],
                ),
              )),
        ),
      ); // or any other fallback widget
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Theme(
          data: theme,
          child: ExpansionTile(
            collapsedIconColor: AppColors.orange,
            iconColor: AppColors.orange,
            title: Text(
              titleKey,
              style: getTextStyle(CustomTextStyles.s14w400),
            ),
            children: <Widget>[
              for (int i = 0; i < items.length; i++)
                ListTile(
                  minLeadingWidth: 0,
                  leading: SvgPicture.asset(Assets.orangeDotSvg),
                  title: Text(
                    items[i].body == '' ? items[i].title! : items[i].body!,
                    style: getTextStyle(CustomTextStyles.s14w400)
                        .apply(color: AppColors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
