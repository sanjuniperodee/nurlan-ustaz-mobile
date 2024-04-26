import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../../../core/common/shared_keys.dart';
import '../../../../../../auth/data/model/token_dto.dart';
import '../../data/models/chat_model.dart';
import '../../data/models/question_model.dart';

part 'today_chat_cubit.freezed.dart';

@singleton
class TodayChatCubit extends Cubit<TodayChatState> {
  TodayChatCubit(this._homeRepository, this.sharedPreferences, this._authRepo)
      : super(const TodayChatState.initialState());
  final AuthRepository _authRepo;
  final HomeRepository _homeRepository;
  final SharedPreferences sharedPreferences;
  late List<ChatDTO> chatsss;

  late UserDto _userDto;

  Future<void> connectSocket() async {
    log('${WebSocketUrl}');
    //emit(_LoadingState());

    final user = await _authRepo.getUser();
    user.fold((l) => {}, (r) {
      _userDto = r;
    });
    List<QuestionDTO> test = [];
    TokenDTO? token = TokenDTO.fromJson(
      jsonDecode(sharedPreferences.get(SharedKeys.TOKEN).toString())
          as Map<String, dynamic>,
    );
    final channel = IOWebSocketChannel.connect(
        Uri.parse("${WebSocketUrl}/api/tell-me-ustaz/chat/"),
        headers: {"Authorization": "Bearer ${token.access}"});

    channel.stream.listen((event) async {
      emit(const _LoadingState());

      var questions = json.decode(event);
      if (questions.runtimeType == List<dynamic>) {
        try {
          for (var e in questions) {
            test.add(QuestionDTO.fromJson(e));
          }
        } catch (e) {}
      } else {
        test.add(QuestionDTO.fromJson(questions));
      }
      emit(_InitialState(channel: channel, questions: test, user: _userDto));
    },
        onDone: () {
      getQuestionByDate(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    },
    onError: (error) {
    log('ws error $error');
    });
  }

  Future<void> getQuestionByDate(String dateTime) async {
    log('poshla zhara');

    final result = await _homeRepository.chats(
        startTime: DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTime)),
        endTime: DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTime)
            .copyWith(day: DateTime.parse(dateTime).day + 1)));
    result.fold(
        (l) => {

            }, (r) async {
      chatsss = r.toList();
      if (chatsss
          .toList()
          .map((e) => DateFormat('yyyy-MM-dd').format(DateTime.parse(e.date!)))
          .toList()
          .contains(
              DateFormat('yyyy-MM-dd').format(DateTime.parse(dateTime)))) {
        final dayChat =
            chatsss.toList().firstWhere((element) => element.date == dateTime);
        final result = await _homeRepository.questions(
            id: dayChat.id!, isFirstCall: false, page: 1);
        result.fold(
            (l) => {

                }, (r) async {
          emit(_InitialState().copyWith(
            user: _userDto,
            questions: r.toList(),
          ));
        });
      } else {
        emit(_InitialState().copyWith(
          user: _userDto,
          questions: [],
        ));
      }
    });
  }

  Future<void> change(WebSocketChannel channel) async {
    channel.stream.listen((message) {
      log('message $message');
    },
        );
  }
}

@freezed
class TodayChatState with _$TodayChatState {
  const factory TodayChatState.initialState(
      {@Default([]) List<QuestionDTO> questions,
      final IOWebSocketChannel? channel,
      final UserDto? user}) = _InitialState;

  const factory TodayChatState.loadedState() = _LoadedState;

  const factory TodayChatState.loadingState() = _LoadingState;

  const factory TodayChatState.errorState({
    required String message,
  }) = _ErrorState;
}
