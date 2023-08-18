
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_like_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_like_cubit.dart';

class CommentDeepItemWidget extends StatefulWidget {
  final ResultHomeDTO resultHomeDTO;
  final int id;
  final String type;
  final bool ans;
  final void Function()? callback;
  const CommentDeepItemWidget({
    Key? key,
    required this.resultHomeDTO,
    required this.id,
    required this.type,
    required this.ans,
    this.callback,
  }) : super(key: key);

  @override
  State<CommentDeepItemWidget> createState() => _CommentDeepItemWidgetState();
}

class _CommentDeepItemWidgetState extends State<CommentDeepItemWidget> {
  late bool isLiked;
  late int likeCount;
  @override
  void initState() {
    // TODO: implement initState

    isLiked = widget.resultHomeDTO.isLiked!;
    likeCount = widget.resultHomeDTO.likesCount!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8).copyWith(bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
            width: 40.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: widget.resultHomeDTO.user?.avatar != null
                  ? Image.network(
                      widget.resultHomeDTO.user!.avatar!,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.asset(Assets.userSvg),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.resultHomeDTO.user?.fullName ??
                          'user_delete'.tr(),
                      style: getTextStyle(CustomTextStyles.s14w700)
                          .apply(color: AppColors.black),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      DateFormat('dd.MM').format(DateTime.parse(
                          widget.resultHomeDTO.createdAt.toString())),
                      style: getTextStyle(CustomTextStyles.s12w700)
                          .apply(color: AppColors.grey1),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        widget.resultHomeDTO.body ?? 'ERROR',
                        style: getTextStyle(CustomTextStyles.s14w700)
                            .apply(color: AppColors.black),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                        onTap: () {
                          widget.type == 'sem'
                              ? BlocProvider.of<CommentSemLikeCubit>(context)
                                  .seminarCommentLike(
                                      id: widget.id,
                                      commentId: widget.resultHomeDTO.id ?? 0)
                              : BlocProvider.of<CommentNewsLikeCubit>(context)
                                  .newsCommentLike(
                                      id: widget.id,
                                      commentId: widget.resultHomeDTO.id ?? 0);
                          isLiked = !isLiked;
                          if (isLiked == true) {
                            likeCount += 1;
                          } else {
                            likeCount -= 1;
                          }
                          setState(() {});
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                                isLiked ? Assets.heartSvg : Assets.heart1Svg),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(likeCount.toString()),
                          ],
                        )),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                widget.ans
                    ? const SizedBox()
                    : InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: widget.callback ?? () {},
                        child:  Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Answer_send'.tr(),
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  color: AppColors.grey2,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
