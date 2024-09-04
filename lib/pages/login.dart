import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var unController = TextEditingController();
  var pwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Form'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                  controller: unController,
                  decoration: const InputDecoration(
                      labelText: 'Username',
                      //helperText: 'Username is requird!',
                      prefixIcon: Icon(Icons.person),
                      //errorText: 'Username is empty!',
                      focusedBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(20)
                          ),
                      border: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(4.0))
                          )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: pwController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.password),
                      labelText: 'Password',
                      //helperText: 'Password is requird!',
                      //errorText: 'Username is empty!',
                      border: OutlineInputBorder(
                          //borderRadius: BorderRadius.all(Radius.circular(4.0))
                          )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 5) {
                      return 'Password required 5 character';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigate the user to the Home page
                    log(unController.text, name: 'un');
                    log(pwController.text, name: 'pw');
                    Fluttertoast.showToast(
                        msg: " Login Success!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill input')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
