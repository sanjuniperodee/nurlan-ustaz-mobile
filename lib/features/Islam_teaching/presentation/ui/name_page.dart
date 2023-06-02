import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/islam_names_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/search_widget.dart';

import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../../../app/presentation/widgets/custom_tab_bar.dart';

class NamePage extends StatefulWidget {
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<IslamNamesCubit>(context).islamNames(gender: 'M');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: BlocConsumer<IslamNamesCubit, IslamNamesState>(
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
            loaded: (islam) {
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
                                  title: 'Есімдер мағынасы',
                                ),
                                SizedBox(
                                  height: 36.h,
                                ),
                                SearchWidget(onChanged: (string) {
                                  BlocProvider.of<IslamNamesCubit>(context)
                                      .islamNames(
                                          gender: currentIndex != 0 ? 'M' : 'F',
                                          search: string);
                                }),
                                SizedBox(
                                  height: 22.h,
                                ),
                                CustomTabBar(
                                  tabs: const [
                                    Tab(
                                      text: 'Ер',
                                    ),
                                    Tab(
                                      text: 'Әйел',
                                    ),
                                  ],
                                  onTap: (int) {
                                    BlocProvider.of<IslamNamesCubit>(context)
                                        .islamNames(
                                            gender:
                                                currentIndex != 0 ? 'M' : 'F');
                                    setState(() {
                                      currentIndex = int;
                                    });
                                  },
                                  length: 2,
                                ),
                                ListView.builder(
                                  itemCount: islam.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.router.push(
                                            NameDetailPageRoute(
                                                index: currentIndex,
                                                result: islam[index]),
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
                                                islam[index].name ?? 'ERROR',
                                                style: getTextStyle(
                                                    CustomTextStyles.s16w500),
                                              ),
                                              subtitle: Text(
                                                islam[index].description ??
                                                    'ERROR',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s14w400)
                                                    .apply(
                                                        color: AppColors.grey2),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              trailing: const Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: AppColors.orange,
                                              )),
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
