import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
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
  ) : super(const TusZhoruState.initial());
  final MethodChannel securityChannel = MethodChannel('app_security_channel');

  late List<TusZhoruDTO> tosZhoruList;
  late List<TusZhoruDTO> customTusZhoruList;

  Future<void> secureScreen() async {
    // TODO: replace with "secure_application" plugin?
    Platform.isAndroid
        ? await FlutterWindowManagerPlus.addFlags(
            FlutterWindowManagerPlus.FLAG_SECURE)
        : await securityChannel.invokeMethod('secureApp');
  }

  Future<void> unSecureScreen() async {
    Platform.isAndroid
        ? await FlutterWindowManagerPlus.clearFlags(
            FlutterWindowManagerPlus.FLAG_SECURE)
        : await securityChannel.invokeMethod('unsecureApp');
  }

  Future<void> toggleFav(int id) async {
    final result = await _repository.tusZhoruFavorite(id: id);
  }

  Future<void> switchTab(int index, String type) async {
    if (index == 1) {
      type == 'save'
          ? await getCustomTusZhoruT(page: 1, isFirstCall: true, isSaved: true)
          : await getCustomTusZhoruT(page: 1, isFirstCall: true);
    } else {
      type == 'save'
          ? await tusZhoruT(page: 1, isFirstCall: true, isSaved: true)
          : await tusZhoruT(page: 1, isFirstCall: true);
    }
    // if(index ==0  ){tusZhoruT(page: 1,isFirstCall: false);}

    emit(TusZhoruState.initial(
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
        emit(TusZhoruState.error(message: mapFailureToMessageBack(l)));
        emit(
            TusZhoruState.initial(tusZhoruList: tosZhoruList, currentIndex: 0));
      },
      (r) {
        tosZhoruList = r.toList();
        emit(TusZhoruState.initial(
            tusZhoruList: r.toSet().toList(), currentIndex: 0));
      },
    );
  }

  Future<void> paginatedTusZhoru({
    String? search,
    bool? isSaved,
    int? page,
    bool? isFirstCall,
    bool? isPurchased,
  }) async {
    log('salam');
    final failureOrUser = await _repository.tusZhoru(
        page: page,
        isFirstCall: false,
        search: search,
        isPurchased: isPurchased,
        isSaved: isSaved);
    failureOrUser.fold(
      (l) {
        emit(TusZhoruState.error(message: mapFailureToMessageBack(l)));
        emit(
            TusZhoruState.initial(tusZhoruList: tosZhoruList, currentIndex: 0));
      },
      (r) {
        tosZhoruList += r.toList();
        emit(TusZhoruState.initial(
            tusZhoruList: tosZhoruList.toSet().toList(),
            currentIndex: 0,
            currentPage: page ?? 0));
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
        emit(TusZhoruState.error(message: mapFailureToMessageBack(l)));
        emit(TusZhoruState.initial(customTusZhoru: [], currentIndex: 1));
      },
      (r) {
        customTusZhoruList = r;
        emit(TusZhoruState.initial(
            customTusZhoru: r.toSet().toList(), currentIndex: 1));
      },
    );
  }
}

@freezed
sealed class TusZhoruState with _$TusZhoruState {
  const factory TusZhoruState.initial({
    @Default([]) List<TusZhoruDTO> tusZhoruList,
    @Default([]) List<TusZhoruDTO> customTusZhoru,
    @Default(0) int currentIndex,
    @Default(1) int currentPage,
  }) = TusZhoruInitialPage;
  const factory TusZhoruState.loading() = TusZhoruLoadingState;
  const factory TusZhoruState.loaded() = TusZhoruLoadedState;
  const factory TusZhoruState.error({
    required String message,
  }) = TusZhoruErrorState;
}
