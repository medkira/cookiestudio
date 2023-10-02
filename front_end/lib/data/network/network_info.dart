import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImp implements NetworkInfo {
  final Connectivity connectivity;
  NetworkInfoImp(this.connectivity);
  @override
  Future<bool> get isConnected async {
    final connectionResult = await connectivity.checkConnectivity();
    if (connectionResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
