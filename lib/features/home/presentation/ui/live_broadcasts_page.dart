import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/lives_fav_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/assets.dart';

@RoutePage()
class LiveBroadcastsPage extends StatefulWidget {
  final String? type;
  const LiveBroadcastsPage({Key? key, this.type}) : super(key: key);

  @override
  State<LiveBroadcastsPage> createState() => _LiveBroadcastsPageState();
}

class _LiveBroadcastsPageState extends State<LiveBroadcastsPage> {
  int selectedIndex = -1;
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  String searchText = '';
  List<ResultHomeDTO> listOfLives = [];
  bool isLoadingMore = false;
  List<bool> listOfFav = [];
  @override
  void initState() {
    // TODO: implement initState
    widget.type == 'isSave'
        ? BlocProvider.of<LivesCubit>(context)
            .lives(page: 1, isFirstCall: true, isSaved: true)
        : BlocProvider.of<LivesCubit>(context)
            .lives(page: 1, isFirstCall: true);
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
      body: BlocConsumer<LivesCubit, LivesState>(
        listener: (context, state) {
          isLoadingMore = state is LivesLoadingMoreState;
          if (state is LivesLoadedState) {
            listOfLives = state.lives;
            listOfFav.clear();
            listOfLives.forEach(
              (element) {
                listOfFav.add(element.isSaved!);
              },
            );

            setState(() {});
          } else if (state is LivesErrorState) {
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
                          ? 'Favourite_lives'.tr()
                          : 'lives'.tr(),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    SearchWidget(
                      onChanged: (string) {
                        searchText = string;
                        if (string.isEmpty) {
                          BlocProvider.of<LivesCubit>(context)
                              .lives(page: 1, isFirstCall: true);
                        } else {
                          BlocProvider.of<LivesCubit>(context).lives(
                              page: 1, search: searchText, isFirstCall: true);
                        }
                      },
                    ),
                    ListView.builder(
                      itemCount: listOfLives.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.r),
                          child: GestureDetector(
                            onTap: () {
                              _launchUrl(listOfLives[index].link ?? 'ERROR');
                            },
                            child: Container(
                              height: 164.h,
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
                                  Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 2,
                                                color:
                                                    listOfLives[index].isLive!
                                                        ? Colors.red
                                                        : Colors.transparent)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: SizedBox(
                                            height: 142.h,
                                            width: 84.w,
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                            Radius.circular(13))
                                                        .r,
                                                child: Image.network(
                                                  listOfLives[index].cover ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: SvgPicture.asset(
                                                  Assets.playSvg)))
                                    ],
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
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              listOfLives[index].isLive!
                                                  ? Container(
                                                      width: 47.w,
                                                      // height: 20.h,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8)),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5,
                                                          horizontal: 8),
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.play_arrow,
                                                            size: 15,
                                                            color:
                                                                AppColors.white,
                                                          ),
                                                          Text(
                                                            'LIVE',
                                                            style: getTextStyle(
                                                                    CustomTextStyles
                                                                        .s8w700)
                                                                .apply(
                                                                    color: AppColors
                                                                        .white),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Text(
                                                      DateFormat('dd.MM.yyyy')
                                                          .format(
                                                        DateTime.parse(
                                                            listOfLives[index]
                                                                .startTime
                                                                .toString()),
                                                      ),
                                                      // '10.02.2023',
                                                      style: getTextStyle(
                                                              CustomTextStyles
                                                                  .s12w400)
                                                          .apply(
                                                              color: AppColors
                                                                  .grey1),
                                                    ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Text(
                                                listOfLives[index].title ??
                                                    'ERROR',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s16w500)
                                                    .apply(
                                                        color: AppColors.black),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                listOfLives[index]
                                                        .description ??
                                                    'ERROR',
                                                textAlign: TextAlign.start,
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s12w400)
                                                    .apply(
                                                        color: AppColors.grey2),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              BlocProvider.of<LivesFavCubit>(
                                                      context)
                                                  .livesFav(
                                                      id: listOfLives[index]
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
          ? BlocProvider.of<LivesCubit>(context)
              .lives(page: page, isSaved: true)
          : BlocProvider.of<LivesCubit>(context).lives(page: page);
    }
  }

  Future<void> _launchUrl(String _urll) async {
    final Uri _url = Uri.parse('${_urll}');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
