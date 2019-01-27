import 'package:rxdart/rxdart.dart';

import 'dart:async';
import 'validators.dart';

class Bloc extends Object with Validators {
  // Object is Root Class
  final _email = BehaviorSubject<String>(); // _ for private
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (email, password) => true);

  // Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail\nPassword is $validPassword');
  }

// To avoid memory leaks
  dispose() {
    _email.close();
    _password.close();
  }
}

final bloc = Bloc();
