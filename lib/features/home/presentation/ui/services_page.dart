import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
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

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

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
    // TODO: implement initState
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
              'Жоғарыдағы қызметтердің бірін таңдап, батырманы басыңыз',
              textAlign: TextAlign.center,
              style: getTextStyle(CustomTextStyles.s16w400)
                  .copyWith(fontFamily: FontTypes.SF_Pro.name),
            ),
            SizedBox(
              height: 24.h,
            ),
            BlocConsumer<PostServiceCubit, PostServiceState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  loaded: (url) {
                    _launchUrl(url);
                  },
                );
                // TODO: implement listener
              },
              builder: (context, state) {
                return AppButton(
                  onTap: () {
                    if (id.isEmpty) {
                      buildErrorCustomSnackBar(context, 'ERROR');
                      return;
                    }
                    BlocProvider.of<PostServiceCubit>(context).postService(
                      id: id,
                    );
                  },
                  text: 'Өтініш қалдыру',
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
            loaded: (services) {
              isLoadingMore = false;
              listOfServices = services;
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
                        title: 'Қызметтер',
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
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
                                          listOfServices[index].title ??
                                              'ERROR',
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
                                        if (id.contains(
                                            listOfServices[index].id)) {
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
                        height: 144.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }, loadingState: () {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
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
      BlocProvider.of<ServicesCubit>(context).services(page: page);
    }
  }

  Future<void> _launchUrl(String _urll) async {
    final Uri _url = Uri.parse('${_urll}');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}