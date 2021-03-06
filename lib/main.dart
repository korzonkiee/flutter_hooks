import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/common/button.dart';
import 'package:hooks_examples/form/form_page.dart';
import 'package:hooks_examples/geolocation/geolocation_page.dart';
import 'package:hooks_examples/network/network_status_page.dart';
import 'package:hooks_examples/todo/todo_page.dart';

import 'animation/animation_page.dart';
import 'common/centered_column.dart';
import 'common/container.dart';
import 'mixins/confusing.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Value value = Value();
    print(value.get());

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
    return AppContainer(
      child: CenteredColumn(
        children: <Widget>[
          AppButton(
            onPressed: () {
              _goTo(AnimationPage(), context);
            },
            text: "Animation",
          ),
          AppButton(
            onPressed: () {
              _goTo(GeolocationPage(), context);
            },
            text: "Geolocation",
          ),
          AppButton(
            onPressed: () {
              _goTo(NetworkStatusPage(), context);
            },
            text: "Network Status",
          ),
          AppButton(
            onPressed: () {
              _goTo(FormPage(), context);
            },
            text: "Form",
          ),
          AppButton(
            onPressed: () {
              _goTo(TodoPage(), context);
            },
            text: "Todo App",
          ),
        ],
      ),
    );
  }

  _goTo(Widget widget, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
  }
}
