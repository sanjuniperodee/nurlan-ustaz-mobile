import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/duas_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

class PrayersPage extends StatefulWidget {
  const PrayersPage({super.key});

  @override
  State<PrayersPage> createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<DuasCubit>(context).duas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<DuasCubit, DuasState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            errorState: (message) {
              buildErrorCustomSnackBar(context, message);
            },
          );
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
            loaded: (duha) {
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
                                  title: 'Дұғалар',
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                SearchWidget(onChanged: (string) {
                                  BlocProvider.of<DuasCubit>(context)
                                      .duas(search: string);
                                }),
                                ListView.builder(
                                  itemCount: duha.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                             PrayersDetailPageRoute(
                                                result: duha[index]
                                            ),
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
                                              duha[index].name ?? 'ERROR',
                                              style: getTextStyle(
                                                  CustomTextStyles.s16w500),
                                            ),
                                            subtitle: Text(
                                              duha[index].translation ??
                                                  'ERROR',
                                              style: getTextStyle(
                                                      CustomTextStyles.s14w400)
                                                  .apply(
                                                      color: AppColors.grey2),
                                              overflow: TextOverflow.ellipsis,
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
}
