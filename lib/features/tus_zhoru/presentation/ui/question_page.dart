import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nurlan_ustaz_flutter/core/utils/pay_dialog.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_text_form_field.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/global_custom_body_widget.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/create_tus_zhoru_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/presentation/bloc/tus_zhoru_cubit.dart';

import '../../../../core/common/app_styles.dart';
import '../../../../core/common/colors.dart';
import '../../../app/presentation/widgets/app_button.dart';
import '../../../app/presentation/widgets/custom_app_bar.dart';
import '../../../app/presentation/widgets/custom_snackbars.dart';
import '../widgets/tus_zhoru_custom_body.dart';

@RoutePage()
class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

TextEditingController controllerForAtau = TextEditingController();
TextEditingController controllerForTusimbde = TextEditingController();

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateTusZhoruCubit, CreateTusZhoruState>(
      listener: (context, state) {
        if (state is CreateTusZhoruLoadedState) {
          if (state.tusZhoru.id == null) {
            Navigator.of(context).pop;
            return;
          }
          showDialog(
            useRootNavigator: true,
            context: context,
            builder: (context) {
              return PayDialog(
                price: state.tusZhoru.price?.toInt().toString() ?? '',
                id: state.tusZhoru.id!,
                isCustom: true,
              );
            },
          );
        } else if (state is CreateTusZhoruErrorState) {
          buildErrorCustomSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFECF5FF),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: AppButton(
              onTap: () async {
                await context.read<CreateTusZhoruCubit>().createTusZhoru(
                    controllerForAtau.text, controllerForTusimbde.text);
                BlocProvider.of<TusZhoruCubit>(context).getCustomTusZhoruT();
                Navigator.pop(context);

                controllerForAtau.clear();
                controllerForTusimbde.clear();
              },
              text: 'send'.tr(),
            ),
          ),
          body: TusZhoruCustomBody(
            child: SingleChildScrollView(
              primary: true,
              child: SizedBox(
                height: 1.3.sh,
                child: Stack(
                  children: [
                    Positioned(
                      top: 30.h,
                      left: 16.r,
                      right: 16.r,
                      child: Column(
                        children: [
                          CustomAppBar(
                            onTap: () {
                              Navigator.pop(context);
                              controllerForAtau.clear();
                              controllerForTusimbde.clear();
                            },
                            title: 'order'.tr(),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 80.h,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'section'.tr(),
                                style: getTextStyle(CustomTextStyles.s14w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomTextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(60),
                                ],
                                onChanged: (value) {
                                  setState(() {});
                                },
                                hintText: '${'name1'.tr()}...',
                                controller: controllerForAtau,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${controllerForAtau.value.text.length}/60',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                              CustomTextFormField(
                                minLines: 15,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(999),
                                ],
                                hintText: '${'in_dream'.tr()}...',
                                controller: controllerForTusimbde,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${controllerForTusimbde.value.text.length}/999',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
