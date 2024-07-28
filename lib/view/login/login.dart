import 'package:espam/controller/controller_login/login_controller.dart';
import 'package:espam/view/Screens/Widget/msgbox.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isSecure = true;
  bool lockStatus = false;

  final loginController = LoginController();
  String? code;
  bool? isLogin;
  int? iduser;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  // final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  login() async {
    // isLogin = false;

    Map<String, dynamic> newLogin = {
      "email": email.text,
      "password": password.text
    };

    final user = await loginController.login(newLogin);
    debugPrint(user.toJson().toString());
    debugPrint(user.code);
    // debugPrint(user.data[0].iduser);
    setState(() {
      code = user.code;
    });

    if (user.code == '200') {
      isLogin = true;
      _saveLoginSuccess(user.data[0].iduser, user.data[0].nama, user.data[0].alamat, user.data[0].isRole, isLogin==true);

      SharedPreferences pref = await SharedPreferences.getInstance();
      debugPrint(pref.getString('nama'));
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('navbar');
    } else {
      isLogin = false;

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return MsgBoxOk(
            title: 'Login Gagal',
            content: 'Periksa kembali email dan password.',
            onConfirm: () {
              // Handle confirmation action here
              Navigator.of(context).pop(); // Close the dialog
            },
          );
        },
      );
    }

  }

  void _saveLoginSuccess(
    String iduser,
    String nama,
    String alamat,
    String isRole,
    bool isLogin
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('iduser', int.parse(iduser));
    pref.setString('nama', nama);
    pref.setString('alamat', alamat);
    pref.setBool('isLogin', isLogin);
    pref.setInt('isRole', int.parse(isRole));
  }

  void lockTapped(bool status) {
    setState(() {
      if (isSecure) {
        isSecure = false;
      } else {
        isSecure = true;
      }
    });
  }

  cekLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint("STS LOGIN ${pref.getBool("isLogin")}");
    return;
  }

  @override
  void initState() {
    super.initState();
    cekLogin();
  }

  @override
  void dispose() async {
    super.dispose();
    email.text = '';
    password.text = '';
    // isLogin = false;

    // SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.setInt('iduser', 0);
    // pref.setString('nama', '');
    // pref.setString('alamat', '');
    // pref.setBool('isLogin', false);

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

                      TextField(
                        controller: email,
                        autocorrect: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
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
                        controller: password,
                        obscureText: true,
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
                              login();
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
