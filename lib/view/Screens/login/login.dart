import 'package:espam/view/Screens/Widget/button.dart';
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
                        fillColor: Colors.grey[200],
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical:
                              16, // Ubah ukuran vertikal sesuai keinginan Anda
                          horizontal:
                              10, // Ubah ukuran horizontal sesuai keinginan Anda
                        ),
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
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical:
                              16, // Ubah ukuran vertikal sesuai keinginan Anda
                          horizontal:
                              10, // Ubah ukuran horizontal sesuai keinginan Anda
                        ),
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
                    InkWell(
                      onTap: (){
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacementNamed("navbar");
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1.0),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,                    ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: Text("Login", style: TextStyle(color: Colors.white),)),
                        ),
                      ),
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
