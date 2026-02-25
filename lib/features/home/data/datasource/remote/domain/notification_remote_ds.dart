import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/error/exception.dart';
import 'package:nurlan_ustaz_flutter/core/platform/cache_helper/prefs.dart';
import 'package:nurlan_ustaz_flutter/core/platform/network_helper.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/get_noti_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_device_dto.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/notification_dto.dart';

abstract class HomeNotificationRemoteDs {
  Future<GetNotiDTO> getNotifications();
  Future<NotificationDTO> postNotificationDevice({
    required NotificationDeviceDTO notification,
  });
  Future<NotificationDTO> getNotificationDevice({
    required String registrationId,
  });
  Future<NotificationDTO> patchNotificationDevice({
    required String registrationId,
    required NotificationDTO notification,
  });
}

@Injectable(as: HomeNotificationRemoteDs)
class HomeNotificationRemoteDsImpl implements HomeNotificationRemoteDs {
  HomeNotificationRemoteDsImpl(this.dio);
  final Dio dio;

  @override
  Future<GetNotiDTO> getNotifications() async {
    try {
      final prefs = Prefs();
      final String? dev = await prefs.getDeviceToken();
      final response = await dio.get('${EndPoints.getNotification}$dev/');
      return GetNotiDTO.fromJson((response.data as Map<String, dynamic>));
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'] as String,
      );
    }
  }

  @override
  Future<NotificationDTO> postNotificationDevice({
    required NotificationDeviceDTO notification,
  }) async {
    try {
      final response = await dio.post(
        EndPoints.notification,
        data: jsonEncode(notification.toJson()),
      );
      return NotificationDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<NotificationDTO> getNotificationDevice({
    required String registrationId,
  }) async {
    try {
      final response = await dio.get('${EndPoints.notification}$registrationId/');
      return NotificationDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw ClientServerException(
        message: (e.response!.data as Map<String, dynamic>)['message'].toString(),
      );
    }
  }

  @override
  Future<NotificationDTO> patchNotificationDevice({
    required String registrationId,
    required NotificationDTO notification,
  }) async {
    try {
      final formData = FormData.fromMap(notification.toJson());
      final response = await dio.patch(
        '${EndPoints.notification}$registrationId/',
        data: formData,
      );
      return NotificationDTO.fromJson(response.data);
    } on DioException catch (e) {
      throw ClientServerException(
        message: e.response?.data.toString() ?? 'error',
      );
    }
  }
}
