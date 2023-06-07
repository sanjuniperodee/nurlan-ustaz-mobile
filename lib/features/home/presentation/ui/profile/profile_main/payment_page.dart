import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/model/payment_model.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/app_button.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_profile.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/profile/profile_main/widgets/profile_menu_item.dart';

import '../../../../../../core/common/assets.dart';
import '../../../../../../core/common/colors.dart';
import '../../../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../../../app/presentation/widgets/custom_tab_bar.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

int currentIndex = 1;

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GlobalCustomBody(
      child: SizedBox(
        height: 1.1.sh,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            CustomAppBar(
              title: 'Сатып алынған қызметтер',
            ),
            SizedBox(
              height: 36,
            ),
            CustomTabBar(
              tabs: [
                Tab(
                  text: 'Түс жорулар',
                ),
                Tab(
                  text: 'Семинарлар',
                ),
              ],
              onTap: (int) {
                setState(() {
                  currentIndex = int;
                });
              },
              length: 2,
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${DateFormat('dd.MM.yyyy').format(payments[index].date)}',
                              style: getTextStyle(CustomTextStyles.s12w400)
                                  .copyWith(
                                      fontFamily: FontTypes.SF_Pro.name,
                                      color: AppColors.grey1),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              '${payments[index].title}',
                              style: getTextStyle(CustomTextStyles.s16w600)
                                  .copyWith(
                                      fontFamily: FontTypes.SF_Pro.name,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '${payments[index].amount} ₸',
                              style: getTextStyle(CustomTextStyles.s16w600)
                                  .copyWith(color: AppColors.orange),
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            SvgPicture.asset(
                              'assets/icons/chevron_right.svg',
                              color: AppColors.orange,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 12,
                  );
                },
                itemCount: payments.length)
          ]),
        ),
      ),
    ));
  }

  List<PaymentModel> payments = [
    PaymentModel(title: 'Aдамдар', date: DateTime.now(), amount: 3000),
    PaymentModel(title: 'Aдамдар', date: DateTime.now(), amount: 3000),
    PaymentModel(title: 'Aдамдар', date: DateTime.now(), amount: 3000),
    PaymentModel(title: 'Aдамдар', date: DateTime.now(), amount: 3000),
    PaymentModel(title: 'Aдамдар', date: DateTime.now(), amount: 3000),
  ];
}
