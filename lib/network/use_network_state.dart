import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:connectivity/connectivity.dart';

bool useNetworkStatus() {
  final connected = useState(true);

  useEffect(() {
    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      connected.value = _isConnected(result);
    });
    return () {
      subscription.cancel();
    };
  }, []);

  return connected.value;
}

bool _isConnected(ConnectivityResult res) {
  return res != ConnectivityResult.none;
}
