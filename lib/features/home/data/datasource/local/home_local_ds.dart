import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:nurlan_ustaz_flutter/core/common/shared_keys.dart';
import 'package:nurlan_ustaz_flutter/core/error/excepteion.dart';

import 'package:nurlan_ustaz_flutter/features/home/data/models/geonames_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeLocalDs {
  Future<void> saveGeoToCache({
    required GeonamesDTO geo,
  });

  GeonamesDTO getGeoFromCache();

  GeonamesDTO? getGeoFromCacheNull();
}

@Injectable(as: HomeLocalDs)
class HomeLocalDsImpl extends HomeLocalDs {
  final SharedPreferences sharedPreferences;

  HomeLocalDsImpl({required this.sharedPreferences});

  @override
  Future<void> saveGeoToCache({
    required GeonamesDTO geo,
  }) async {
    await sharedPreferences.setString(
      SharedKeys.GEOOO_TOKEN,
      jsonEncode(geo.toJson()),
    );
  }

  @override
  GeonamesDTO getGeoFromCache() {
    try {
      final user = sharedPreferences.get(SharedKeys.GEOOO_TOKEN);
      if (user != null) {
        log('____________GEOO${user.toString()}');
        return GeonamesDTO.fromJson(
          jsonDecode(user.toString()) as Map<String, dynamic>,
        );
      } else {
        throw CacheException(message: 'В кэше нет запрашиваемые данные');
      }
    } catch (e) {
      log('AuthLocalDSImpl:: ${e.runtimeType == CacheException ? (e as CacheException).message : e}');
      throw CacheException(message: 'В кэше нет запрашиваемые данные');
    }
  }

  @override
  GeonamesDTO? getGeoFromCacheNull() {
    try {
      final geo = sharedPreferences.get(SharedKeys.GEOOO_TOKEN);
      if (geo != null) {
        return GeonamesDTO.fromJson(
          jsonDecode(geo.toString()) as Map<String, dynamic>,
        );
      }
      return null;
    } catch (e) {
      log('AuthLocalDSImpl getGeoFromCacheNull:: $e');
      throw CacheException(message: 'В кэше нет запрашиваемые данные');
    }
  }
}
