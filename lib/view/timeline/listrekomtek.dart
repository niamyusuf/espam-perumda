import 'dart:convert';
import 'dart:developer';

import 'package:espam/controller/controller_timeline/timeline_controller.dart';
import 'package:espam/model/model_timeline/timeline_model.dart';
import 'package:espam/view/Screens/content/timeline.dart';
import 'package:espam/view/timeline/tl_rekomtek.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListRekomtek extends StatefulWidget {
  const ListRekomtek({super.key});

  @override
  State<ListRekomtek> createState() => _ListRekomtekState();
}

class _ListRekomtekState extends State<ListRekomtek> {
  int? iduser;
  String? code;
  int? jmlItem;

  final timelineController = TimelineController();

  List<DataDaftar> daftarList = [];

  getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(pref.getInt('iduser').toString());
    iduser = pref.getInt('iduser');

    Map<String, dynamic> daftar = {"iduser": iduser};

    final response = await timelineController.getPendaftaran(daftar);
    // debugPrint(response.data.toString());
    // debugPrint(user.data[0].toJson().toString());

    if (response.code == '200') {
      setState(() {
        daftarList = response.data.toList();
        jmlItem = daftarList.length;
      });

      // print(daftarList[0].id);
      // print(daftarList.length);
    } else {
      jmlItem = 0;
      print(response.code.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Pengajuan ",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 68, 122),
        leading: const BackButton(color: Colors.white),
      ),
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.blue,
        onRefresh: () {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: jmlItem == null
            ? ListView(
                children: [
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.data_object_sharp,
                            color: Colors.grey,
                          ),
                          Text(
                            "No Data",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : ListView(
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: daftarList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.white,
                        elevation: 2,
                        // shape: Border.all(color: Colors.grey, width: 2),
                        child: ListTile(
                          title: Text(daftarList[index].nopendaftaran),
                          subtitle: Text(daftarList[index].id),
                          trailing: const Icon(Icons.navigate_next),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TlSpam(
                                  nodaftar: daftarList[index].nopendaftaran,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
