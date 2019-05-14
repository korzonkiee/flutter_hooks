import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/network/use_network_state.dart';

class NetworkStatus extends HookWidget {
  const NetworkStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = useNetworkStatus();
    return Text("Connected: $status");
  }
}
