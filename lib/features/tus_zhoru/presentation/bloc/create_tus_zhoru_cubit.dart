import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/features/tus_zhoru/data/repositories/tus_zhoru_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/app_dinamic_link.dart';
import '../../data/models/tus_zhoru_dto.dart';

part 'create_tus_zhoru_cubit.freezed.dart';

@singleton
class CreateTusZhoruCubit extends Cubit<CreateTusZhoruState> {
  final TusZhoruRepository _repository;

  CreateTusZhoruCubit(
    this._repository,
  ) : super(const CreateTusZhoruState.initialState());

  late List<TusZhoruDTO> tosZhoruList;

  Future<void> createCustomTusZhoruPayment(int id, bool isCustom) async {
    emit(_LoadingState());
    final ipAddress = IpAddress(type: RequestType.json);
    var ip = await ipAddress.getIpAddress();
    final userIp = ip['ip'].toString();

    String tusZhoruDynamicLink = isCustom
        ? await DynamicLink().createCustomTusZhoruLink(id)
        : await DynamicLink().createTusZhoruLink(id);

    log(tusZhoruDynamicLink);
    final result = isCustom
        ? await _repository.createCustomTusZhoruPayment(
            id: id, userIp: userIp, backUrl: tusZhoruDynamicLink)
        : await _repository.createTusZhoruPayment(
            id: id, userIp: userIp, backUrl: tusZhoruDynamicLink);
    result.fold((l) => {}, (r) async {
      print(r.toString());
      final Uri url = Uri.parse(r.pgRedirectUrl.toString());
      if (!await launchUrl(url)) {
        throw Exception('Could not launch');
      }
    });
  }

  Future<void> createTusZhoru(String title, String description) async {
    final result = await _repository.createTusZhoru(
        title: title, description: description);
    result.fold((l) => {}, (r) => {emit(_LoadedState(tusZhoru: r))});
  }
}

@freezed
class CreateTusZhoruState with _$CreateTusZhoruState {
  const factory CreateTusZhoruState.initialState() = _InitialPage;

  const factory CreateTusZhoruState.loadingState() = _LoadingState;

  const factory CreateTusZhoruState.loaded({
    required TusZhoruDTO tusZhoru,
  }) = _LoadedState;

  const factory CreateTusZhoruState.errorState({
    required String message,
  }) = _ErrorState;
}
