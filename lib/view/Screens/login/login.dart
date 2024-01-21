import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isSecure = true;
  bool lockStatus = false;

  void lockTapped(bool status) {
    setState(() {
      if (isSecure) {
        isSecure = false;
      } else {
        isSecure = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/logo.png"),
        //     fit: BoxFit.fitHeight,
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/tde.png",
                      width: 150,
                      height: 150,
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.email,
                          color: Colors.blueAccent,
                        ),
                        labelText: 'Email',
                        filled: true,
                        border: InputBorder.none,
                        fillColor: Colors.grey[200],
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      autocorrect: false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: (isSecure)
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          color: Colors.blueAccent,
                          onPressed: () => lockTapped(lockStatus),
                        ),
                        labelText: 'Password',
                        filled: true,
                        border: InputBorder.none,
                        fillColor: Colors.grey[200],
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password ';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform login logic here
                          // If login is successful, navigate to next screen
                          // Navigator.pushReplacementNamed(context, '/home');
                          Navigator.of(context).pushReplacementNamed("navbar");
                        }
                      },
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
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
