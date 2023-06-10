import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/seminar_cubit.dart';

class SeminarPage extends StatefulWidget {
  const SeminarPage({Key? key}) : super(key: key);

  @override
  State<SeminarPage> createState() => _SeminarPageState();
}

class _SeminarPageState extends State<SeminarPage> {
  int selectedIndex = -1;
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  String searchText = '';
  List<ResultHomeDTO> listOfSeminars = [];
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SeminarCubit>(context).seminar(page: 1, isFirstCall: true);
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
      body: BlocConsumer<SeminarCubit, SeminarState>(
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
            loaded: (seminar) {
              isLoadingMore = false;
              listOfSeminars = seminar;
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return GlobalCustomBody(
              child: SizedBox(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const CustomAppBar(
                        title: 'Семинар',
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      SearchWidget(
                        onChanged: (string) {
                          searchText = string;
                          if (string.isEmpty) {
                            BlocProvider.of<SeminarCubit>(context).seminar(
                              page: 1,
                            );
                          } else {
                            BlocProvider.of<SeminarCubit>(context)
                                .seminar(page: 1, search: searchText);
                          }
                        },
                      ),
                      ListView.builder(
                        itemCount: listOfSeminars.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 20.r),
                            child: GestureDetector(
                              onTap: () {
                                context.router.push(
                                  const SeminarDetailPageRoute(),
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
                                        imageUrl:
                                            listOfSeminars[index].cover ?? '',
                                        fit: BoxFit.cover,
                                        height: 100.h,
                                        width: 80.w,
                                        errorWidget: (a, b, c) => SizedBox(
                                          width: 100.w,
                                          height: 80.h,
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
                                                '10.02.2023',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s12w400)
                                                    .apply(
                                                        color: AppColors.grey1),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Text(
                                                listOfSeminars[index].title ??
                                                    'ERROR',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s16w500)
                                                    .apply(
                                                        color: AppColors.black),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedIndex = index;
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
          });
        },
      ),
    );
  }

  void _scrollListener() {
    if (isLoadingMore) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      BlocProvider.of<SeminarCubit>(context).seminar(page: page);
    }
  }
}
