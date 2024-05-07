import 'dart:convert';
import 'dart:developer';

import 'package:espam/controller/controller/rekomtek_controller.dart';
import 'package:espam/model/model/rekomtek_model.dart';
import 'package:espam/view/Screens/Widget/overlay_loader_icon.dart';
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

    showLoadingIndicator();

    Map<String, dynamic> daftar = {"iduser": iduser};

    final response = await timelineController.getPendaftaran(daftar);
    debugPrint(response.data.toString());
    // debugPrint(user.data[0].toJson().toString());

    if (response.code == '200') {
      setState(() {
        daftarList = response.data.toList();
        jmlItem = daftarList.length;
        hideOpenDialog();
      });

      // print(daftarList[0].id);
      // print(daftarList.length);
    } else {
      hideOpenDialog();
      jmlItem = 0;
      print(response.code.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OverlayLoaderWithAppIcon(
          isLoading: true,
          appIcon: Image.asset(
            'assets/images/tde.png',
          ),
          child: Container(),
        );
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
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
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: daftarList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue,
                          child: Text(
                            "R",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(daftarList[index].nmperumahan),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(daftarList[index].nopendaftaran),
                            daftarList[index].stsajuan == 0
                                ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orangeAccent, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.orangeAccent,
                                  ),
                                  child: const Text(
                                    " PROSES ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.italic),
                                  ),
                                )
                                : daftarList[index].stsajuan == 1
                                    ? Container(
                                      decoration: BoxDecoration(
                                    border: Border.all(color: Colors.greenAccent, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.greenAccent,
                                  ),
                                      child: const Text(
                                          " SELESAI ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                    )
                                    : Container(
                                      decoration: BoxDecoration(
                                    border: Border.all(color: Colors.redAccent, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.redAccent,
                                  ),
                                      child: const Text(
                                          " TIDAK DISETUJUI ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                    ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.navigate_next,
                          color: Colors.blue,
                        ),
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
                      );
                    },
                  ),
                ],
              ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.of(context).pushNamed("daftar_rekomtek");
      //   },
      //   tooltip: 'New',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
