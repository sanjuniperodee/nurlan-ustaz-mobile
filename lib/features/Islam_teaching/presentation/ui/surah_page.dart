import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../../../../core/router/app_router.dart';

@RoutePage()
class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  String searchText = '';
  List<ResultTeachingDTO> listOfSurah = [];
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SurahCubit>(context).sura(page: 1, isFirstCall: true);
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
      body: BlocConsumer<SurahCubit, SurahState>(
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
            loaded: (news) {
              isLoadingMore = false;
              listOfSurah = news;
            },
          ); //
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
                                  title: 'Surahs'.tr(),
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                SearchWidget(onChanged: (string) {
                                  searchText = string;
                                  if (string.isEmpty) {
                                    BlocProvider.of<SurahCubit>(context).sura(
                                      page: 1,
                                    );
                                  } else {
                                    BlocProvider.of<SurahCubit>(context)
                                        .sura(page: 1, search: searchText);
                                  }
                                }),
                                ListView.builder(
                                  itemCount: listOfSurah.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                            SurahDetailRoute(
                                                result: listOfSurah[index]),
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
                                              listOfSurah[index].name ??
                                                  'ERROR',
                                              style: getTextStyle(
                                                  CustomTextStyles.s16w400),
                                            ),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: AppColors.black,
                                            ),
                                          ),
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
      BlocProvider.of<SurahCubit>(context).sura(page: page);
    }
  }
}
