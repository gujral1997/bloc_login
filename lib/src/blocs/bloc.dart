import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
  // Object is Root Class
  final _email = StreamController<String>(); // _ for private
  final _password = StreamController<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

// To avoid memory leaks
  dispose() {
    _email.close();
    _password.close();
  }
}
