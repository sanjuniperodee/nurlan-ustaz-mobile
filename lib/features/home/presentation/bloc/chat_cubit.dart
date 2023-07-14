import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';

part 'chat_cubit.freezed.dart';

@singleton
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._homeRepository,
  ) : super(const ChatState.initialState());
  final HomeRepository _homeRepository;

  // Future<void> connectSocket() async {
  //   //final token = await Prefs().getToken();
  //   if (token == null) {
  //     print('token pustoi');
  //     return;
  //   }
  //   final channel =  IOWebSocketChannel.connect(
  //       "ws://86.107.45.90:8000/api/support/chat/",
  //       headers: {"Authorization": "Bearer $token"});
  //   channel.sink.add(jsonEncode({
  //     "message": "bespredel"x
  //   }));
  //   final messages = await channel.stream.toList();
  //
  //   final quests =
  //       messages.map((e) => QuestionDTO.fromJson(jsonDecode(e))).toList();
  // }
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initialState() = _InitialState;

  const factory ChatState.loadedState() = _LoadedState;

  const factory ChatState.loadingState() = _LoadingState;

  const factory ChatState.errorState({
    required String message,
  }) = _ErrorState;
}
