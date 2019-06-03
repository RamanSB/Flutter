import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  Map<String, dynamic> _userData = {"email":"", "password":"", 'isTermsAccepted': false};
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'E-Mail', filled: true, fillColor: Colors.white),
        keyboardType: TextInputType.emailAddress,
        onSaved: (String value) {
          _userData['email'] = value;
        },
        validator: (String value) {
          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return "Input must be a valid email address.";
          }
        });
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Password', filled: true, fillColor: Colors.white),
        obscureText: true,
        onSaved: (String value) {
          _userData['password'] = value;
        },
        validator: (String value) {
          if (value.trim().isEmpty || value.trim().length < 6) {
            return "Password must be atleast 6 characters.";
          }
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _userData['isTermsAccepted'],
      onChanged: (bool value) {
        setState(() {
          _userData['isTermsAccepted'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm() {
    bool isFormValid = _formKey.currentState.validate();
    if (!isFormValid && !_userData['isTermsAccepted']) {
      return;
    }
      _formKey.currentState.save();
      print(_userData['email']);
      print(_userData['password']);
      Navigator.pushReplacementNamed(context, '/products');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildEmailTextField(),
                    SizedBox(
                      height: 10.9,
                    ),
                    _buildPasswordTextField(),
                    _buildAcceptSwitch(),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      child: Text('LOGIN'),
                      onPressed: _submitForm,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
