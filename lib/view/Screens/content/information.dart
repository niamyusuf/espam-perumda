import 'package:espam/view/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  Future logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", false);
    pref.setString('kode', '');
    pref.setString('nama', '');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) {
        return const LoginScreen();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 68, 122),
        title: const Text(
          "Contact Person",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              logOut();
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.white,),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        size: 40,
                      ),
                      title: Text("0341-000000"),
                      subtitle: Text("telp"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.chat_bubble_2,
                        size: 40,
                      ),
                      title: Text("Messenger"),
                      subtitle: Text("Messenger"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        CupertinoIcons.mail,
                        size: 40,
                      ),
                      title: Text("email@tirtakanjuruhan.com"),
                      subtitle: Text("Email"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
