import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/card_model.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class ProfileCardsPage extends StatefulWidget {
  const ProfileCardsPage({Key? key}) : super(key: key);

  @override
  State<ProfileCardsPage> createState() => _ProfileCardsPageState();
}

int selectedIndex = -1;

class _ProfileCardsPageState extends State<ProfileCardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AppButton(
              onTap: () {
                context.router.push(
                  const AddNewCardRoute(),
                );
              },
              text: 'new_card'.tr()),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: GlobalCustomBody(
          child: SizedBox(
            height: 1.1.sh,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(
                  height: 36.h,
                ),
                CustomAppBar(
                  title: 'my_cards'.tr(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.builder(
                  itemCount: cards.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 12.r),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20).r),
                        padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12)
                            .r
                            .r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.orange,
                                      borderRadius:
                                          BorderRadius.circular(40).r),
                                  padding: const EdgeInsets.all(15).r,
                                  child: SvgPicture.asset(
                                    'assets/icons/payment_card.svg',
                                    color: AppColors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cards[index].title}',
                                      style:
                                          getTextStyle(CustomTextStyles.s14w400)
                                              .apply(
                                                  color: AppColors.grey1,
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      '${cards[index].code}',
                                      style:
                                          getTextStyle(CustomTextStyles.s16w400)
                                              .copyWith(
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: selectedIndex != index
                                    ? SvgPicture.asset(Assets.radioCircleSvg)
                                    : SvgPicture.asset(Assets.radioOnSvg))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ),
        ));
  }

  final List<CardModel> cards = List.generate(5, (index) {
    return CardModel(title: 'Карта', code: '6918 **** **89');
  });
}
