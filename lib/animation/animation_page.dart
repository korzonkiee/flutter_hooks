import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/common/button.dart';
import 'package:hooks_examples/common/centered_column.dart';
import 'package:hooks_examples/common/container.dart';

class AnimationPage extends HookWidget {
  const AnimationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final started = useState(false);

    final controller =
        useAnimationController(duration: Duration(milliseconds: 700));

    final valueTween = useMemoized(
        () => CurveTween(curve: Curves.easeOut).animate(controller));

    return AppContainer(
      child: CenteredColumn(
        children: <Widget>[
          HookBuilder(
            builder: (ctx) {
              return CircularProgressIndicator(
                value: useAnimation(valueTween),
              );
            },
          ),
          AppButton(
            onPressed: () {
              if (started.value) {
                controller.reverse();
              } else {
                controller.forward();
              }
              started.value = !started.value;
            },
            text: started.value ? "Reverse" : "Forward",
          )
        ],
      ),
    );
  }
}
