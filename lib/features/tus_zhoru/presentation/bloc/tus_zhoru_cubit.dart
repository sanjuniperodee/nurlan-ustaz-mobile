import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/failure.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/repositories/tus_zhoru_repository.dart';

import '../../data/models/tus_zhoru_dto.dart';

part 'tus_zhoru_cubit.freezed.dart';

@singleton
class TusZhoruCubit extends Cubit<TusZhoruState> {
  final TusZhoruRepository _repository;

  TusZhoruCubit(
    this._repository,
  ) : super(const TusZhoruState.initialState()){}

  late List<TusZhoruDTO> tosZhoruList;
  late List<TusZhoruDTO> customTusZhoruList;

  Future<void> secureScreen() async {
    final FlutterWindowManager manager = FlutterWindowManager();
         await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  Future<void> unSecureScreen() async {
    final FlutterWindowManager manager = FlutterWindowManager();

    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  Future<void> toggleFav(int id) async {
    final result = await _repository.tusZhoruFavorite(id: id);
  }

  Future<void> switchTab(int index) async {
    if (index == 1) {
      await getCustomTusZhoruT(page: 1, isFirstCall: true);
    }
    else{
      await tusZhoruT(page: 1,isFirstCall: true);
    }
    // if(index ==0  ){tusZhoruT(page: 1,isFirstCall: false);}

     emit(_InitialPage().copyWith(
        currentIndex: index,
        tusZhoruList: tosZhoruList,
        customTusZhoru: customTusZhoruList));
  }

  Future<void> tusZhoruT({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
    bool? isPurchased,
  }) async {
    final failureOrUser = await _repository.tusZhoru(
        page: page,
        isFirstCall: true,
        search: search,
        isPurchased: isPurchased,
        isSaved: isSaved);
    failureOrUser.fold(
      (l) {
        emit(TusZhoruState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        tosZhoruList = r.toList();
        emit(TusZhoruState.initialState(
            tusZhoruList: r.toSet().toList(), currentIndex: 0));
      },
    );
  }

  Future<void> getCustomTusZhoruT({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
  }) async {
    final result = await _repository.customTusZhoru(
        page: 1, isFirstCall: true, search: search);
    result.fold(
      (l) {
        emit(TusZhoruState.errorState(message: mapFailureToMessageBack(l)));
      },
      (r) {
        customTusZhoruList = r;
        emit(TusZhoruState.initialState(
            customTusZhoru: r.toSet().toList(), currentIndex: 1));
      },
    );
  }
}

@freezed
class TusZhoruState with _$TusZhoruState {
  const factory TusZhoruState.initialState({
    @Default([]) List<TusZhoruDTO> tusZhoruList,
    @Default([]) List<TusZhoruDTO> customTusZhoru,
    @Default(0) int currentIndex,
  }) = _InitialPage;

  const factory TusZhoruState.loadingState() = _LoadingState;

  const factory TusZhoruState.loaded() = _LoadedState;

  const factory TusZhoruState.errorState({
    required String message,
  }) = _ErrorState;
}
