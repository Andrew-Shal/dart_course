import 'package:flutter/material.dart';
import '../mixins/validations_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;
  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
        margin: EdgeInsets.all(20.00),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              passwordField(),
              submitButton(),
            ],
          ),
        ));
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (value) => {email = value},
    );
  }

  Widget passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: '',
        suffixIcon: FlatButton.icon(
            onPressed: togglePasswordVisibility,
            icon: Icon(Icons.visibility),
            label: Text('show/hide')),
      ),
      obscureText: passwordVisibility,
      autocorrect: false,
      validator: validatePassword,
      onSaved: (value) => {password = value},
    );
  }

  Widget submitButton() {
    return RaisedButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
            print('Time to post $email and $password to my API');
          }
        },
        child: Center(
          child: Text('login'),
        ));
  }

  togglePasswordVisibility() {
    print(passwordVisibility);
    setState(() {
      passwordVisibility = !passwordVisibility;
    });
  }
}
