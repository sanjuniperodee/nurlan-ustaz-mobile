import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/faq_cubit.dart';

import '../../../../../app/presentation/widgets/custom_app_bar.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<FaqCubit>(context).faq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Scaffold(body: BlocBuilder<FaqCubit, FaqState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.linearBlue,
              ),
            );
          },
          loaded: (faq) {
            return GlobalCustomBody(
              child: SizedBox(
                height: 1.1.sh,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    const CustomAppBar(
                      title: 'FAQ',
                    ),
                    ListView.builder(
                      itemCount: faq.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Theme(
                              data: theme,
                              child: ExpansionTile(
                                collapsedIconColor: AppColors.orange,
                                iconColor: AppColors.orange,
                                title: Text(
                                  '${faq[index].question}',
                                  style: getTextStyle(CustomTextStyles.s14w500)
                                      .copyWith(
                                          fontFamily: FontTypes.SF_Pro.name,
                                          color: AppColors.black),
                                ),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      '${faq[index].answer}',
                                      style:
                                          getTextStyle(CustomTextStyles.s14w400)
                                              .apply(
                                                  color: AppColors.grey1,
                                                  fontFamily:
                                                      FontTypes.SF_Pro.name),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 200.h,
                    )
                  ]),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
