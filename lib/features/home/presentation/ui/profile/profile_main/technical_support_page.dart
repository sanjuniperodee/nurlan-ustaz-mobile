import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/services/locator_service.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/bloc/technical_support_cubit.dart';
import 'package:web_socket_channel/io.dart';

class TechnicalSupportPage extends StatefulWidget {
  const TechnicalSupportPage({Key? key}) : super(key: key);

  @override
  State<TechnicalSupportPage> createState() => _TechnicalSupportPageState();
}

class _TechnicalSupportPageState extends State<TechnicalSupportPage> {
  TechnicalSupportCubit technicalSupportCubit = getIt<TechnicalSupportCubit>();
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState

    technicalSupportCubit.connectSocket();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // scrollToTheEnd();
    return Scaffold(
      body: BlocConsumer<TechnicalSupportCubit, TechnicalSupportState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
            initialState: (questions, channel, user) {
              Future.delayed(const Duration(milliseconds: 300))
                  .then((value) => scrollToTheEnd());
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return Container();
            },
            errorState: (message) {
              return Container();
            },
            loadingState: () {
              return const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.danger,
                  ),
                ),
              );
            },
            initialState: (questions, channel, user) {
              return GlobalCustomBody(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomAppBar(
                      title: 'tech_support'.tr(),
                    ),
                    if (questions != [])
                      ListView.builder(
                        // reverse: true,
                        itemCount: questions.length,
                        shrinkWrap: true,
                        // controller: _scrollController,
                        padding: const EdgeInsets.only(top: 10, bottom: 10).r,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10)
                                .r,
                            child: Align(
                              alignment:
                                  (questions[index].userName != user!.email
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                        questions[index].userName != user.email
                                            ? Colors.grey.shade200
                                            : Colors.blue[100]),
                                padding: const EdgeInsets.all(16).r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      questions[index].message ?? 'ERROR',
                                      style:
                                          getTextStyle(CustomTextStyles.s14w400)
                                              .apply(color: AppColors.black),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                        DateFormat('HH:mm').format(
                                            DateTime.parse(questions[index]
                                                    .createdAt
                                                    .toString())
                                                .toLocal()),
                                        style: getTextStyle(
                                                CustomTextStyles.s12w400)
                                            .apply(
                                                color:
                                                    questions[index].userName !=
                                                            user.email
                                                        ? AppColors.grey2
                                                        : Colors.blue[900])),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    SizedBox(
                      height: 120.h,
                    )
                  ]),
                ),
              );
            },
          );
        },
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        height: 132.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'need_help'.tr(),
              style: getTextStyle(CustomTextStyles.s12w400)
                  .apply(color: AppColors.black),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true, // Set autofocus to true
                    focusNode: focusNode,
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        hintText: 'write_comm'.tr(), border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // scrollToTheEnd();
                    if (_textEditingController.text.isNotEmpty) {
                      technicalSupportCubit
                          .addMessage(_textEditingController.text);
                      _textEditingController.clear();
                    }
                  },
                ),
              ],
            ),
            const Divider(
              height: 13,
              thickness: 3,
              color: AppColors.background2,
            ),
          ],
        ),
      ),
    );
  }

  void scrollToTheEnd() {
    log('SCROLL${_scrollController.position.maxScrollExtent}');
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
