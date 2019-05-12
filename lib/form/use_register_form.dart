import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_examples/todo/hooks.dart';

class _RegisterForm {
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController rpassword;

  final bool Function() validate;

  final String error;

  _RegisterForm(
      this.email, this.password, this.rpassword, this.validate, this.error);
}

_RegisterForm useRegisterForm() {
  final email = useTextEditingController();
  final password = useTextEditingController();
  final rpassword = useTextEditingController();

  final error = useState("");

  final validate = useMemoized(() => () {
        if (!email.text.contains("@")) {
          error.value = "Invalid email";
          return false;
        } else if (password.value.text != rpassword.value.text) {
          error.value = "Passwords don't match";
          return false;
        }
        error.value = "";
        return true;
      });

  return _RegisterForm(email, password, rpassword, validate, error.value);
}
