import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_names_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../app/presentation/widgets/custom_tab_bar.dart';

class NamePage extends StatefulWidget {
  final String? type;
  const NamePage({super.key, this.type});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  int currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  String searchText = '';
  bool isLoadingMore = false;
  List<ResultTeachingDTO> listOfIslamNames = [];
  @override
  void initState() {
    // TODO: implement initState
    widget.type == 'isSave'
        ? BlocProvider.of<IslamNamesCubit>(context)
            .islamNamesMan(page: 1, isFirstCall: true, isSaved: true)
        : BlocProvider.of<IslamNamesCubit>(context)
            .islamNamesMan(page: 1, isFirstCall: true);
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<IslamNamesCubit, IslamNamesState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {
              isLoadingMore = false;
            },
            errorState: (message) {
              isLoadingMore = false;
              buildErrorCustomSnackBar(context, message);
            },
            loadingMoreState: () {
              isLoadingMore = true;
            },
            loaded: (islam) {
              isLoadingMore = false;
              listOfIslamNames = islam;
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return SizedBox(
                height: 1.sh,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.gradient,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        // left: 280.r,
                        top: 10.r,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/x.png',
                            // colorBlendMode: ,
                            // opacity: 0.1,
                            width: 1.sw,
                          ),
                        )),
                    SizedBox(
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: _scrollController,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 56.h,
                                ),
                                CustomAppBar(
                                  title: widget.type == 'isSave'
                                      ? 'Таңдаулы eсімдер мағынасы'
                                      : 'Есімдер мағынасы',
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                SearchWidget(onChanged: (string) {
                                  searchText = string;
                                  if (string.isEmpty) {
                                    if (currentIndex == 0) {
                                      log(1.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamNamesMan(page: 1);
                                    } else {
                                      log(2.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamWoman(page: 1);
                                    }
                                  } else {
                                    if (currentIndex == 0) {
                                      log(1.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamNamesMan(
                                              page: 1, search: searchText);
                                    } else {
                                      log(2.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamWoman(
                                              page: 1, search: searchText);
                                    }
                                  }
                                }),
                                SizedBox(
                                  height: 22.h,
                                ),
                                CustomTabBar(
                                  tabs: const [
                                    Tab(
                                      text: 'Ер',
                                    ),
                                    Tab(
                                      text: 'Әйел',
                                    ),
                                  ],
                                  onTap: (int) {
                                    log('INDEX:::${currentIndex.toString()}');
                                    if (currentIndex != 0) {
                                      log(1.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamNamesMan(
                                              page: 1,
                                              search: searchText.isNotEmpty
                                                  ? searchText
                                                  : null);
                                    } else {
                                      log(2.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamWoman(
                                              page: 1,
                                              search: searchText.isNotEmpty
                                                  ? searchText
                                                  : null);
                                    }
                                    currentIndex = int;
                                  },
                                  length: 2,
                                ),
                                ListView.builder(
                                  itemCount: listOfIslamNames.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(top:8),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                            NameDetailPageRoute(
                                                index: currentIndex,
                                                id: listOfIslamNames[index]
                                                    .id!),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: ListTile(
                                              iconColor: AppColors.black,
                                              title: Text(
                                                listOfIslamNames[index].name ??
                                                    'ERROR',
                                                style: getTextStyle(
                                                    CustomTextStyles.s16w500),
                                              ),
                                              subtitle: Text(
                                                listOfIslamNames[index]
                                                        .description ??
                                                    'ERROR',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s14w400)
                                                    .apply(
                                                        color: AppColors.grey2),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              trailing: const Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: AppColors.orange,
                                              )),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                isLoadingMore
                                    ? const Align(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator())
                                    : const SizedBox(),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              );
            },
            // loadingState: () {
            //   return const Center(
            //     child: CircularProgressIndicator(
            //       color: Colors.yellow,
            //     ),
            //   );
            // },
          );
        },
      ),
    );
  }

  void _scrollListener() {
    if (isLoadingMore) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      if (currentIndex == 0) {
        widget.type == 'isSave'
            ? BlocProvider.of<IslamNamesCubit>(context)
                .islamNamesMan(page: page, isSaved: true)
            : BlocProvider.of<IslamNamesCubit>(context)
                .islamNamesMan(page: page);
      } else {
        log(2.toString());
        widget.type == 'isSave'
            ? BlocProvider.of<IslamNamesCubit>(context)
                .islamWoman(page: page, isSaved: true)
            : BlocProvider.of<IslamNamesCubit>(context).islamWoman(page: page);
      }
    }
  }
}
