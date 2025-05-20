import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nurlan_ustaz_flutter/features/auth/data/model/user_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/datasource/local/profile_local_ds.dart';
import 'package:re_seedwork/re_seedwork.dart';

class ProfileCubit extends Cubit<Optional<UserDto>> with ConsumerBlocMixin {
  ProfileCubit({
    required this.profileLocalDs,
    Optional<UserDto> initialState = const Optional.undefined(),
  }) : super(initialState) {
    subscribe(
      profileLocalDs,
      (value) => emit(Optional(value?.toNullable)),
    );
  }

  @protected
  final ProfileLocalDs profileLocalDs;
}
