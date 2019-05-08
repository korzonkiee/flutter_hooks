import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/scheduler.dart';

bool useNetworkStatus({Function onConnected, Function onDisconnected}) {
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

  final prevStatus = usePrevious(connected.value);

  final lost = prevStatus != null && prevStatus && !connected.value;
  final restored = prevStatus != null && !prevStatus && connected.value;

  if (lost) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      onDisconnected();
    });
  }

  if (restored) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      onConnected();
    });
  }

  return connected.value;
}

bool _isConnected(ConnectivityResult res) {
  return res != ConnectivityResult.none;
}
