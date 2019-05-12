import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/common/button.dart';
import 'package:hooks_examples/common/centered_column.dart';
import 'package:hooks_examples/common/container.dart';

T useMyAnimation<T>(Animation<T> Function() animationPredicate) {
  return useAnimation(animationPredicate());
}

class AnimationPage extends HookWidget {
  const AnimationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final started = useState(false);
    final slow = useState(false);

    final slowController =
        useAnimationController(duration: Duration(milliseconds: 700));
    final fastController =
        useAnimationController(duration: Duration(milliseconds: 300));

    final slowTween = useMemoized(
        () => CurveTween(curve: Curves.easeOut).animate(slowController));
    final fastTween = useMemoized(
        () => CurveTween(curve: Curves.easeOut).animate(fastController));

    return AppContainer(
      child: CenteredColumn(
        children: <Widget>[
          HookBuilder(
            builder: (ctx) {
              return CircularProgressIndicator(
                value: useMyAnimation(() {
                  return slow.value ? slowTween : fastTween;
                }),
              );
            },
          ),
          AppButton(
            onPressed: () {
              slow.value = true;

              if (started.value) {
                slowController.reverse();
              } else {
                slowController.forward();
              }

              started.value = !started.value;
            },
            text: "Slow",
          ),
          AppButton(
            onPressed: () {
              slow.value = false;

              if (started.value) {
                fastController.reverse();
              } else {
                fastController.forward();
              }

              started.value = !started.value;
            },
            text: "Fast",
          ),
        ],
      ),
    );
  }
}
