import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/surah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../../../../core/router/app_router.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<SurahCubit>(context).sura();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<SurahCubit, SurahState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
          ); //
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.red,
                ),
              );
            },
            loadingState: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              );
            },
            loaded: (sura) {
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
                                const CustomAppBar(
                                  title: 'Сүрелер',
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                SearchWidget(onChanged: (string) {
                                  BlocProvider.of<SurahCubit>(context)
                                      .sura(search: string);
                                }),
                                ListView.builder(
                                  itemCount: sura.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                            SurahDetailPageRoute(
                                                result: sura[index]),
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
                                              sura[index].name ?? 'ERROR',
                                              style: getTextStyle(
                                                  CustomTextStyles.s16w400),
                                            ),
                                            trailing: const Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: AppColors.black,
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
}
