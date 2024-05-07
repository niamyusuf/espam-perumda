import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/creditCard/credit_card.dart';
import '../Widget/creditCard/extra/card_type.dart';
import '../Widget/creditCard/style/card_background.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? nama;
  String? alamat;

  void getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(pref.getString('alamat'));
    setState(() {
      nama = pref.getString('nama');
      alamat = pref.getString('alamat');
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
      body: SingleChildScrollView(
        child: Stack(
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
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  CreditCard(
                    cardNumber: "5450 7879 4864 7854",
                    cardExpiry: "10/25",
                    cardHolderName: "Card Registration",
                    cvv: "456",
                    bankName: "Perumda Tirta Kanjuruhan",
                    cardType: CardType
                        .pdam, // Optional if you want to override Card Type
                    showBackSide: false,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    textExpDate: 'Exp. Date',
                    textName: 'Name',
                    textExpiry: 'MM/YY',
                  ),
                  Padding(
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
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
                        const SizedBox(
                          height: 10,
                        ),
                        Container(),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
