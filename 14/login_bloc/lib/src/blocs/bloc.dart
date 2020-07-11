import 'dart:async';
// import 'package:flutter/material.dart';

import 'validators.dart';

// class Bloc extends Validators
class Bloc extends Object with Validators {
  // private props
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Retreive data from stream
  Stream<String> get email => _email.stream;
  Stream<String> get password => _password.stream;

  dispose() {
    _email.close();
    _password.close();
  }
}

// global approach

final bloc = Bloc();
