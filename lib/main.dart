import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/common/button.dart';
import 'package:hooks_examples/geolocation/geolocation_page.dart';
import 'package:hooks_examples/network/network_status_page.dart';
import 'package:hooks_examples/todo/todo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppButton(
              onPressed: () {
                _goTo(GeolocationPage(), context);
              },
              text: "Geolocation hook",
            ),
            AppButton(
              onPressed: () {
                _goTo(NetworkStatusPage(), context);
              },
              text: "Network hook",
            ),
            AppButton(
              onPressed: () {
                _goTo(TodoPage(), context);
              },
              text: "Todo app",
            ),
          ],
        ),
      ),
    );
  }

  _goTo(Widget widget, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
  }
}
