import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
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

class UstazAitinizhi extends StatefulWidget {
  const UstazAitinizhi({Key? key}) : super(key: key);

  @override
  State<UstazAitinizhi> createState() => _UstazAitinizhiState();
}

int currentIndex = 0;
bool showButton = false;
late UserDto userSir;
late IOWebSocketChannel? _channel;

class _UstazAitinizhiState extends State<UstazAitinizhi> {
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
              }
            });
        // TODO: implement listener
      },
      child: Scaffold(
        floatingActionButton: currentIndex == 0 ?





        showButton
                ? Container(
                    width: double.infinity,
                    height: 112.h,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 44, right: 16, left: 16),
                      child: AppButton(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                TextEditingController _surakController = TextEditingController();
                                return AlertDialog(
                                  contentPadding: EdgeInsets.all(0),
                                  elevation: 50000,
                                  backgroundColor: AppColors.white
                                      .withOpacity(0.000000000000000001),
                                  content: Container(
                                    width: 320,
                                    height: 300,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 50,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            height: 194,
                                            width: 320,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  height: 48,
                                                ),
                                                Text(
                                                  'Сұрағыңыз',
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s16w700)
                                                      .copyWith(
                                                          fontFamily: FontTypes
                                                              .Philosopher
                                                              .name),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  child: Container(
                                                    height: 32.h,
                                                    width: 279.w,
                                                    child: TextFormField(
                                                      controller: _surakController,
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            40),
                                                      ],
                                                      decoration:
                                                          InputDecoration(

                                                        floatingLabelBehavior:
                                                            FloatingLabelBehavior
                                                                .never,
                                                        enabled: true,
                                                        labelText: "Текст",
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
                                                            contentPadding: EdgeInsets.all(10.0),
                                                        //fillColor: Colors.green
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _channel?.sink.add(jsonEncode({"message": _surakController.value.text}));
                                                    Navigator.pop(dialogContext);
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(
                                                        gradient: AppColors
                                                            .gradientPrimaryActiveButton,
                                                        color: AppColors.blue,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Center(
                                                        child: Text(
                                                      'Жіберу',
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
                                          left: 115,
                                          bottom: 210,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: CachedNetworkImage(
                                              imageUrl: userSir.avatar ?? '',
                                              fit: BoxFit.cover,
                                              height: 74.h,
                                              width: 74.w,
                                              errorWidget: (a, b, c) => Center(
                                                child: SvgPicture.asset(
                                                  Assets.userSvg,
                                                  width: 74,
                                                  height: 74,
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
                          text: 'Сұраңыз'),
                    ),
                  )
                : null
            : null ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        backgroundColor: Color(0xFFECF5FF),
        body: GlobalCustomBody(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const CustomAppBar(
                  title: 'Ұстаз айтыңызшы',
                ),
                SizedBox(
                  height: 36.h,
                ),
                CustomTabBar(
                  tabs: const [
                    Tab(
                      text: 'Бүгін',
                    ),
                    Tab(
                      text: 'Барлығы',
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
    );
  }
}
