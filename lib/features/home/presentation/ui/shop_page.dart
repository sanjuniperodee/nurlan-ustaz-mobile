import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/partners_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  void initState() {
    BlocProvider.of<PartnersCubit>(context).partners();

    super.initState();
  }

  RefreshController controller = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<PartnersCubit, PartnersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(
            loadingState: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.orange,
                ),
              );
            },
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
            },
            loaded: (partners) {
              final topPartners = partners.where((element) => element.isTop == true).toList();
              final otherPartners = partners.where((element) => element.isTop == false).toList();
              log(partners.toList().toString());
              return GlobalCustomBody(
                child: SizedBox(
                  child: SmartRefresher(
                    onRefresh: () => context.read<PartnersCubit>().partners(),
                    controller: controller,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                           CustomAppBar(
                            title: 'shop'.tr(),
                          ),
                          SizedBox(
                            height: 36.h,
                          ),
                          Text(
                            'top'.tr(),
                            style: getTextStyle(CustomTextStyles.s20w700)
                                .apply(color: AppColors.white),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          GridView.builder(
                            itemCount:topPartners
                                .length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (topPartners[index].logo == null) {
                                return Container(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      topPartners[index].name ?? 'ERROR',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFEEDCC),

                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                );
                              }

                              return ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12))
                                        .r,
                                child: InkWell(
                                  onTap: () {
                                    _launchUrl(topPartners[index].url ?? '');
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl: topPartners[index].logo ?? '',
                                    fit: BoxFit.cover,
                                    height: 55.h,
                                    width: 55.w,
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            'all'.tr(),
                            style: getTextStyle(CustomTextStyles.s20w700)
                                .apply(color: AppColors.black),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          GridView.builder(
                            itemCount:otherPartners
                                .length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 20.0,
                              mainAxisSpacing: 20.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (otherPartners[index].logo == null) {
                                return Container(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                    child: Text(
                                      otherPartners[index].name ?? 'ERROR',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFEEDCC),

                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                );
                              }
                              return ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12))
                                        .r,
                                child: InkWell(
                                  onTap: () {
                                    _launchUrl(otherPartners[index].url ?? '');
                                  },
                                  child:  CachedNetworkImage(
                                          imageUrl: otherPartners[index].logo ?? '',
                                          fit: BoxFit.cover,
                                          height: 55.h,
                                          width: 55.w,

                                        )

                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String _urll) async {
    final Uri _url = Uri.parse('${_urll}');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
