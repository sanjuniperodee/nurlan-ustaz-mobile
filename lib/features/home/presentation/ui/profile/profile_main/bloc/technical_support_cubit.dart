import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../../../core/common/shared_keys.dart';
import '../../../../../../../core/platform/cache_helper/prefs.dart';
import '../../../../../../auth/data/datasource/local/auth_local_ds.dart';
import '../../../../../../auth/data/model/token_dto.dart';

part 'technical_support_cubit.freezed.dart';

@singleton
class TechnicalSupportCubit extends Cubit<TechnicalSupportState> {
  TechnicalSupportCubit(
      this._homeRepository, this.sharedPreferences, this._authRepo)
      : super(const TechnicalSupportState.initialState());
  final AuthRepository _authRepo;
  final HomeRepository _homeRepository;
  final SharedPreferences sharedPreferences;

  late UserDto _userDto;

  Future<void> connectSocket() async {
    emit(_LoadingState());

    var user = await _authRepo.getUser();
    user.fold((l) => {}, (r) => {_userDto = r});

    List<QuestionDTO> test = [];

    TokenDTO? token = TokenDTO.fromJson(
      jsonDecode(sharedPreferences.get(SharedKeys.TOKEN).toString())
          as Map<String, dynamic>,
    );
    final channel = IOWebSocketChannel.connect(
        "ws://86.107.45.90:8000/api/support/chat/",
        headers: {"Authorization": "Bearer ${token.access}"});
    emit(_InitialState(channel: channel, questions: [], user: _userDto));
    channel.stream.listen(
      (event) async {
        var questions = json.decode(event);

        if (questions.runtimeType == List<dynamic>) {
          try {
            for (var e in questions) {
              test.add(QuestionDTO.fromJson(e));
            }
            log(questions[0].toString());
          } catch (e) {}
        } else {
          test.add(QuestionDTO.fromJson(questions));
        }
        emit(_InitialState(channel: channel, questions: test, user: _userDto));
      },
    );
  }

  Future<void> change(WebSocketChannel channel) async {
    channel.stream.listen((message) {
      log(message);
    });
  }
}

@freezed
class TechnicalSupportState with _$TechnicalSupportState {
  const factory TechnicalSupportState.initialState(
      {@Default([]) List<QuestionDTO> questions,
      final IOWebSocketChannel? channel,
      final UserDto? user}) = _InitialState;

  const factory TechnicalSupportState.loadedState() = _LoadedState;

  const factory TechnicalSupportState.loadingState() = _LoadingState;

  const factory TechnicalSupportState.errorState({
    required String message,
  }) = _ErrorState;
}
