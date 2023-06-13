import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nurlan_ustaz_flutter/core/common/app_styles.dart';
import 'package:nurlan_ustaz_flutter/core/common/assets.dart';
import 'package:nurlan_ustaz_flutter/core/common/colors.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_app_bar.dart';
import 'package:nurlan_ustaz_flutter/features/app/presentation/widgets/custom_snackbars.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/result_home_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/bloc/comment_sem_cubit.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/widgets/comment_deep_item_widget.dart';

class CommentPage extends StatefulWidget {
  final int id;
  const CommentPage({super.key, required this.id});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  final TextEditingController _textEditingController = TextEditingController();
  List<ResultHomeDTO> listOfComments = [];
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CommentSemCubit>(context)
        .commentsSem(page: 1, isFirstCall: true, id: widget.id);
    _scrollController.addListener(_scrollListener);
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
              Navigator.pop(context);
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
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://i.pinimg.com/originals/6d/f8/bb/6df8bbb26f6cde4d1e2919e1340eeef3.jpg',
                    fit: BoxFit.cover,
                  ),
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
                child: TextField(
                  autofocus: true, // Set autofocus to true

                  controller: _textEditingController,
                  decoration: const InputDecoration(
                      hintText: 'Пікір білдіру', border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<CommentSemCubit, CommentSemState>(
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
                                vertical: 56, horizontal: 16)
                            .r,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listOfComments.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CommentDeepItemWidget(
                                  resultHomeDTO: listOfComments[index],
                                  id: widget.id,
                                ),
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
                                                  bottom: 8),
                                              child: CommentDeepItemWidget(
                                                resultHomeDTO:
                                                    listOfComments[index]
                                                        .children![indexx],
                                                id: widget.id,
                                              ),
                                            );
                                          },
                                        )
                                    ],
                                  ),
                                )
                              ],
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
      BlocProvider.of<CommentSemCubit>(context)
          .commentsSem(page: page, id: widget.id);
    }
  }
}
