import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/charities_cubit.dart';

@RoutePage()
class CharityPage extends StatefulWidget {
  const CharityPage({Key? key}) : super(key: key);

  @override
  State<CharityPage> createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  List<ResultHomeDTO> listOfCharity = [];
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CharitiesCubit>(context)
        .charities(page: 1, isFirstCall: true);
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
      body: BlocConsumer<CharitiesCubit, CharitiesState>(
        listener: (context, state) {
          isLoadingMore = state is CharitiesLoadingMoreState;
          if (state is CharitiesLoadedState) {
            listOfCharity = state.charities;
          } else if (state is CharitiesErrorState) {
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
                      title: 'Charity'.tr(),
                    ),
                    ListView.builder(
                      itemCount: listOfCharity.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 12.r),
                          child: GestureDetector(
                            onTap: () {
                              context.router.push(
                                CharityDetailRoute(
                                    result: listOfCharity[index]),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20).r),
                              padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 12)
                                  .r,
                              child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                            Radius.circular(12))
                                        .r,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          listOfCharity[index].cover ?? '',
                                      fit: BoxFit.cover,
                                      height: 65.h,
                                      width: 55.w,
                                      errorWidget: (a, b, c) => SizedBox(
                                        width: 55.w,
                                        height: 55.h,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    listOfCharity[index].title ?? 'ERROR',
                                    textAlign: TextAlign.left,
                                    style:
                                        getTextStyle(CustomTextStyles.s16w500)
                                            .apply(color: AppColors.black),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.orange,
                                  )),
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
      BlocProvider.of<CharitiesCubit>(context).charities(page: page);
    }
  }
}
