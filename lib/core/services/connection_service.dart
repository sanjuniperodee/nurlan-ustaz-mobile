import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:evrasia_spb/domain/connection/connection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:re_seedwork/re_seedwork.dart';

abstract class ConnectionService extends ValueStore<bool> {
  Future<bool> checkConnection();

  void dispose();
}

@Singleton(as: ConnectionService)
class ConnectionServiceImpl extends InMemoryValueStore<bool>
    implements ConnectionService {
  ConnectionServiceImpl({required this.connectivity}) : super(true) {
    _connectivityResultSubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @FactoryMethod(preResolve: true)
  static Future<ConnectionServiceImpl> init({
    required Connectivity connectivity,
  }) async {
    final service = ConnectionServiceImpl(connectivity: connectivity);
    await service.checkConnection();
    return service;
  }

  @protected
  final Connectivity connectivity;

  StreamSubscription<List<ConnectivityResult>>? _connectivityResultSubscription;

  @override
  Future<bool> checkConnection() async {
    return updateConnectionStatus(await connectivity.checkConnectivity());
  }

  @visibleForTesting
  Future<bool> updateConnectionStatus(List<ConnectivityResult> statuses) async {
    await put(!statuses.contains(ConnectivityResult.none));
    return data;
  }

  @override
  void dispose() {
    _connectivityResultSubscription?.cancel();
  }
}
