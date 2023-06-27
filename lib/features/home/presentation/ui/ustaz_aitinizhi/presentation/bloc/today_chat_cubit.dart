import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';
import 'package:web_socket_channel/io.dart';

part 'today_chat_cubit.freezed.dart';

@singleton
class TodayChatCubit extends Cubit<TodayChatState> {
  TodayChatCubit(
    this._homeRepository,
  ) : super(const TodayChatState.initialState());
  final HomeRepository _homeRepository;

  Future<void> connectSocket() async {
    final token = await Prefs().getToken();
    if (token == null) {
      print('token pustoi');
      return;
    }
    final channel =  IOWebSocketChannel.connect(
        "ws://86.107.45.90:8000/api/tell-me-ustaz/chat/",
        headers: {"Authorization": "Bearer $token"});
    channel.sink.add(jsonEncode({
      "message": "bespredel"
    }));
    final messages = await channel.stream.toList();

    final quests =
        messages.map((e) => QuestionDTO.fromJson(jsonDecode(e))).toList();
  }
}

@freezed
class TodayChatState with _$TodayChatState {
  const factory TodayChatState.initialState() = _InitialState;

  const factory TodayChatState.loadedState() = _LoadedState;

  const factory TodayChatState.loadingState() = _LoadingState;

  const factory TodayChatState.errorState({
    required String message,
  }) = _ErrorState;
}
