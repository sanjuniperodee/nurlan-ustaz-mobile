import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int selectedIndex = -1;
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  String searchText = '';
  List<ResultHomeDTO> listOfNews = [];
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<NewsCubit>(context).news(page: 1, isFirstCall: true);
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
      body: BlocConsumer<NewsCubit, NewsState>(
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
              listOfNews = news;
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return GlobalCustomBody(
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const CustomAppBar(
                          title: 'Жаңалықтар',
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        SearchWidget(
                          onChanged: (string) {
                            searchText = string;
                            if (string.isEmpty) {
                              BlocProvider.of<NewsCubit>(context).news(
                                page: 1,
                              );
                            } else {
                              BlocProvider.of<NewsCubit>(context)
                                  .news(page: 1, search: searchText);
                            }
                          },
                        ),
                        ListView.builder(
                          itemCount: listOfNews.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20.r),
                              child: GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    NewsDetailPageRoute(
                                        result: listOfNews[index]),
                                  );
                                },
                                child: Container(
                                  height: 116.h,
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.r, horizontal: 8.r),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/seminar.png'),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      Expanded(
                                        // width: 240.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '10.02.2023',
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s12w400)
                                                      .apply(
                                                          color:
                                                              AppColors.grey1),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  listOfNews[index].title ??
                                                      'ERROR',
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s16w500)
                                                      .apply(
                                                          color:
                                                              AppColors.black),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    // selectedIndex = index;
                                                  });
                                                },
                                                child: selectedIndex != index
                                                    ? SvgPicture.asset(
                                                        Assets.bookMarkSvg)
                                                    : SvgPicture.asset(
                                                        Assets.bookMark1Svg)),
                                          ],
                                        ),
                                      ),
                                    ],
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
                  ),
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
      BlocProvider.of<NewsCubit>(context).news(page: page);
    }
  }
}
