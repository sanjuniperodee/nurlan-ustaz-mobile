import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/custom_tus_zhoru_list.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/tus_zhoru_custom_body.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/tus_zhoru_list.dart';

import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../app/presentation/widgets/custom_tab_bar.dart';
import '../../../app/presentation/widgets/search_widget.dart';

class TusZhoruPage extends StatefulWidget {
  final String? type;
  const TusZhoruPage({Key? key, this.type}) : super(key: key);

  @override
  State<TusZhoruPage> createState() => _TusZhoruPageState();
}

int currentIndex = 0;

class _TusZhoruPageState extends State<TusZhoruPage> {
  @override
  void initState() {
    widget.type == 'isSave'
        ? BlocProvider.of<TusZhoruCubit>(context)
            .tusZhoruT(page: 1, isFirstCall: true, isSaved: true)
        : BlocProvider.of<TusZhoruCubit>(context)
            .tusZhoruT(page: 1, isFirstCall: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TusZhoruCubit, TusZhoruState>(
        listener: (context, state) {
      state.maybeWhen(
        orElse: () {},
        loaded: () {
          context.router.push(
            const QuestionPageRoute(),
          );
        },
        errorState: (message) {
          buildErrorCustomSnackBar(context, message);
        },
      );
    }, builder: (context, state) {
      return state.maybeMap(orElse: () {
        return Container();
      }, loadingState: (loading) {
        return Center(
          child: CircularProgressIndicator(
            color: AppColors.orange,
          ),
        );
      }, initialState: (tusZhoruList) {
        return Scaffold(
          floatingActionButton: tusZhoruList.currentIndex == 1
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppButton(
                      onTap: () {
                        context.router.push(
                          const QuestionPageRoute(),
                        );
                      },
                      text: 'Түсіңізді жазыңыз'),
                )
              : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          backgroundColor: Color(0xFFECF5FF),
          body: TusZhoruCustomBody(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomAppBar(
                    title: widget.type == 'isSave'
                        ? 'Таңдаулы түс жору'
                        : 'Түс жору',
                    hideIcon: widget.type == 'isSave' ? false : true,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  SearchWidget(
                    onChanged: (value) {
                      log(value);

                      if (tusZhoruList.currentIndex == 0) {
                        value.isEmpty
                            ? context
                                .read<TusZhoruCubit>()
                                .tusZhoruT(page: 1, isFirstCall: true)
                            : context.read<TusZhoruCubit>().tusZhoruT(
                                search: value, page: 1, isFirstCall: true);
                      }
                      if (tusZhoruList.currentIndex == 1) {
                        value.isEmpty
                            ? context
                                .read<TusZhoruCubit>()
                                .getCustomTusZhoruT(page: 1, isFirstCall: true)
                            : context.read<TusZhoruCubit>().getCustomTusZhoruT(
                                search: value, page: 1, isFirstCall: true);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTabBar(
                    tabs: const [
                      Tab(
                        text: 'Барлығы',
                      ),
                      Tab(
                        text: 'Өз түсім',
                      ),
                    ],
                    onTap: (int value) {
                      context.read<TusZhoruCubit>().switchTab(value);
                    },
                    length: 2,
                  ),
                  tusZhoruList.currentIndex == 0
                      ? TusZhoruList(tusZhoruList: tusZhoruList.tusZhoruList)
                      : CustomTusZhoruList(
                          tusZhoruList: tusZhoruList.customTusZhoru)
                ],
              ),
            ),
          ),
        );
      });
    });
  }

  int selectedIndex = -1;
}
