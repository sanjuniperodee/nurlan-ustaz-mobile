import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/prj_info_cubit.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({Key? key}) : super(key: key);

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

int selectedIndex = -1;

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<PrjInfoCubit>(context).prjInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<PrjInfoCubit, PrjInfoState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.red,
              ),
            );
          },
          loaded: (res) {
            return GlobalCustomBody(
              child: SizedBox(
                height: 1.1.sh,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomAppBar(
                      title: 'project_info'.tr(),
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [
                                AppColors.white.withOpacity(0.58),
                                AppColors.white.withOpacity(0.74)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 163.w,
                              height: 44.h,
                              child: Image.asset(
                                Assets.logoNurlan,
                                color: AppColors.blue,
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/images/export.png',
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                'assets/images/export2.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      res.first.description ?? 'ERROR',
                      style: getTextStyle(CustomTextStyles.s16w400)
                          .copyWith(fontFamily: FontTypes.SF_Pro.name),
                      textAlign: TextAlign.center,
                    ),
                    ListView.builder(
                      itemCount: res.first.statistics!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Container(
                            height: 96.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.orange,
                                borderRadius: BorderRadius.circular(28.r)),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        res.first.statistics![index].value ??
                                            'ERROR',
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: getTextStyle(
                                                CustomTextStyles.s20w700)
                                            .copyWith(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w700,
                                                fontFamily:
                                                    FontTypes.Philosopher.name,
                                                color: AppColors.white),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        res.first.statistics![index].title ??
                                            'ERROR',
                                        textAlign: TextAlign.center,
                                        style: getTextStyle(
                                                CustomTextStyles.s16w400)
                                            .copyWith(
                                                fontFamily:
                                                    FontTypes.Philosopher.name,
                                                color: AppColors.white),
                                      )
                                    ],
                                  ),
                                ),
                                index.isOdd
                                    ? Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          'assets/images/export4.png',
                                        ),
                                      )
                                    : Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset(
                                          'assets/images/export3.png',
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
            );
          },
        );
      },
    ));
  }

  final List<CardModel> cards = List.generate(5, (index) {
    return CardModel(title: 'Карта', code: '6918 **** **89');
  });
}
