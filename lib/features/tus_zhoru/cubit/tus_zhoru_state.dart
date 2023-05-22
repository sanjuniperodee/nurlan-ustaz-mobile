import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/model/tus_zhoru_model.dart';

part 'tus_zhoru_state.freezed.dart';

@Freezed()
abstract class TusZhoruState with _$TusZhoruState {
  const factory TusZhoruState.main({

    @Default([]) List<TusZhoruModel> tusZhoruModels,
    @Default (0) int initialIndex,


  }) = TusZhoruMain;
}
