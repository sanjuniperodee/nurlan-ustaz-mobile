import 'package:auto_route/auto_route.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/bloc/today_chat_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/ui/calendar_page.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/ui/today_page.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../../../../core/common/assets.dart';
import '../../../../../../../core/common/colors.dart';
import '../../../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../../../app/presentation/widgets/custom_tab_bar.dart';

@RoutePage()
class UstazAitinizhiPage extends StatefulWidget {
  const UstazAitinizhiPage({Key? key}) : super(key: key);

  @override
  State<UstazAitinizhiPage> createState() => _UstazAitinizhiPageState();
}

int currentIndex = 0;
bool showButton = false;
late UserDto userSir;
late IOWebSocketChannel? _channel;

class _UstazAitinizhiPageState extends State<UstazAitinizhiPage> {
  Future<bool> _onWillPop() async {
    setState(() {
      currentIndex = 0;
    });
    Navigator.of(context).pop(true);
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodayChatCubit, TodayChatState>(
      listener: (context, state) {
        state.maybeWhen(
            orElse: () {},
            loadingState: () {
              return const Padding(
                padding: EdgeInsets.only(top: 600),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            initialState: (questions, channel, user) {
              userSir = user!;
              _channel = channel;

              if (questions
                  .toList()
                  .any((element) => element.email == user.email)) {
                log('est');
                setState(() {
                  showButton = false;
                });
              } else {
                setState(() {
                  showButton = true;
                });
              }
            });
        // TODO: implement listener
      },
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          floatingActionButton: currentIndex == 0
              ? showButton
                  ? Container(
                      width: double.infinity,
                      height: 80.h,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 16.h, bottom: 14.h, right: 16.w, left: 16.w),
                        child: AppButton(
                          textSize: 16.sp,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                TextEditingController _surakController =
                                    TextEditingController();
                                return AlertDialog(
                                  contentPadding: EdgeInsets.all(0),
                                  elevation: 50000,
                                  backgroundColor: AppColors.white
                                      .withOpacity(0.000000000000000001),
                                  content: Container(
                                    width: 320.w,
                                    height: 300.h,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 0,
                                          left: 0,
                                          top: 50.h,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            width: 320.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 48.h,
                                                ),
                                                Text(
                                                  'questions'.tr(),
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s16w700)
                                                      .copyWith(
                                                          fontFamily: FontTypes
                                                              .Philosopher
                                                              .name),
                                                ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16.w),
                                                  child: Container(
                                                    width: 279.w,
                                                    constraints: BoxConstraints(
                                                        minHeight: 32.h),
                                                    child: TextFormField(
                                                      minLines: 1,
                                                      maxLines: 10,
                                                      controller:
                                                          _surakController,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            90),
                                                      ],
                                                      decoration:
                                                          InputDecoration(
                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        enabled: true,
                                                        labelText:
                                                            "${'tell_me_ustaz'.tr()}...",
                                                        labelStyle: getTextStyle(
                                                                CustomTextStyles
                                                                    .s14w600)
                                                            .copyWith(
                                                                fontFamily:
                                                                    FontTypes
                                                                        .SF_Pro
                                                                        .name),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .grey1
                                                                  .withOpacity(
                                                                      0.2)),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
                                                          borderSide: BorderSide(
                                                              color: AppColors
                                                                  .grey1
                                                                  .withOpacity(
                                                                      0.2)),
                                                        ),
                                                        filled: true,
                                                        fillColor: AppColors
                                                            .blue
                                                            .withOpacity(0.05),
                                                        contentPadding:
                                                            EdgeInsets.all(10),
                                                        //fillColor: Colors.green
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16.h,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _channel?.sink.add(
                                                        jsonEncode({
                                                      "message":
                                                          _surakController
                                                              .value.text
                                                    }));
                                                    Navigator.pop(
                                                        dialogContext);
                                                  },
                                                  child: Container(
                                                    height: 52.h,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        gradient: AppColors
                                                            .gradientPrimaryActiveButton,
                                                        color: AppColors.blue,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.r),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.r))),
                                                    child: Center(
                                                        child: Text(
                                                      'send'.tr(),
                                                      style: getTextStyle(
                                                              CustomTextStyles
                                                                  .s16w500)
                                                          .copyWith(
                                                              color: AppColors
                                                                  .white,
                                                              fontFamily:
                                                                  FontTypes
                                                                      .SF_Pro
                                                                      .name),
                                                    )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 115.w,
                                          bottom: 210.h,
                                          child: Container(
                                            height: 74.h,
                                            width: 74.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(74.r),
                                              child: CachedNetworkImage(
                                                imageUrl: userSir.avatar ?? '',
                                                fit: BoxFit.cover,
                                                height: 74.h,
                                                width: 74.w,
                                                errorWidget: (a, b, c) =>
                                                    Center(
                                                  child: SvgPicture.asset(
                                                    Assets.userSvg,
                                                    width: 74.w,
                                                    height: 74.h,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          text: 'ask'.tr(),
                        ),
                      ),
                    )
                  : null
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          backgroundColor: Color(0xFFECF5FF),
          body: GlobalCustomBody(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomAppBar(
                    onTap: () async {
                      Navigator.pop(context);
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    title: 'tell_me_ustaz'.tr(),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  CustomTabBar(
                    tabs:  [
                      Tab(
                        text: 'today'.tr(),
                      ),
                      Tab(
                        text: 'all'.tr(),
                      ),
                    ],
                    onTap: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    length: 2,
                  ),
                  currentIndex == 0
                      ? const TodayChatPage()
                      : const CalendarChatsPage()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
