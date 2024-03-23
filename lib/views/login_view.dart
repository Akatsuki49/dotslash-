import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_view.dart';
import 'signup_view.dart'; // Import the signup view

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        // Sign in user with email and password
        var userCredential = await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );

        // Navigate to home view if login is successful
        if (userCredential.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        } else {
          throw FirebaseAuthException(
            code: 'sign_in_failed',
            message: 'Failed to sign in with email and password',
          );
        }
      } catch (e) {
        // Handle any errors
        print('Error logging in: $e');
        // Show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('Error logging in. Please check your email and password.'),
        ));
      }
    }
  }

  // Function to navigate to signup view
  void _goToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(
                  height:
                      8.0), // Add some space between the login and signup buttons
              TextButton(
                onPressed: _goToSignup,
                child: Text('Not registered yet? Sign up now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
