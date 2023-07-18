import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/duas_favorite_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/app/app_dinamic_link.dart';
import 'package:share_plus/share_plus.dart';

import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/data/model/result_teaching_dto.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/bloc/duas_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/Islam_teaching/presentation/widgets/audioItem_widget.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';

import '../widgets/floating_container_widget.dart';

class PrayersDetailPage extends StatefulWidget {
  final ResultTeachingDTO result;
  const PrayersDetailPage({super.key, required this.result});

  @override
  State<PrayersDetailPage> createState() => _PrayersDetailPageState();
}

class _PrayersDetailPageState extends State<PrayersDetailPage> {
  late bool isFavorite;
  @override
  void initState() {
    // TODO: implement initState
    isFavorite = widget.result.isSaved!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SizedBox(
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
                          title: widget.result.name ?? 'ERROR',
                          onTap: () {
                            BlocProvider.of<DuasCubit>(context)
                                .duas(page: 1)
                                .then((value) => Navigator.pop(context));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Container(
                          height: 0.8.sh,
                          decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(24)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.result.arabic ?? 'ERROR',
                                style: getTextStyle(CustomTextStyles.s14w400),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(
                                widget.result.transcription ?? 'ERROR',
                                style: getTextStyle(CustomTextStyles.s14w400),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              Text(
                                widget.result.translation ?? 'ERROR',
                                style: getTextStyle(CustomTextStyles.s14w400),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              AudioItemWidget(
                                audioUrl: widget.result.audio ?? '',
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FloatinContainerWidget(
                                      text: 'Таңдаулы',
                                      onTap: () {
                                        BlocProvider.of<DuasFavoriteCubit>(
                                                context)
                                            .duasFavorite(
                                                id: widget.result.id ?? 0);
                                        isFavorite = !isFavorite;
                                        setState(() {});
                                      },
                                      url: isFavorite
                                          ? Assets.bookMark1Svg
                                          : Assets.bookMarkSvg,
                                    ),
                                    FloatinContainerWidget(
                                      onTap: () async {
                                        String unguessableDynamicLink =
                                            await DynamicLink().createDuhasLink(
                                                widget.result.id!);
                                        await Share.share(
                                          unguessableDynamicLink,
                                        );
                                      },
                                      text: 'Бөлісу',
                                      url: Assets.shareSvg,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
