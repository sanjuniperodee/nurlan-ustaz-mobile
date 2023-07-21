import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
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
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late IOWebSocketChannel? _channel;

  FocusNode focusNode = FocusNode();
  final ScrollController _controller = ScrollController();
  void _scrollDown() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<TechnicalSupportCubit>(context).connectSocket();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
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
    return Scaffold(
      body: BlocConsumer<TechnicalSupportCubit, TechnicalSupportState>(
        listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              errorState: (message) {
                buildErrorCustomSnackBar(context, message);
              });
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
              // _controller.jumpTo(_controller.position.maxScrollExtent);
              _channel = channel;
              return GlobalCustomBody(
                child: SizedBox(
                  height: 1.1.sh,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      const CustomAppBar(
                        title: 'Техникалық қолдау',
                      ),
                      if (questions != [])
                        ListView.builder(
                          itemCount: questions.length,
                          shrinkWrap: true,
                          controller: _controller,
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
                                      color: questions[index].userName !=
                                              user.email
                                          ? Colors.grey.shade200
                                          : Colors.blue[100]),
                                  padding: const EdgeInsets.all(16).r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        questions[index].message ?? 'ERROR',
                                        style: getTextStyle(
                                                CustomTextStyles.s14w400)
                                            .apply(color: AppColors.black),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                          DateFormat('HH.mm').format(
                                              DateTime.parse(questions[index]
                                                      .createdAt
                                                      .toString())
                                                  .toLocal()),
                                          style: getTextStyle(
                                                  CustomTextStyles.s12w400)
                                              .apply(
                                                  color: questions[index]
                                                              .userName !=
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
              'Сізде мәселе туындады ма?',
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
                    decoration: const InputDecoration(
                        hintText: 'Пікір білдіру', border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _channel?.sink.add(jsonEncode(
                          {"message": _textEditingController.value.text}));
                      setState(() {});
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
}
