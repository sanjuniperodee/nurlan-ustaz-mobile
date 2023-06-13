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
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_fav_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_like_cubit.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailPage extends StatefulWidget {
  final ResultHomeDTO result;
  final bool isFav;
  const NewsDetailPage({super.key, required this.result, required this.isFav});

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
    isFavorite = widget.isFav;
    isLiked = widget.result.isLiked!;
    likeCount = widget.result.likesCount!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, _) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.result.media!.map((i) {
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
        Positioned.fill(
          top: 210.r,
          child: Align(
            alignment: Alignment.topCenter,
            child: DotsIndicator(
              dotsCount: widget.result.media?.length ?? 0,
              position: _currentIndex,
              decorator: DotsDecorator(
                color: AppColors.white, // Color of non-selected indicators
                activeColor: AppColors.grey1, // Color of selected indicator
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
              padding: const EdgeInsets.only(top: 239).r,
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(30).r,
                      topLeft: const Radius.circular(30).r,
                    )),
                padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.result.title ?? 'ERROR',
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
                                    BlocProvider.of<NewsLikeCubit>(context)
                                        .newsLike(id: widget.result.id ?? 0);
                                    isLiked = !isLiked;
                                    if (isLiked == true) {
                                      likeCount += 1;
                                    } else {
                                      likeCount -= 1;
                                    }

                                    setState(() {});
                                  },
                                  child: SvgPicture.asset(isLiked
                                      ? Assets.heartSvg
                                      : Assets.heart1Svg)),
                              Text(
                                likeCount.toString(),
                                style: getTextStyle(CustomTextStyles.s14w400),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              SvgPicture.asset(Assets.commentSvg),
                              Text(
                                widget.result.comentCount.toString(),
                                style: getTextStyle(CustomTextStyles.s14w400),
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              InkWell(
                                  onTap: () {
                                    Share.share('Hello',
                                        subject: 'Nurlan_ustaz');
                                  },
                                  child: SvgPicture.asset(Assets.shareSvg)),
                            ],
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              BlocProvider.of<NewsFavCubit>(context)
                                  .newsFav(id: widget.result.id ?? 0);
                              isFavorite = !isFavorite;
                              setState(() {});
                            },
                            child: SvgPicture.asset(isFavorite
                                ? Assets.bookMarkSvg
                                : Assets.bookMark1Svg))
                      ],
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Text(
                      widget.result.text ?? 'ERROR',
                      style: getTextStyle(CustomTextStyles.s16w400)
                          .apply(color: AppColors.black),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(
                          const CommentPageRoute(),
                        );
                      },
                      child: Text(
                        'Пікірлерді көру ${widget.result.comentCount}',
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
      ]),
    );
  }
}
