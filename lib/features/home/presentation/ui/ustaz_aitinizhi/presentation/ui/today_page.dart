import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
        return const Padding(
          padding: EdgeInsets.only(top: 300),
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.linearBlue,
            ),
          ),
        );
      }, initialState: (questions, channel, user) {
        //BlocProvider.of<TodayChatCubit>(context).getQuestionByDate(DateFormat('yyyy-MM-dd').format(DateTime.now()));


        return Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Container(
              width: double.infinity,
              height: 180.h,
              child: Hero(
                tag: 'UA',
                child: Image.asset(
                  'assets/images/ustaz_aitinizh.png',

                  fit: BoxFit.fill,
                ),
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

                'warning_24'.tr(),
                style: getTextStyle(CustomTextStyles.s12w600)
                    .copyWith(fontFamily: FontTypes.SF_Pro.name),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),

            QuestionsList(
              questions: questions.reversed.toList(),
              isSocket: channel == null ? null : false,
            ),

            SizedBox(
              height: 200,
            ),
            //QuestionsList(questions: questions,),
          ],
        );
      });
    });
  }
}
