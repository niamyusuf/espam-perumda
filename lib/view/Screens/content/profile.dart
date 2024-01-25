import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                    color: Colors.green
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
                child: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    children: [
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
