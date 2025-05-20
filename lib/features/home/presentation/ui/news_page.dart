import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_fav_cubit.dart';

@RoutePage()
class NewsPage extends StatefulWidget {
  final String? type;
  const NewsPage({super.key, this.type});

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
  List<bool> listOfFav = [];
  @override
  void initState() {
    widget.type == 'isSave'
        ? BlocProvider.of<NewsCubit>(context)
            .news(page: 1, isFirstCall: true, isSaved: true)
        : BlocProvider.of<NewsCubit>(context).news(page: 1, isFirstCall: true);
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
          isLoadingMore = state is NewsLoadingMoreState;
          if (state is NewsLoadedState) {
            listOfNews = state.news;
            listOfFav.clear();
            for (var element in listOfNews) {
              listOfFav.add(element.isSaved!);
            }

            setState(() {});
          } else if (state is NewsErrorState) {
            buildErrorCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return GlobalCustomBody(
            child: SizedBox(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomAppBar(
                      title: widget.type == 'isSave'
                          ? 'Favourite_news'.tr()
                          : 'news'.tr(),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    SearchWidget(
                      onChanged: (string) {
                        searchText = string;
                        if (string.isEmpty) {
                          BlocProvider.of<NewsCubit>(context)
                              .news(page: 1, isFirstCall: true);
                        } else {
                          BlocProvider.of<NewsCubit>(context).news(
                              page: 1, search: searchText, isFirstCall: true);
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
                                NewsDetailRoute(
                                  id: listOfNews[index].id!,
                                  search: searchText,
                                ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                            Radius.circular(12))
                                        .r,
                                    child: CachedNetworkImage(
                                      imageUrl: listOfNews[index].cover ?? '',
                                      fit: BoxFit.cover,
                                      height: 100.h,
                                      width: 100.w,
                                      errorWidget: (a, b, c) => SizedBox(
                                        height: 100.h,
                                        width: 100.w,
                                      ),
                                    ),
                                  ),
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
                                              DateFormat('dd.MM.yyyy').format(
                                                  DateTime.parse(
                                                      listOfNews[index]
                                                          .createdAt
                                                          .toString())),
                                              style: getTextStyle(
                                                      CustomTextStyles.s12w400)
                                                  .apply(
                                                      color: AppColors.grey1),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Flexible(
                                              child: SizedBox(
                                                width: 190.w,
                                                child: Text(
                                                  listOfNews[index].title ??
                                                      'ERROR',
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s16w500)
                                                      .apply(
                                                          color:
                                                              AppColors.black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              BlocProvider.of<NewsFavCubit>(
                                                      context)
                                                  .newsFav(
                                                      id: listOfNews[index]
                                                              .id ??
                                                          0);
                                              listOfFav[index] =
                                                  !listOfFav[index];

                                              setState(() {});
                                            },
                                            child: listOfFav[index]
                                                ? SvgPicture.asset(
                                                    Assets.bookMark1Svg)
                                                : SvgPicture.asset(
                                                    Assets.bookMarkSvg)),
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
      ),
    );
  }

  void _scrollListener() {
    if (isLoadingMore) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      widget.type == 'isSave'
          ? BlocProvider.of<NewsCubit>(context).news(page: page, isSaved: true)
          : BlocProvider.of<NewsCubit>(context).news(page: page);
    }
  }
}
