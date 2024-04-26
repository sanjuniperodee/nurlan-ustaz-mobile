import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';

import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/geonames_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_profile_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/set_city_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/timings_cubit.dart';

@RoutePage()
class GeonamesPage extends StatefulWidget {
  final void Function()? callback;
  final String? type;
  const GeonamesPage({Key? key, this.callback, this.type}) : super(key: key);

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
  int geoIndex = 0;
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
                          SizedBox(height: 20.h,),
                          CustomAppBar(
                            title: 'choose_location'.tr(),
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
                          BlocListener<SetCityCubit, SetCityState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                orElse: () {},
                                loaded: (not) {
                                  widget.type == 'profile'
                                      ? BlocProvider.of<GetProfileCubit>(
                                              context)
                                          .getUser()
                                          .then((value) => context.router.pop())
                                      : BlocProvider.of<TimingsCubit>(context)
                                          .timings(
                                            double.parse(geoa[geoIndex].lat!),
                                            double.parse(geoa[geoIndex].lng!),
                                          )
                                          .then(
                                              (value) => context.router.pop());
                                },
                              );
                              // TODO: implement listener
                            },
                            child: ListView.builder(
                              itemCount: geoa.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: InkWell(
                                      onTap: widget.callback ??
                                          () async {
                                            BlocProvider.of<SetCityCubit>(
                                                    context)
                                                .setCity(
                                              geo: geoa[index],
                                            );
                                            geoIndex = index;
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
                                              '${geoa[index].countryName ?? 'ERROR'},${geoa[index].adminName1 ?? 'ERROR'}',
                                              style: getTextStyle(
                                                      CustomTextStyles.s16w700)
                                                  .apply(
                                                      color: AppColors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),
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
