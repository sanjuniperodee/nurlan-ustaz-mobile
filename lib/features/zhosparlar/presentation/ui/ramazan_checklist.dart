import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_field.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../../../../core/common/assets.dart';

class RamazanChecklist extends StatefulWidget {
  const RamazanChecklist({Key? key}) : super(key: key);

  @override
  State<RamazanChecklist> createState() => _RamazanChecklistState();
}

class _RamazanChecklistState extends State<RamazanChecklist> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: GlobalCustomBody(
        horizontalPadding: 0,
        child: SizedBox(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: const CustomAppBar(
                    title: 'Рамазан чеклисті',
                  ),
                ),
                SizedBox(
                  height: 36.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Бүгін, ${DateTime.now().day} наурыз',
                            style: getTextStyle(CustomTextStyles.s14w400)
                                .copyWith(
                                    fontFamily: FontTypes.SF_Pro.name,
                                    color: AppColors.white),
                          ),
                          Text(
                            'Оразаның 2-күні',
                            style: getTextStyle(CustomTextStyles.s14w400)
                                .copyWith(
                                    fontFamily: FontTypes.Philosopher.name,
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/add-alt.svg'))
                    ],
                  ),
                ),
                ListView.builder(
                  itemCount: 16,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Slidable(
                      endActionPane: ActionPane(
                        extentRatio: 0.3,
                        motion: const ScrollMotion(),
                        children: [
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => Center(
                                        child: Container(
                                          width: 270.w,
                                          height: 150.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: AppColors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 16,
                                              ),
                                              Text(
                                                'Жаңа тапсырма қосу',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s16w700)
                                                    .copyWith(
                                                        fontFamily: FontTypes
                                                            .Philosopher.name),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 50),
                                                child: Text(
                                                  'Төменге тізімге енгізетін тапсырманы жазыңыз',
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s14w400)
                                                      .copyWith(
                                                          fontFamily: FontTypes
                                                              .SF_Pro.name)
                                                      .copyWith(
                                                          color: AppColors.grey1
                                                              .withOpacity(
                                                                  0.5)),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 135.w,
                                                    decoration: const BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Color(
                                                                    0xFFE7EAEB)),
                                                            top: BorderSide(
                                                                color: Color(
                                                                    0xFFE7EAEB)))),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        'Болдырмау',
                                                        style: getTextStyle(
                                                                CustomTextStyles
                                                                    .s14w400)
                                                            .copyWith(
                                                                fontFamily:
                                                                    FontTypes
                                                                        .SF_Pro
                                                                        .name),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 135.w,
                                                    decoration: const BoxDecoration(
                                                        border: Border(
                                                            top: BorderSide(
                                                                color: Color(
                                                                    0xFFE7EAEB)))),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text('OK',
                                                        style: getTextStyle(
                                                            CustomTextStyles
                                                                .s14w500)
                                                            .copyWith(
                                                            fontFamily:
                                                            FontTypes
                                                                .SF_Pro
                                                                .name,color: AppColors.blue),),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                            child: Container(
                              width: 56.w,
                              height: 56.h,
                              color: Color(0xFF26292D),
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/edit.svg')),
                            ),
                          ),
                          InkWell(
                            onTap:(){
                              setState(() {
                              });
                            },
                            child: Container(
                              width: 56.w,
                              height: 56.h,
                              color: AppColors.red,
                              child: Center(
                                  child: SvgPicture.asset(
                                      'assets/icons/delete_busket.svg')),
                            ),
                          ),
                        ],
                      ),
                      key: UniqueKey(),
                      child: Container(
                        height: 56.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: index == 0
                              ? BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))
                              : null,
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.r, horizontal: 16.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Семинар тақырыбы',
                                  style:
                                      getTextStyle(CustomTextStyles.s16w500)
                                          .apply(color: AppColors.black),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: selectedIndex != index
                                    ? SvgPicture.asset(
                                        'assets/icons/empty_eclipse.svg')
                                    : SvgPicture.asset(
                                        'assets/icons/Unchecked.svg')),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
