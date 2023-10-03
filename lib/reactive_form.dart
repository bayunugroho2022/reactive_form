import 'package:flutter/material.dart';
import 'package:reactive_form/validator/email_validator.dart';
import 'package:reactive_form/validator/required_validator.dart';
import 'package:reactive_form/typedef.dart';
import 'package:reactive_form/validator.dart';


class ValidationMessage {
  static const String required = 'required';

  static const String email = 'email';
}

class ReactiveForm extends StatefulWidget {
  final Map<String, ValidationMessageFunction>? validationMessages;
  final TextEditingController controller;

  const ReactiveForm({
    Key? key,
    required this.controller,
    this.validationMessages,
  }) : super(key: key);

  @override
  State<ReactiveForm> createState() => _ReactiveFormState();
}

class _ReactiveFormState extends State<ReactiveForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter your email',
      ),
      controller: widget.controller,
      validator: (value) => _createValidation(widget.validationMessages),
    );
  }

  String? _createValidation(Map<String, ValidationMessageFunction>? validationMessages) {
    if (validationMessages == null) {
      return null;
    }

    final String value = widget.controller.text;

    for (final String key in validationMessages.keys) {
      final Validator? validator = _createValidator(key);
      if (validator != null) {
        final String? error = validator.validate(value!);
        if (error != null) {
          return validationMessages[key]!(error);
        }
      }
    }
    return null;
  }

  Validator? _createValidator(String key) {
    switch (key) {
      case ValidationMessage.required:
        return RequiredValidator();
      case ValidationMessage.email:
        return EmailValidator();
      default:
        return null;
    }
  }
}
