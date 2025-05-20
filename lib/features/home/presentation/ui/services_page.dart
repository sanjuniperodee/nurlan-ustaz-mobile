import 'package:auto_route/auto_route.dart';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/media_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/post_service_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/services_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/assets.dart';

@RoutePage()
class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int selectedIndex = -1;
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  List<int> id = [];
  List<MediaDTO> listOfServices = [];
  bool isLoadingMore = false;
  @override
  void initState() {
    BlocProvider.of<ServicesCubit>(context)
        .services(page: 1, isFirstCall: true);
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.lightBlue,
      bottomSheet: Container(
        padding: const EdgeInsets.only(
          // top: 35.0,
          left: 16,
          right: 16,
        ).r,
        height: 160.h,
        color: AppColors.lightBlue,
        child: Column(
          children: [
            SizedBox(
              height: 22.h,
            ),
            Text(
              'above'.tr(),
              textAlign: TextAlign.center,
              style: getTextStyle(CustomTextStyles.s16w400)
                  .copyWith(fontFamily: FontTypes.SFPro.name),
            ),
            SizedBox(
              height: 24.h,
            ),
            BlocConsumer<PostServiceCubit, PostServiceState>(
              listener: (context, state) {
                if (state is PostServiceLoadedState) {
                  _launchUrl(state.url);

                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return AppButton(
                  isActive: id.isNotEmpty,
                  onTap: () {
                    id.isNotEmpty
                        ? BlocProvider.of<PostServiceCubit>(context)
                            .postService(
                            id: id,
                          )
                        : null;
                  },
                  text: 'leave_req'.tr(),
                  // color: AppColors.blue,
                );
              },
            ),
            SizedBox(
              height: 22.h,
            ),
          ],
        ),
      ),
      body: BlocConsumer<ServicesCubit, ServicesState>(
        listener: (context, state) {
          isLoadingMore = state is ServicesLoadingMoreState;
          if (state is ServicesLoadedState) {
            listOfServices = state.media;
          } else if (state is ServicesErrorState) {
            buildErrorCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is ServicesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.linearBlue,
              ),
            );
          }

          return GlobalCustomBody(
            child: SizedBox(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomAppBar(
                      title: 'Services'.tr(),
                    ),
                    ListView.builder(
                      itemCount: listOfServices.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 12.r),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20).r),
                            padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 12)
                                .r
                                .r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.orange,
                                          borderRadius:
                                              BorderRadius.circular(12).r),
                                      padding: const EdgeInsets.all(10).r,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            listOfServices[index].icon ?? '',
                                        fit: BoxFit.cover,
                                        width: 55.w,
                                        height: 55.h,
                                        errorWidget: (a, b, c) => SizedBox(
                                          width: 55.w,
                                          height: 55.h,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    SizedBox(
                                      width: 210.w,
                                      child: Text(
                                        listOfServices[index].title ?? 'ERROR',
                                        overflow: TextOverflow.ellipsis,
                                        style: getTextStyle(
                                                CustomTextStyles.s16w500)
                                            .apply(color: AppColors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      if (id
                                          .contains(listOfServices[index].id)) {
                                        id.remove(listOfServices[index].id);
                                      } else {
                                        id.add(listOfServices[index].id);
                                      }
                                      setState(() {});
                                      log(id.toString());
                                    },
                                    child: id.contains(
                                      listOfServices[index].id,
                                    )
                                        ? SvgPicture.asset(Assets.radioOnSvg)
                                        : SvgPicture.asset(
                                            Assets.radioCircleSvg))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 150.h,
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
      BlocProvider.of<ServicesCubit>(context).services(page: page);
    }
  }

  Future<void> _launchUrl(String urll) async {
    final Uri url = Uri.parse(urll);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
