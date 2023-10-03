import 'package:reactive_form/validator.dart';

class EmailValidator extends Validator {
  
  @override
  String? validate(String value) {
    if (!value.contains('@')) {
      return 'This field must be a valid email';
    }

    return null;
  }
}