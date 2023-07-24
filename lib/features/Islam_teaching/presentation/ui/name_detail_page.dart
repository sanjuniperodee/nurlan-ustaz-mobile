import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_name_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_names_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/app_dinamic_link.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:share_plus/share_plus.dart';
import '../widgets/floating_container_widget.dart';

class NameDetailPage extends StatefulWidget {
  final int id;
  final int? index;
  const NameDetailPage({super.key, required this.id, this.index});

  @override
  State<NameDetailPage> createState() => _NameDetailPageState();
}

class _NameDetailPageState extends State<NameDetailPage> {
  late bool isFavorite;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<IslamNameDetailCubit>(context)
        .islamNameDetail(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocBuilder<IslamNameDetailCubit, IslamNameDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center();
            },
            loaded: (result) {
              isFavorite = result.isSaved!;
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 56.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: CustomAppBar(
                                  title: result.name ?? 'ERROR',
                                  onTap: () {
                                    if (widget.index == 0) {
                                      log(1.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamNamesMan(
                                              page: 1, isFirstCall: true)
                                          .then((value) =>
                                              Navigator.pop(context));
                                    } else {
                                      log(2.toString());
                                      BlocProvider.of<IslamNamesCubit>(context)
                                          .islamWoman(
                                              page: 1, isFirstCall: true)
                                          .then((value) =>
                                              Navigator.pop(context));
                                    }
                                    log(widget.index.toString());
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 26.h,
                              ),
                              Container(
                                  height: 1.sh,
                                  decoration: BoxDecoration(
                                      color: AppColors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(24)),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        result.name ?? 'ERROR',
                                        style: getTextStyle(
                                            CustomTextStyles.s20w700),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Text(
                                        result.description ?? 'ERROR',
                                        style: getTextStyle(
                                            CustomTextStyles.s16w400),
                                      ),
                                      SizedBox(
                                        height: 14.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FloatinContainerWidget(
                                            text: 'Таңдаулы',
                                            onTap: () {
                                              BlocProvider.of<
                                                          IslamNameDetailCubit>(
                                                      context)
                                                  .islamNameFavorite(
                                                      id: result.id ?? 0);
                                              isFavorite = !isFavorite;
                                              setState(() {});
                                            },
                                            url: isFavorite
                                                ? Assets.bookMark1Svg
                                                : Assets.bookMarkSvg,
                                          ),
                                          FloatinContainerWidget(
                                            color: 'asdf',
                                            onTap: () async {
                                              String unguessableDynamicLink =
                                                  await DynamicLink()
                                                      .createNamesLink(
                                                          result.id!);
                                              await Share.share(
                                                unguessableDynamicLink,
                                              );
                                            },
                                            text: 'Бөлісу',
                                            url: Assets.shareSvg,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
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
}
