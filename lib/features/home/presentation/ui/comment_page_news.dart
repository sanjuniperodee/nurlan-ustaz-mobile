import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_news_post_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/get_profile_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/news_detail_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/comment_deep_item_widget.dart';

class CommentPageNews extends StatefulWidget {
  final int id;
  const CommentPageNews({super.key, required this.id});

  @override
  State<CommentPageNews> createState() => _CommentPageNewsState();
}

class _CommentPageNewsState extends State<CommentPageNews> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  final TextEditingController _textEditingController = TextEditingController();
  List<ResultHomeDTO> listOfComments = [];
  bool isLoadingMore = false;
  FocusNode focusNode = FocusNode();
  int? idChildComment;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CommentNewsCubit>(context)
        .commentsNews(page: 1, isFirstCall: true, id: widget.id);
    BlocProvider.of<GetProfileCubit>(context).getUser();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              BlocProvider.of<NewsDetailCubit>(context)
                  .newsDetail(id: widget.id)
                  .then((value) => Navigator.pop(context));
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(
          'Пікірлері',
          textAlign: TextAlign.center,
          style: getTextStyle(CustomTextStyles.s20w700)
              .apply(color: AppColors.black),
        ),
      ),
      bottomSheet: BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const CircularProgressIndicator(
                color: AppColors.danger,
              );
            },
            loaded: (user, geo) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: user.avatar != null
                              ? Image.network(
                                  user.avatar!,
                                  fit: BoxFit.cover,
                                )
                              : SvgPicture.asset(Assets.userSvg),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColors.grey2)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                autofocus: true, // Set autofocus to true
                                focusNode: focusNode,
                                controller: _textEditingController,
                                decoration: const InputDecoration(
                                    hintText: 'Пікір білдіру',
                                    border: InputBorder.none),
                              ),
                            ),
                            BlocListener<CommentNewsPostCubit,
                                CommentNewsPostState>(
                              listener: (context, state) {
                                log(state.toString());
                                state.maybeWhen(orElse: () {
                                  log(state.toString());
                                }, loaded: () {
                                  BlocProvider.of<CommentNewsCubit>(context)
                                      .commentsNews(
                                          page: 1,
                                          isFirstCall: true,
                                          id: widget.id);
                                });
                              },
                              child: IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () {
                                  BlocProvider.of<CommentNewsPostCubit>(context)
                                      .newsCommentPost(
                                    body: _textEditingController.text,
                                    id: widget.id,
                                    commentId: idChildComment,
                                  );
                                  idChildComment = null;
                                  setState(() {});
                                  _textEditingController.clear();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      body: BlocConsumer<CommentNewsCubit, CommentNewsState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {
              isLoadingMore = false;
            },
            errorState: (message) {
              isLoadingMore = false;
              buildErrorCustomSnackBar(context, message);
            },
            loadingMoreState: () {
              isLoadingMore = true;
            },
            loaded: (comments) {
              isLoadingMore = false;
              listOfComments = comments;
            },
          );
          // TODO: implement listener
        },
        builder: (context, state) {
          return state.maybeWhen(orElse: () {
            return ListView(
              children: [
                // if (listOfComments != null)
                listOfComments == []
                    ? Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: Center(
                          child: Text(
                            'Әзірше пікірлер жок',
                            style: getTextStyle(CustomTextStyles.s20w700)
                                .apply(color: AppColors.black),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                                vertical: 26, horizontal: 16)
                            .r,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listOfComments.length,
                          itemBuilder: (context, index) {
                            return Theme(
                              data: ThemeData()
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                trailing:
                                    listOfComments[index].children!.isEmpty
                                        ? const SizedBox()
                                        : const Icon(
                                            Icons.expand_more,
                                            color: AppColors.grey2,
                                          ),
                                title: CommentDeepItemWidget(
                                  resultHomeDTO: listOfComments[index],
                                  id: widget.id,
                                  type: 'sem',
                                  ans: false,
                                  callback: () {
                                    _textEditingController.text =
                                        '@${listOfComments[index].user!.fullName!} ';
                                    _textEditingController.selection =
                                        TextSelection.fromPosition(TextPosition(
                                            offset: _textEditingController
                                                .text.length));
                                    idChildComment = listOfComments[index].id;
                                  },
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 65),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (listOfComments[index].children !=
                                            null)
                                          ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: listOfComments[index]
                                                .children!
                                                .length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, indexx) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 18),
                                                child: CommentDeepItemWidget(
                                                  resultHomeDTO:
                                                      listOfComments[index]
                                                          .children![indexx],
                                                  id: widget.id,
                                                  type: 'sem',
                                                  ans: true,
                                                ),
                                              );
                                            },
                                          )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                SizedBox(
                  height: 60.h,
                ),
                isLoadingMore
                    ? const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator())
                    : const SizedBox(),
              ],
            );
          });
        },
      ),
    );
  }

  void _scrollListener() {
    if (isLoadingMore) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      page++;
      BlocProvider.of<CommentNewsCubit>(context)
          .commentsNews(page: page, id: widget.id);
    }
  }
}
