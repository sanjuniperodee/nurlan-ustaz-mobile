import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/repositories/auth_repository.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/repositories/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../../../../core/common/shared_keys.dart';
import '../../../../../../../core/platform/cache_helper/prefs.dart';
import '../../../../../../auth/data/datasource/local/auth_local_ds.dart';
import '../../../../../../auth/data/model/token_dto.dart';
import '../../data/models/question_model.dart';

part 'today_chat_cubit.freezed.dart';

@singleton
class TodayChatCubit extends Cubit<TodayChatState> {
  TodayChatCubit(this._homeRepository, this.sharedPreferences, this._authRepo)
      : super(const TodayChatState.initialState());
  final AuthRepository _authRepo;
  final HomeRepository _homeRepository;
  final SharedPreferences sharedPreferences;

  late  UserDto _userDto;


  Future<void> connectSocket() async {
    emit(_LoadingState());

    var user = await _authRepo.getUser();
    user.fold((l) => {}, (r) => {
      _userDto = r
    });


    final quests = await getQuestions();

    quests!.clear();
     List<QuestionDTO> test = [];

    TokenDTO? token = TokenDTO.fromJson(
      jsonDecode(sharedPreferences.get(SharedKeys.TOKEN).toString())
          as Map<String, dynamic>,
    );
    final channel = IOWebSocketChannel.connect(




        "ws://86.107.45.90:8000/api/tell-me-ustaz/chat/",
        headers: {"Authorization": "Bearer ${token.access}"});
    channel.stream.listen((event) async {
      emit(const _LoadingState());

      var questions = json.decode(event);
      log(questions.runtimeType.toString());
      log((questions.runtimeType == List<dynamic>).toString());
      if (questions.runtimeType == List<dynamic>) {
        log('1');
        try{
          for( var e in questions ){
            log('-------${e.toString()}');
            test.add(QuestionDTO.fromJson(e));
          }
          log(questions[0].toString());


        }
        catch(e){
          log(e.toString());
        }

      }
      else{
        test.add(QuestionDTO.fromJson(questions));
      }
      log(test.length.toString());
      emit(_InitialState(channel: channel, questions: test,user: _userDto ));

    });

  }

  Future<void> change(WebSocketChannel channel) async {
    channel.stream.listen((message) {
      log(message);
    });
  }

  Future<List<QuestionDTO>?> getQuestions() async {
    final result = await _homeRepository.chats(
        startTime: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        endTime: DateFormat('yyyy-MM-dd').format(DateTime.now()));
    return result.fold((l) {
      return null;
    }, (r) async {
      final result = await _homeRepository.questions(
          id: r.first.id!, isFirstCall: true, page: 1);
      return result.fold((l) {
        return null;
      }, (r) async {
        return r.toList().reversed.toList();
      });

      //emit(const _InitialState().copyWith(chats: r));
    });
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
