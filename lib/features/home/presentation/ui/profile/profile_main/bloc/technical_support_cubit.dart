import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/presentation/ui/ustaz_aitinizhi/data/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../../../../core/common/shared_keys.dart';
import '../../../../../../auth/data/model/token_dto.dart';

part 'technical_support_cubit.freezed.dart';

@singleton
class TechnicalSupportCubit extends Cubit<TechnicalSupportState> {
  TechnicalSupportCubit(this.sharedPreferences, this._authRepo)
      : super(const TechnicalSupportState.initial());
  final AuthRepository _authRepo;

  final SharedPreferences sharedPreferences;

  late UserDto _userDto;
  late IOWebSocketChannel _channel;
  Future<void> connectSocket() async {
    emit(const TechnicalSupportState.loading());

    var user = await _authRepo.getUser();
    user.fold((l) => {}, (r) => {_userDto = r});

    List<QuestionDTO> test = [];

    TokenDTO? token = TokenDTO.fromJson(
      jsonDecode(sharedPreferences.get(SharedKeys.TOKEN).toString())
          as Map<String, dynamic>,
    );
    _channel = IOWebSocketChannel.connect(
      EndPoints.wsSupportChat,
      headers: {"Authorization": "Bearer ${token.access}"},
    );
    emit(TechnicalSupportState.initial(
        channel: _channel, questions: [], user: _userDto));
    // emit(const _LoadingState());
    _channel.stream.listen(
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
        emit(const TechnicalSupportState.loaded());
        emit(TechnicalSupportState.initial(
            channel: _channel, questions: test, user: _userDto));
      },
    );
  }

  Future<void> addMessage(String message) async {
    // emit(_LoadingState());
    _channel.sink.add(jsonEncode({"message": message}));
  }
}

@freezed
sealed class TechnicalSupportState with _$TechnicalSupportState {
  const factory TechnicalSupportState.initial(
      {@Default([]) List<QuestionDTO> questions,
      final IOWebSocketChannel? channel,
      final UserDto? user}) = TechnicalSupportInitialState;
  const factory TechnicalSupportState.loaded() = TechnicalSupportLoadedState;
  const factory TechnicalSupportState.loading() = TechnicalSupportLoadingState;
  const factory TechnicalSupportState.error({
    required String message,
  }) = TechnicalSupportErrorState;
}
