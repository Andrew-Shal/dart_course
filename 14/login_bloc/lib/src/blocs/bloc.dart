import 'dart:async';
// import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

// class Bloc extends Validators
class Bloc extends Object with Validators {
  // private props

  // replaced with behavior subject offered by rxdart
  // final _email = StreamController<String>.broadcast();
  // final _password = StreamController<String>.broadcast();

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Retreive data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submit() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
