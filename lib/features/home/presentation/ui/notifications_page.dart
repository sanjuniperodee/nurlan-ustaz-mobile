import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_noti_cubit.dart';

import '../../../../core/common/assets.dart';

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
                        const CustomAppBar(
                          title: 'Хабарламалар',
                        ),
                        ListView.builder(
                          itemCount: res.length,
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
                                      res[index].type ?? 'ERROR',
                                      style: getTextStyle(
                                          CustomTextStyles.s14w400),
                                    ),
                                    children: <Widget>[
                                      ListTile(
                                        minLeadingWidth: 0,
                                        leading: SvgPicture.asset(
                                            Assets.orangeDotSvg),
                                        title: Text(
                                          res[index].title ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s14w400)
                                              .apply(color: AppColors.black),
                                        ),
                                        subtitle: Text(
                                          res[index].body ?? 'ERROR',
                                          style: getTextStyle(
                                                  CustomTextStyles.s12w400)
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
              );
            },
          );
        },
      ),
    );
  }
}
