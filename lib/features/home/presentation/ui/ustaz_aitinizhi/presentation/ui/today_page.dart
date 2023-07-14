import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/presentation/bloc/today_chat_cubit.dart';

import '../../../../../../../core/common/app_styles.dart';
import '../../../../../../../core/common/assets.dart';
import '../../../../../../../core/common/colors.dart';
import '../../../../../../app/presentation/widgets/custom_snackbars.dart';
import '../widgets/questions_list.dart';

class TodayChatPage extends StatefulWidget {
  const TodayChatPage({Key? key}) : super(key: key);

  @override
  State<TodayChatPage> createState() => _TodayChatPageState();
}

class _TodayChatPageState extends State<TodayChatPage> {
  @override
  void initState() {
    //BlocProvider.of<TusZhoruCubit>(context).secureScreen();
    BlocProvider.of<TodayChatCubit>(context).connectSocket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodayChatCubit, TodayChatState>(
        listener: (context, state) {
      state.maybeWhen(
          orElse: () {},
          errorState: (message) {
            buildErrorCustomSnackBar(context, message);
          });
      // TODO: implement listener
    }, builder: (context, state) {
      log(state.toString());
      return state.maybeWhen(orElse: () {
        return Container();
      }, errorState: (message) {
        return Container();
      }, loadingState: () {
        return Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.danger,
            ),
          ),
        );
      }, initialState: (questions, channel,user) {
        return Column(
          children: [
            SizedBox(
              height: 34.h,
            ),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFAE0AB),
                      Color(0xFFF9A502),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24)),
              padding: EdgeInsets.only(
                  top: 19.r, bottom: 19.r, left: 92.r, right: 92.r),
              child: Column(
                children: [
                  SvgPicture.asset(Assets.boxStorySvg),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Бола ма?\nБолмай ма?',
                    textAlign: TextAlign.center,
                    style: getTextStyle(CustomTextStyles.s16w200)
                        .copyWith(
                            fontFamily: FontTypes.Philosopher.name,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700)
                        .apply(color: AppColors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            InkWell(
              onTap: () async {
                await context.read<TodayChatCubit>().connectSocket();
              },
              child: Text(
                'Ескертпе: сұрағыңыз қысқа да нұсқа болуы шарт (70 әріп) Сұрақтар 24 сағаттан соң “Сақталғандар” бөліміне өтеді',
                style: getTextStyle(CustomTextStyles.s12w600)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),

            QuestionsList(
              questions: questions.reversed.toList(),
              isSocket: false,
            ),

              SizedBox(
                height: 10,
              ),
            //QuestionsList(questions: questions,),
          ],
        );
      });
    });
  }
}
