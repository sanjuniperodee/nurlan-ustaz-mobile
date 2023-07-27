import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/names_of_Allah_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/audioItem_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

class AllahNamesPage extends StatefulWidget {
  const AllahNamesPage({super.key});

  @override
  State<AllahNamesPage> createState() => _AllahNamesPageState();
}

class _AllahNamesPageState extends State<AllahNamesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<NamesOfAllahCubit>(context).namesOfAllah();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<NamesOfAllahCubit, NamesOfAllahState>(
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
            loaded: (names) {
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
                                  title: 'Allah_names'.tr(),
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                SearchWidget(onChanged: (string) {
                                  BlocProvider.of<NamesOfAllahCubit>(context)
                                      .namesOfAllah(search: string);
                                }),
                                ListView.builder(
                                  itemCount: names.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Theme(
                                          data: theme,
                                          child: ExpansionTile(
                                            expandedCrossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            childrenPadding:
                                                const EdgeInsets.only(
                                                        left: 16, right: 16)
                                                    .r,
                                            collapsedIconColor: AppColors.black,
                                            iconColor: AppColors.black,
                                            title: Text(
                                              '${names[index].name ?? 'ERROR'}   ${names[index].arabic ?? 'ERROR'}',
                                              style: getTextStyle(
                                                  CustomTextStyles.s16w400),
                                            ),
                                            children: <Widget>[
                                              Text(
                                                names[index].translation ??
                                                    'ERROR',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s14w400)
                                                    .apply(
                                                        color: AppColors.black),
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              AudioItemWidget(
                                                audioUrl:
                                                    names[index].audio ?? '',
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Text(
                                                names[index].description ??
                                                    'ERROR',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s14w400)
                                                    .apply(
                                                        color: AppColors.black),
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                            ],
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
