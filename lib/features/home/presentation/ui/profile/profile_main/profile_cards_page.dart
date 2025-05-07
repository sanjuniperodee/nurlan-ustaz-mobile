import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/router/app_router.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/bloc/cards_cubit.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';

@RoutePage()
class ProfileCardsPage extends StatefulWidget {
  const ProfileCardsPage({Key? key}) : super(key: key);

  @override
  State<ProfileCardsPage> createState() => _ProfileCardsPageState();
}

bool isLoadingButton = false;

class _ProfileCardsPageState extends State<ProfileCardsPage> {
  @override
  void initState() {
    BlocProvider.of<CardsCubit>(context).getCardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16).r,
        child: SizedBox(
          width: double.infinity,
          height: 50.h,
          child: AppButton(
              isLoading: isLoadingButton,
              onTap: () async {
                setState(() {
                  isLoadingButton = true;
                });
                final url =
                    await BlocProvider.of<CardsCubit>(context).getAddCardUrl();
                if (url != null) {
                  setState(() {
                    isLoadingButton = false;
                  });
                  context.router.push(
                    AddNewCardRoute(addCardUrl: url),
                  );
                }
              },
              text: 'new_card'.tr()),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocConsumer<CardsCubit, CardsState>(
        listener: (context, state) {
          if (state is CardsErrorState) {
            buildErrorCustomSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is! CardsLoadedState) {
            return const GlobalCustomBody(
                child: Center(
              child: CircularProgressIndicator.adaptive(),
            ));
          }

          final _cards = state.cards;
          return GlobalCustomBody(
            child: SizedBox(
              height: 1.1.sh,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomAppBar(
                      title: 'my_cards'.tr(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _cards.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 1.sh / 3),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.r, vertical: 12.r),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12).r,
                                      color: AppColors.white),
                                  child: Center(
                                      child: Text(
                                    'empty_cards'.tr(),
                                    style:
                                        getTextStyle(CustomTextStyles.s16w400),
                                  ))),
                            ],
                          )
                        : ListView.builder(
                            padding: EdgeInsets.only(bottom: 100.h),
                            itemCount: _cards.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 12.r),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius:
                                          BorderRadius.circular(20).r),
                                  padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12)
                                      .r
                                      .r,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(40)
                                                        .r),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (_cards[index].cardNumber !=
                                                  null)
                                                Text(
                                                  _cards[index]
                                                          .cardNumber!
                                                          .startsWith('4')
                                                      ? 'Visa'
                                                      : _cards[index]
                                                              .cardNumber!
                                                              .startsWith('5')
                                                          ? 'MasterCard'
                                                          : 'Карта',
                                                  style: getTextStyle(
                                                          CustomTextStyles
                                                              .s14w400)
                                                      .apply(
                                                          color:
                                                              AppColors.grey1,
                                                          fontFamily: FontTypes
                                                              .SF_Pro.name),
                                                ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Text(
                                                '${_cards[index].cardNumber}',
                                                style: getTextStyle(
                                                        CustomTextStyles
                                                            .s16w400)
                                                    .copyWith(
                                                        fontFamily: FontTypes
                                                            .SF_Pro.name),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: () async {
                                            await BlocProvider.of<CardsCubit>(
                                                    context)
                                                .setDefaultCard(
                                                    cardId: _cards[index].id);
                                          },
                                          child: _cards[index].isDefault!
                                              ? SvgPicture.asset(
                                                  Assets.radioOnSvg)
                                              : SvgPicture.asset(
                                                  Assets.radioCircleSvg))
                                    ],
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
      ),
    );
  }
}
