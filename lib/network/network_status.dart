import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/network/use_network_state.dart';

class NetworkStatus extends HookWidget {
  const NetworkStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = useNetworkStatus(
      onConnected: () {
        _onConnected(context);
      },
      onDisconnected: () {
        _onDisconnected(context);
      },
    );

    return Text("Connected: $status");
  }

  _onConnected(BuildContext ctx) {
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text("Connectivity retrieved."),
      ),
    );
  }

  _onDisconnected(BuildContext ctx) {
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text("Connectivity lost."),
      ),
    );
  }
}
