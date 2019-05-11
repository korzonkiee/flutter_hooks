import 'package:flutter/material.dart';
import 'package:hooks_examples/common/container.dart';
import 'package:hooks_examples/network/network_status.dart';

class NetworkStatusPage extends StatelessWidget {
  const NetworkStatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Center(
        child: NetworkStatus(),
      ),
    );
  }
}
