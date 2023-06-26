import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/geonames_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/set_city_cubit.dart';

class GeonamesPage extends StatefulWidget {
  final void Function()? callback;
  const GeonamesPage({Key? key, this.callback}) : super(key: key);

  @override
  State<GeonamesPage> createState() => _GeonamesPageState();
}

class _GeonamesPageState extends State<GeonamesPage> {
  @override
  void initState() {
    super.initState();
    geoa.clear();
  }

  Prefs prefs = Prefs();
  List<GeonamesDTO> geoa = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<GeonamesCubit, GeonamesState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
            loaded: (geo) {
              geoa = geo;
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return SizedBox(
            height: 1.sh,
            child: Stack(
              children: [
                Image.asset(
                  Assets.gradient,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40, left: 16, right: 16).r,
                  child: SizedBox(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const CustomAppBar(
                            title: 'Орналасқан жеріңізді таңдаңыз',
                          ),
                          SizedBox(
                            height: 28.h,
                          ),
                          SearchWidget(
                            onChanged: (string) {
                              BlocProvider.of<GeonamesCubit>(context).geoNames(
                                name: string,
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: geoa.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child:
                                      BlocListener<SetCityCubit, SetCityState>(
                                    listener: (context, state) {
                                      state.maybeWhen(
                                        orElse: () {},
                                        loaded: (not) {
                                          context.router.pop(geoa[index]);
                                        },
                                      );
                                      // TODO: implement listener
                                    },
                                    child: InkWell(
                                      onTap: widget.callback ??
                                          () async {
                                            BlocProvider.of<SetCityCubit>(
                                                    context)
                                                .setCity(
                                              geo: geoa[index],
                                            );
                                          },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 12)
                                            .r,
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(20).r),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              geoa[index].name ?? 'ERROR',
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w700)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              '${geoa[index].name ?? 'ERROR'},${geoa[index].adminName1 ?? 'ERROR'}',
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w700)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
