import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Creates an [TextEditingController] automatically disposed.
///
/// Changing the [text] parameter automatically updates [TextEditingController.text].
///
/// See also:
///   * [TextEditingController]
TextEditingController useTextEditingController({
  String text,
  List keys,
}) {
  return Hook.use(_TextEditingControllerHook(
    text: text,
    keys: keys,
  ));
}

class _TextEditingControllerHook extends Hook<TextEditingController> {
  final String text;

  const _TextEditingControllerHook({
    this.text,
    List keys,
  }) : super(keys: keys);

  @override
  _TextEditingControllerHookState createState() =>
      _TextEditingControllerHookState();
}

class _TextEditingControllerHookState
    extends HookState<TextEditingController, _TextEditingControllerHook> {
  TextEditingController _textEditingController;

  @override
  void didUpdateHook(_TextEditingControllerHook oldHook) {
    if (hook.text != oldHook.text) {
      _textEditingController.text = hook.text;
    }
  }

  @override
  void initHook() => _textEditingController = TextEditingController(
        text: hook.text,
      );

  @override
  TextEditingController build(BuildContext context) => _textEditingController;

  @override
  void dispose() => _textEditingController.dispose();
}
