import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/app_dinamic_link.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_like_cubit.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailPage extends StatefulWidget {
  final int id;

  const NewsDetailPage({super.key, required this.id});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  int _currentIndex = 0;
  late bool isFavorite;
  late bool isLiked;
  late int likeCount;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<NewsDetailCubit>(context).newsDetail(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsDetailCubit, NewsDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center();
            },
            loaded: (result) {
              isFavorite = result.isSaved!;
              isLiked = result.isLiked!;
              likeCount = result.likesCount!;
              return Stack(children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    aspectRatio: 17 / 13,
                    onPageChanged: (index, _) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: result.media!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return CachedNetworkImage(
                          imageUrl: i.file ?? '',
                          fit: BoxFit.cover,
                          width: 1.sw,
                          errorWidget: (a, b, c) => SizedBox(
                            height: 80.h,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                result.media == null
                    ? const SizedBox()
                    : Positioned.fill(
                        top: 215.r,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: DotsIndicator(
                            dotsCount: result.media?.length ?? 0,
                            position: _currentIndex,
                            decorator: const DotsDecorator(
                              color: AppColors
                                  .grey2, // Color of non-selected indicators
                              activeColor: AppColors
                                  .white, // Color of selected indicator
                            ),
                          ),
                        ),
                      ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 259).r,
                      child: Container(
                        width: 1.sw,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topRight: const Radius.circular(30).r,
                              topLeft: const Radius.circular(30).r,
                            )),
                        padding: EdgeInsets.symmetric(
                            vertical: 16.r, horizontal: 16.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              result.title ?? 'ERROR',
                              style: getTextStyle(CustomTextStyles.s20w700)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              'Меккеде қазақстандық жұп неке қидырды',
                              style: getTextStyle(CustomTextStyles.s14w400)
                                  .apply(color: AppColors.grey2),
                            ),
                            SizedBox(
                              height: 23.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              isLiked = !isLiked;

                                              BlocProvider.of<NewsDetailCubit>(
                                                      context)
                                                  .newsLike(id: result.id ?? 0);
                                            });

                                            if (isLiked == true) {
                                              likeCount += 1;
                                            } else {
                                              likeCount -= 1;
                                            }
                                          },
                                          child: isLiked
                                              ? SvgPicture.asset(
                                                  Assets.heartSvg,
                                                )
                                              : SvgPicture.asset(
                                                  Assets.heart1Svg,
                                                  color: AppColors.black,
                                                )),
                                      Text(
                                        likeCount.toString(),
                                        style: getTextStyle(
                                            CustomTextStyles.s14w400),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            context.router.push(
                                              CommentPageNewsRoute(
                                                  id: result.id!),
                                            );
                                          },
                                          child: SvgPicture.asset(
                                              Assets.commentSvg)),
                                      Text(
                                        result.comentCount.toString(),
                                        style: getTextStyle(
                                            CustomTextStyles.s14w400),
                                      ),
                                      SizedBox(
                                        width: 12.w,
                                      ),
                                      InkWell(
                                          onTap: () async {
                                            String unguessableDynamicLink =
                                                await DynamicLink()
                                                    .createNewsLink(result.id!);
                                            await Share.share(
                                              unguessableDynamicLink,
                                            );
                                          },
                                          child: SvgPicture.asset(
                                              Assets.shareSvg)),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFavorite = !isFavorite;
                                        BlocProvider.of<NewsDetailCubit>(
                                                context)
                                            .newsFavorite(id: result.id ?? 0);
                                      });
                                    },
                                    child: SvgPicture.asset(isFavorite
                                        ? Assets.bookMark1Svg
                                        : Assets.bookMarkSvg))
                              ],
                            ),
                            SizedBox(
                              height: 21.h,
                            ),
                            Text(
                              result.text ?? 'ERROR',
                              style: getTextStyle(CustomTextStyles.s16w400)
                                  .apply(color: AppColors.black),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                context.router.push(
                                  CommentPageNewsRoute(id: result.id!),
                                );
                              },
                              child: Text(
                                'Пікірлерді көру ${result.comentCount}',
                                style: getTextStyle(CustomTextStyles.s16w400)
                                    .apply(color: AppColors.grey1),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Positioned(
                    top: 54.r,
                    left: 16.r,
                    child: GestureDetector(
                        onTap: () {
                          BlocProvider.of<NewsCubit>(context)
                              .news(page: 1, isFirstCall: true)
                              .then((value) => Navigator.pop(context));
                        },
                        child: SvgPicture.asset(Assets.backStackSvg))),
              ]);
            },
          );
        },
      ),
    );
  }
}
