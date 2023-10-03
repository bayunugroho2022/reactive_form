# reactive_form example

```dart 
    ReactiveForm(
        controller: emailController,
        validationMessages: {
            ValidationMessage.required: (error) => 'This field is required',
            ValidationMessage.email: (error) => error, // this message from validator
            // ValidationMessage.email: (error) => 'This field must be a valid email',
        },
    )
 ```
