import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? nama;
  String? alamat;

  void getProfile()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(pref.getString('alamat'));
    setState(() {
      nama    = pref.getString('nama');
      alamat  = pref.getString('alamat');  
    });
    
  }
  @override
  void initState() {
    super.initState();
    getProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // margin: EdgeInsets.only(top: 50.0),
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 2, 68, 122),
                    ),
                child: const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  // boxShadow: const [
                  //   BoxShadow(color: Colors.black, blurRadius: 25.0),
                  // ],
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                title: Text("Nama : $nama"),
                                subtitle: Text("Alamat : $alamat"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Card(
                              child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Nama"),
                                subtitle: Text("Alamat"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        ],
      ),
     
    );
  }
}
