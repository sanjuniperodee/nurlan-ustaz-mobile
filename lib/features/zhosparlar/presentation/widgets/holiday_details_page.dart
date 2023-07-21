import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_details_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/tus_zhoru_detail_body.dart';
import 'package:nurlan_ustaz_flutter/features/zhosparlar/data/models/event_dto.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/pay_dialog.dart';
import '../../../app/app_dinamic_link.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';

class HolidayDetailPage extends StatefulWidget {
  const HolidayDetailPage({super.key, required this.event});

  final EventDto event;

  @override
  State<HolidayDetailPage> createState() => _HolidayDetailPage();
}

class _HolidayDetailPage extends State<HolidayDetailPage> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.white,
      body: BlocBuilder<TusZhoruDetailsCubit, TusZhoruDetailsState>(
          builder: (context, state) {
            return TusZhoruDetailBody(
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  child: Stack(children: [
                    //Image.network('${widget.event.}')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 15.w),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: SvgPicture.asset('assets/icons/back_stack.svg',color: AppColors.white.withOpacity(0.7),),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Container(
                          constraints: BoxConstraints(
                            minHeight: 1.0.sh,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  stops: [
                                    0.0,
                                    1.0
                                  ],
                                  colors: [
                                    AppColors.white.withOpacity(0.5),
                                    AppColors.white
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.event.title ?? '',
                                style: getTextStyle(CustomTextStyles.s20w700)
                                    .copyWith(
                                    fontSize: 24,
                                    fontFamily:
                                    FontTypes.Philosopher.name,color: AppColors.blue),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/calendar_outline.svg',
                                    color: AppColors.blue,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    '${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.event.date ?? ''))} ',
                                    style: getTextStyle(CustomTextStyles.s16w400).copyWith(
                                        fontFamily: FontTypes.SF_Pro.name,
                                        color: AppColors.grey1.withOpacity(0.55)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                child: Text( widget.event.description ?? '',
                                  style: getTextStyle(
                                      CustomTextStyles.s16w400)
                                      .copyWith(
                                      fontFamily:
                                      FontTypes.SF_Pro.name,
                                      height: 1.5),
                                  overflow: TextOverflow.fade,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            );
          }),
    );
  }
}
