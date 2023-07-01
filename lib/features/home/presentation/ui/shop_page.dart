import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/partners_cubit.dart';
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
              return GlobalCustomBody(
                child: SizedBox(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const CustomAppBar(
                          title: 'Дүңгіршек',
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        Text(
                          'ТОП',
                          style: getTextStyle(CustomTextStyles.s20w700)
                              .apply(color: AppColors.white),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GridView.builder(
                          itemCount: partners
                              .where((element) => element.isTop!)
                              .toList()
                              .length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)).r,
                              child: CachedNetworkImage(
                                imageUrl: partners[index].logo ?? '',
                                fit: BoxFit.cover,
                                height: 55.h,
                                width: 55.w,
                                errorWidget: (a, b, c) => Container(
                                  color: AppColors.danger,
                                  width: 55.w,
                                  height: 55.h,
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Барлығы',
                          style: getTextStyle(CustomTextStyles.s20w700)
                              .apply(color: AppColors.black),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GridView.builder(
                          itemCount: partners
                              .where((element) => element.isTop! == false)
                              .toList()
                              .length,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)).r,
                              child: InkWell(
                                onTap: () {
                                  // launchUrl()
                                },
                                child: CachedNetworkImage(
                                  imageUrl: partners[index].logo ?? '',
                                  fit: BoxFit.cover,
                                  height: 55.h,
                                  width: 55.w,
                                  errorWidget: (a, b, c) => Container(
                                    color: AppColors.danger,
                                    width: 55.w,
                                    height: 55.h,
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
