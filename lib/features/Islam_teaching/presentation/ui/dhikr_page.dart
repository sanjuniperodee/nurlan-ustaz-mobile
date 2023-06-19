import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/dhikrs_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

class DhikrPage extends StatefulWidget {
  final String? type;
  const DhikrPage({super.key, this.type});

  @override
  State<DhikrPage> createState() => _DhikrPageState();
}

class _DhikrPageState extends State<DhikrPage> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  String searchText = '';
  List<ResultTeachingDTO> listOfDhikrs = [];
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    widget.type == 'isSave'
        ? BlocProvider.of<DhikrsCubit>(context)
            .dhikrs(page: 1, isFirstCall: true, isSaved: true)
        : BlocProvider.of<DhikrsCubit>(context)
            .dhikrs(page: 1, isFirstCall: true);
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
      body: BlocConsumer<DhikrsCubit, DhikrsState>(
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
              listOfDhikrs = news;
            },
          ); //
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return SizedBox(
                height: 1.sh,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.gradient,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        // left: 280.r,
                        top: 10.r,
                        child: Opacity(
                          opacity: 0.5,
                          child: Image.asset(
                            'assets/images/x.png',
                            // colorBlendMode: ,
                            // opacity: 0.1,
                            width: 1.sw,
                          ),
                        )),
                    SizedBox(
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 56.h,
                                ),
                                CustomAppBar(
                                  title: widget.type == 'isSave'
                                      ? 'Таңдаулы зікірлер'
                                      : 'Зікірлер',
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                SearchWidget(onChanged: (string) {
                                  searchText = string;
                                  if (string.isEmpty) {
                                    BlocProvider.of<DhikrsCubit>(context)
                                        .dhikrs(
                                      page: 1,
                                    );
                                  } else {
                                    BlocProvider.of<DhikrsCubit>(context)
                                        .dhikrs(page: 1, search: searchText);
                                  }
                                }),
                                ListView.builder(
                                  itemCount: listOfDhikrs.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.router.push(

                                            DhikrDetailPageRoute(
                                                result: listOfDhikrs[index]),

                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: ListTile(
                                            iconColor: AppColors.black,
                                            title: Text(
                                              listOfDhikrs[index].name ??
                                                  'ERROR',
                                              style: getTextStyle(
                                                  CustomTextStyles.s16w500),
                                            ),
                                            trailing: Image.asset(
                                              Assets.hand,
                                              height: 20.r,
                                              width: 20.r,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
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
      widget.type == 'isSave'
          ? BlocProvider.of<DhikrsCubit>(context)
              .dhikrs(page: page, isSaved: true)
          : BlocProvider.of<DhikrsCubit>(context).dhikrs(page: page);
    }
  }
}
