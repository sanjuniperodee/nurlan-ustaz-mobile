import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/app_dinamic_link.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/create_seminar_payment_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_detail_cubit.dart';

import 'package:share_plus/share_plus.dart';

@RoutePage()
class SeminarDetailPage extends StatefulWidget {
  final String? search;
  final int id;

  const SeminarDetailPage({super.key, this.search, required this.id});

  @override
  State<SeminarDetailPage> createState() => _SeminarDetailPageState();
}

class _SeminarDetailPageState extends State<SeminarDetailPage> {
  int _currentIndex = 0;
  late bool isFavorite;
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    BlocProvider.of<SeminarDetailCubit>(context).seminarDetail(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreateSeminarPaymentCubit,CreateSeminarPaymentState>(
        listener: (context,state){
          state.maybeWhen(orElse: (){},errorState: (message){
            buildErrorCustomSnackBar(context, message);
          });
        },
        child: BlocConsumer<SeminarDetailCubit, SeminarDetailState>(
          listener: (context, state) {
             state.maybeWhen(
                orElse: () {},
                errorState: (message) {
                  log('ggg');
                   buildErrorCustomSnackBar(context, message);
                });
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return const Center();
              },
              loadingState: () {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.linearBlue),
                );
              },
              loaded: (result) {
                     bool dt1 = DateTime.parse(result.startTime.toString())
                  .isBefore(DateTime.now());
                bool scroll = true;
                result.media!.length == 1 ? scroll = false : scroll = true;
                isFavorite = result.isSaved!;
                isLiked = result.isLiked!;
                likeCount = result.likesCount!;
                // final bool isPaid = result.isPurchased == true;
                return Stack(children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: scroll,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
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
                              imageUrl: i.file ?? 'assets/images/nur.png',
                              fit: BoxFit.cover,
                              width: 1.sw,
                              errorWidget: (a, b, c) => Image.asset(
                                    'assets/images/nur.png',
                                    fit: BoxFit.cover,
                                    width: 1.sw,
                                  ));
                        },
                      );
                    }).toList(),
                  ),
                  // result.media == null
                  //     ? const SizedBox()
                  //     : Positioned.fill(
                  //         top: 215.r,
                  //         child: Align(
                  //           alignment: Alignment.topCenter,
                  //           child: DotsIndicator(
                  //             dotsCount: result.media?.length ?? 1,
                  //             position: _currentIndex,
                  //             decorator: const DotsDecorator(
                  //               color: AppColors
                  //                   .grey2, // Color of non-selected indicators
                  //               activeColor: AppColors
                  //                   .white, // Color of selected indicator
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 259).r,
                        child: Container(
                          height: 1.sh,
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
                              Row(
                                children: [
                                  Row(

                                    children: [
                                      SvgPicture.asset(Assets.seminarCalendarSvg),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        '${DateFormat('d').format(DateTime.parse(result.startTime.toString()))}  ${DateFormat('MMMM').format(DateTime.parse(result.startTime.toString()))}, ${DateFormat('hh:mm').format(DateTime.parse(result.startTime.toString()).toLocal())}',
                                        style:
                                            getTextStyle(CustomTextStyles.s14w400)
                                                .apply(color: AppColors.grey2),
                                      ),
                                      SizedBox(
                                        width: 28.w,
                                      ),
                                      SvgPicture.asset(Assets.mapSvg),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        result.address ?? 'ERROR',
                                        style:
                                            getTextStyle(CustomTextStyles.s14w400)
                                                .apply(color: AppColors.grey2),
                                      ),
                                    ],
                                  ),
                                ],
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

                                                BlocProvider.of<
                                                            SeminarDetailCubit>(
                                                        context)
                                                    .seminarLike(
                                                        id: result.id ?? 0);
                                              });
                                              log(isLiked.toString());

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
                                                CommentRouteSem(id: result.id!),
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
                                                      .createSeminarLink(
                                                          widget.id);
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
                                          BlocProvider.of<SeminarDetailCubit>(
                                                  context)
                                              .seminarFavorite(
                                                  id: result.id ?? 0);
                                        });
                                      },
                                      child: SvgPicture.asset(isFavorite
                                          ? Assets.bookMark1Svg
                                          : Assets.bookMarkSvg))
                                ],
                              ),
                              SizedBox(
                                height: 39.h,
                              ),
                              result.free == true
                                  ? const SizedBox()
                                  : result.availableTicket! > 0 ? AppButton(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    30))),
                                                child: Container(
                                                  height: 289,
                                                  width: 311,
                                                  decoration: const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30)),
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            AppColors.blue,
                                                            AppColors.white
                                                          ],
                                                          begin:
                                                              Alignment.topCenter,
                                                          end: Alignment
                                                              .bottomCenter)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        height: 64,
                                                        width: 64,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .white),
                                                        child: Center(
                                                          child: SvgPicture.asset(
                                                              'assets/icons/money_transfer.svg'),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 31.h,
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 25),
                                                        child: Text(
                                                          'sem_buy_tick'.tr(),
                                                          style: getTextStyle(
                                                                  CustomTextStyles
                                                                      .s16w400)
                                                              .copyWith(
                                                                  fontFamily:
                                                                      FontTypes
                                                                          .SF_Pro
                                                                          .name),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      SizedBox(height: 27.h),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 16),
                                                        child: MaterialButton(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          27)),
                                                          height: 44,
                                                          onPressed: () async {
                                                            await BlocProvider.of<
                                                                        CreateSeminarPaymentCubit>(
                                                                    context)
                                                                .createSeminarPayment(
                                                                  result.id!,
                                                                  context,
                                                                )
                                                                .then((value) =>
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop());
                                                          },
                                                          color: AppColors.orange,
                                                          child: Center(
                                                            child: Text(
                                                                '${result.price!.toInt()} тг ${'dream_pay'.tr()}',
                                                                style: getTextStyle(
                                                                        CustomTextStyles
                                                                            .s14w400)
                                                                    .copyWith(
                                                                        fontFamily: FontTypes
                                                                            .SF_Pro
                                                                            .name,
                                                                        color: AppColors
                                                                            .white)),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      text: 'buy'.tr(),
                                      color: AppColors.blue,
                                    ) : Container(),
                              SizedBox(
                                height: 20.h,
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
                                    CommentRouteSem(id: result.id!),
                                  );
                                },
                                child: Text(
                                  '${'look_opinion'.tr()} (${result.comentCount})',
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
                            BlocProvider.of<SeminarCubit>(context)
                                .seminar(
                                  page: 1,
                                  isFirstCall: true,
                                  search: widget.search ?? '',
                                )
                                .then((value) => Navigator.pop(context));
                          },
                          child: SvgPicture.asset(Assets.backStackSvg))),
                ]);
              },
            );
          },
        ),
      ),
    );
  }
}
