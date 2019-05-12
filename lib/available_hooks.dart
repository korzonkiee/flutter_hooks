import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/common/button.dart';

class AvailableHooks extends HookWidget {
  const AvailableHooks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    useEffect(() {
      // return () {

      // };
    }, []);

    return Column(
      children: <Widget>[
        Text("Counter: ${counter.value}"),
        RaisedButton(
          onPressed: () {
            counter.value++;
          },
        ),
      ],
    );
  }
}
