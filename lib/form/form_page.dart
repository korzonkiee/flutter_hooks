import 'package:flutter/material.dart';
import 'package:hooks_examples/common/container.dart';
import 'package:hooks_examples/form/register_form.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: RegisterForm(),
      ),
    );
  }
}
