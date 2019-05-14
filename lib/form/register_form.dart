import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/common/button.dart';
import 'package:hooks_examples/common/centered_column.dart';
import 'package:hooks_examples/common/text.dart';
import 'package:hooks_examples/common/text_field.dart';
import 'package:hooks_examples/form/use_register_form.dart';

class RegisterForm extends HookWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final form = useRegisterForm();

    return CenteredColumn(
      children: <Widget>[
        AppTextField(
          hintText: "Email",
          controller: form.email,
        ),
        AppTextField(
          hintText: "Password",
          obscureText: true,
          controller: form.password,
        ),
        AppTextField(
          hintText: "Repeat password",
          obscureText: true,
          controller: form.rpassword,
        ),
        Container(
          margin: EdgeInsets.only(top: 32),
          child: AppButton(
              text: "Login",
              onPressed: () {
                if (form.validate()) {
                  _onSuccess(context);
                }
              }),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: AppText(form.error,
              style: TextStyle(fontSize: 20, color: Colors.red)),
        ),
      ],
    );
  }

  _onSuccess(BuildContext ctx) {
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text("Successfully registered."),
      ),
    );
  }
}
