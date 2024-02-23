import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    Size screenSize = MediaQuery.of(context).size;
    // Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.network(
                  "http://180.250.162.129:8686/sim/assets/images/rekomtek/slide1.png"),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              // width: MediaQuery.of(context).size.width,
              child: Card(
                margin: const EdgeInsets.all(20.0),
                color: Colors.transparent,
                elevation: 0, //ketebalannya
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(8),
                //   side: BorderSide(color: Colors.black, width: 1.0)
                // ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenSize.width * (5 / 100)),
                        ),
                        // Text(
                        //   "Login${screenSize.width.toStringAsFixed(2)}",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: screenSize.width * (5 / 100)),
                        // ),
                      ),
                      //textbox

                      const TextField(
                        autocorrect: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.blueAccent,
                          ),
                          labelText: "Email", //set labelnya
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      //Password
                      TextField(
                        // obscureText: isSecure,
                        autocorrect: false,
                        // controller: passController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: (isSecure)
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            color: Colors.blueAccent,
                            onPressed: () => lockTapped(lockStatus),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orangeAccent),
                          ),
                          labelText: "Password", //set labelnya
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 5, left: 15.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("navbar");
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //untuk forgot password
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 5, right: 15.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            children: <Widget>[
                              // Column(
                              //   children: <Widget>[
                              //     InkWell(
                              //       child: const Text(
                              //         "Register",
                              //         style: TextStyle(
                              //             color: Colors.orangeAccent,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       onTap: () {
                              //         Navigator.of(context)
                              //             .pushReplacementNamed("navbar");
                              //       },
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(
                                width: 25.0,
                              ),
                              Column(
                                children: <Widget>[
                                  InkWell(
                                    child: const Text(
                                      "Forgot Password",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
