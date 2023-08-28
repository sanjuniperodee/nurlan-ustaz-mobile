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
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/widgets/surak_dialog.dart';
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
    return false;
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
                      .any((element) => element.email == user.email) ||
                  channel == null) {
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
                              builder: (context) {
                                return SurakDialog(
                                  channelSocket: _channel,
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
                    tabs: [
                      Tab(
                        text: 'today'.tr(),
                      ),
                      Tab(
                        text: 'all_time'.tr(),
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
