import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:connectivity/connectivity.dart';

bool useNetworkStatus() {
  final connected = useState(true);

  useEffect(() {
    Connectivity().checkConnectivity().then((result) {
      connected.value = _isConnected(result);
    });

    print("Subscribing for connectivity changes.");

    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      connected.value = _isConnected(result);
    });

    return () {
      print("Disposing connectivity subscription.");
      subscription.cancel();
    };
  }, []);

  return connected.value;
}

bool _isConnected(ConnectivityResult res) {
  return res != ConnectivityResult.none;
}
