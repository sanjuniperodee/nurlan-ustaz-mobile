import 'dart:convert';
import 'dart:developer';

import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';
import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Prefs {
  final SharedPreferences? sharedPreferences;

  Prefs({
    this.sharedPreferences,
  });

  Future<void> logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> saveDeviceToken(String deviceToken) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('device_token', deviceToken);
  }

  Future<String?> getDeviceToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? deviceToken =
        sharedPreferences.get('device_token') as String?;
    return deviceToken;
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ?? '';
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedKeys.TOKEN);
  }

  void setToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token ?? '');
  }

  void setUserName(String? name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', name ?? '');
  }

  Future<void> saveUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('user_id', userId);
    await getUserId();
  }

  Future<int?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('user_id');
    return userId;
  }

  Future<void> saveClientId(int clientID) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('client_iD', clientID);
    await getUserId();
  }

  Future<int?> getClientId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? clientID = prefs.getInt('client_iD');
    return clientID;
  }

  Future<String?> getPin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('pin') ?? 'Null';
  }

  void setPin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pin', pin);
  }

  void removePin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('pin');
  }

  void clearAllData() async {
    removePin();
    // setIsAuthenticated(false);
    // setEmail('');
    // setPassword('');
    // setIin('');
    // setIsBiometricsEnabled(false);
    // setIsNotificationEnabled(false);
    setUserName('');
  }


}
