import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/app/bloc/other_list_bloc/language_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
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

@RoutePage(name: 'TusZhoruRouterPage')
class TusZhoruPage extends StatefulWidget {
  final String? type;

  const TusZhoruPage({
    Key? key,
    this.type,
  }) : super(key: key);

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
    return BlocListener<LanguageCubit, LanguageState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loadedState: () {
            setState(() {});
          },
        );
        // TODO: implement listener
      },
      child: BlocConsumer<TusZhoruCubit, TusZhoruState>(
          listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: () {
            context.router.push(
              const QuestionRoute(),
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
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.linearBlue,
            ),
          );
        }, initialState: (tusZhoruList) {
          return Scaffold(
            floatingActionButton: tusZhoruList.currentIndex == 1
                ? widget.type == 'isSave'
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(
                                bottom: 160, left: 16, right: 16)
                            .r,
                        child: AppButton(
                            onTap: () {
                              context.router.push(
                                const QuestionRoute(),
                              );
                            },
                            text: 'type_dream'.tr()),
                      )
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            backgroundColor: const Color(0xFFECF5FF),
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
                          ? 'save_dream_interpretation'.tr()
                          : 'dream_interpretation'.tr(),
                      hideIcon: widget.type == 'isSave' ? true : false,
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
                                  .getCustomTusZhoruT(
                                      page: 1, isFirstCall: true)
                              : context
                                  .read<TusZhoruCubit>()
                                  .getCustomTusZhoruT(
                                      search: value,
                                      page: 1,
                                      isFirstCall: true);
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTabBar(
                      tabs: [
                        Tab(
                          text: 'all'.tr(),
                        ),
                        Tab(
                          text: 'personal_dream'.tr(),
                        ),
                      ],
                      onTap: (int value) {
                        context.read<TusZhoruCubit>().switchTab(
                            value, widget.type == 'isSave' ? 'save' : '');
                      },
                      length: 2,
                    ),
                    AnimatedCrossFade(
                        firstChild: TusZhoruList(
                            tusZhoruList: tusZhoruList.tusZhoruList),
                        secondChild: CustomTusZhoruList(
                            tusZhoruList: tusZhoruList.customTusZhoru),
                        crossFadeState: tusZhoruList.currentIndex == 0
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(milliseconds: 100))

                    // tusZhoruList.currentIndex == 0
                    //     ? TusZhoruList(tusZhoruList: tusZhoruList.tusZhoruList)
                    //     : CustomTusZhoruList(
                    //         tusZhoruList: tusZhoruList.customTusZhoru),
                    ,
                    SizedBox(
                      height: 105.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      }),
    );
  }

  int selectedIndex = -1;
}
