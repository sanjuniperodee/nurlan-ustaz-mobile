import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/utils/pagination_constant.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/custom_tus_zhoru_list.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/tus_zhoru_custom_body.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/widgets/tus_zhoru_list.dart';

import '../../../../core/common/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/action_result_widget.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../app/presentation/widgets/custom_tab_bar.dart';
import '../../../app/presentation/widgets/search_widget.dart';

@RoutePage()
class SavedTusZhoruPage extends TusZhoruPage {
  const SavedTusZhoruPage({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<TusZhoruPage> createState() => _TusZhoruPageState(isSaved: true);
}

@RoutePage(name: 'TusZhoruRouterPage')
class TusZhoruPage extends StatefulWidget {
  const TusZhoruPage({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<TusZhoruPage> createState() => _TusZhoruPageState(isSaved: false);
}

class _TusZhoruPageState extends State<TusZhoruPage> {
  _TusZhoruPageState({required this.isSaved});

  final bool isSaved;

  bool isLoading = false;
  int currentIndex = 1;
  final _scrollController = ScrollController();
  int itemsLength = 0;
  @override
  void initState() {
    _scrollController.addListener(_scrollListener);

    isSaved
        ? context
            .read<TusZhoruCubit>()
            .tusZhoruT(page: 1, isFirstCall: true, isSaved: true)
        : context.read<TusZhoruCubit>().tusZhoruT(page: 1, isFirstCall: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TusZhoruCubit, TusZhoruState>(
      listener: (context, state) {
        switch (state) {
          case TusZhoruInitialPage(:final currentPage, :final tusZhoruList):
            setState(() {
              currentIndex = currentPage;
              itemsLength = tusZhoruList.length;
            });
            break;
          case TusZhoruLoadedState():
            context.router.push(const QuestionRoute());
            break;
          case TusZhoruLoadingState():
            isLoading = true;
            break;
          case TusZhoruErrorState(:final message):
            buildErrorCustomSnackBar(context, message);
            break;
        }
      },
      builder: (context, state) {
        if (state is TusZhoruErrorState) {
          return ActionResultPage.error(
            automaticallyImplyCloseButton: false,
            automaticallyImplyPopButton: false,
            content: state.message,
            bottom: AppButton(
              onTap: () {
                isSaved
                    ? context
                        .read<TusZhoruCubit>()
                        .tusZhoruT(page: 1, isFirstCall: true, isSaved: true)
                    : context
                        .read<TusZhoruCubit>()
                        .tusZhoruT(page: 1, isFirstCall: true);
              },
              text: context.tr('retry'),
            ),
          );
        }
        if (state is TusZhoruLoadingState) {
          return const Scaffold(
            backgroundColor: Color(0xFFECF5FF),
            body: Center(
              child: CircularProgressIndicator(color: AppColors.linearBlue),
            ),
          );
        }
        if (state is! TusZhoruInitialPage) {
          return const SizedBox.shrink();
        }

        final tusZhoruList = state.tusZhoruList;
        final currentIndex = state.currentIndex;
        final customTusZhoru = state.customTusZhoru;

        return Scaffold(
          floatingActionButton: currentIndex == 1
              ? isSaved
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
              FloatingActionButtonLocation.centerDocked,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          backgroundColor: const Color(0xFFECF5FF),
          body: TusZhoruCustomBody(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomAppBar(
                    title: isSaved
                        ? 'save_dream_interpretation'.tr()
                        : 'dream_interpretation'.tr(),
                    hideIcon: isSaved,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  SearchWidget(
                    onChanged: (value) {
                      log(value);

                      if (currentIndex == 0) {
                        value.isEmpty
                            ? context
                                .read<TusZhoruCubit>()
                                .tusZhoruT(page: 1, isFirstCall: true)
                            : context.read<TusZhoruCubit>().tusZhoruT(
                                search: value, page: 1, isFirstCall: true);
                      }
                      if (currentIndex == 1) {
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
                    tabs: [
                      Tab(
                        text: 'all'.tr(),
                      ),
                      Tab(
                        text: 'personal_dream'.tr(),
                      ),
                    ],
                    onTap: (int value) {
                      context
                          .read<TusZhoruCubit>()
                          .switchTab(value, isSaved ? 'save' : '');
                    },
                    length: 2,
                  ),
                  isLoading == true
                      ? CircularProgressIndicator.adaptive(
                          backgroundColor: AppColors.linearBlue,
                        )
                      : AnimatedCrossFade(
                          firstChild: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TusZhoruList(tusZhoruList: tusZhoruList),
                              if (ConstantHome.globalCountTusZhoru >
                                  itemsLength)
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child: const CircularProgressIndicator(
                                    color: AppColors.linearBlue,
                                  ),
                                )
                            ],
                          ),
                          secondChild:
                              CustomTusZhoruList(tusZhoruList: customTusZhoru),
                          crossFadeState: currentIndex == 0
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: Duration(milliseconds: 200)),

                  // tusZhoruList.currentIndex == 0
                  //     ? TusZhoruList(tusZhoruList: tusZhoruList.tusZhoruList)
                  //     : CustomTusZhoruList(
                  //         tusZhoruList: tusZhoruList.customTusZhoru),

                  SizedBox(
                    height: 105.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _scrollListener() async {
    if (ConstantHome.globalCountTusZhoru == itemsLength) {
      log(ConstantHome.globalCountTusZhoru.toString());
      log(itemsLength.toString());
      return;
    } else {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        currentIndex++;
        log('kolll----$currentIndex');
        await context
            .read<TusZhoruCubit>()
            .paginatedTusZhoru(page: currentIndex, isFirstCall: true);
        setState(() {});
      }
    }
  }

  int selectedIndex = -1;
}
