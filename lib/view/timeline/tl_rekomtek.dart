import 'package:espam/controller/controller_timeline/timeline_controller.dart';
import 'package:espam/model/model_timeline/timeline_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../Screens/Widget/overlay_loader_icon.dart';

class TlSpam extends StatefulWidget {
  final String? nodaftar;

  const TlSpam({super.key, required this.nodaftar});

  @override
  State<TlSpam> createState() => _TlSpamState();
}

class _TlSpamState extends State<TlSpam> {
  String? iduser;
  int? jmlItem;
  int stsVerifikasi1 = 0;
  int stsVerifikasi2 = 0;
  int stsVerifikasi3 = 0;
  int stsVerifikasi4 = 0;
  int stsVerifikasi5 = 0;
  String nopendaftaran = "-";
  String nmperumahan="";

  final timelineController = TimelineController();
  List<DataTimeline> tl = [];

  getDataTL() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    iduser = pref.getInt('iduser').toString();
    showLoadingIndicator();

    Map<String, dynamic> daftarTL = {
      "iduser": iduser,
      "nodaftar": widget.nodaftar
    };

    debugPrint(daftarTL.toString());

    final response = await timelineController.getTimeLine(daftarTL);
    if (response.code == '200') {
      debugPrint(response.toJson().toString());
      tl = response.data.toList();
      jmlItem = tl.length;

      debugPrint("HASIL " + tl[1].toJson().toString());

      nmperumahan = response.data[0].nnmperumahan;

      print(jmlItem);
      setState(() {
        stsVerifikasi1 = 0;
        stsVerifikasi2 = 0;
        stsVerifikasi3 = 0;
        stsVerifikasi4 = 0;
        stsVerifikasi5 = 0;
        nopendaftaran = widget.nodaftar!;
      });

      // // Lakukan perulangan pada data JSON
      for (var item in tl) {
        print('Posisi: ${item.posisi}, Verfiikasi: ${item.stsverifikasi}');
        switch (item.posisi) {
          case 1:
            stsVerifikasi1 = item.stsverifikasi;
            break;
          case 2:
            stsVerifikasi2 = item.stsverifikasi;
            break;
          case 3:
            stsVerifikasi3 = item.stsverifikasi;
            break;
          case 3:
            stsVerifikasi4 = item.stsverifikasi;
            break;
          case 5:
            stsVerifikasi5 = item.stsverifikasi;
            break;

          default:
            stsVerifikasi1 = 0;
            stsVerifikasi2 = 0;
            stsVerifikasi3 = 0;
            stsVerifikasi4 = 0;
            stsVerifikasi5 = 0;
        }
      }
      hideOpenDialog();
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
    getDataTL();
    debugPrint(jmlItem.toString());
  }

  void showLoadingIndicator2() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // ignore: deprecated_member_use
        return WillPopScope(
            onWillPop: () async => false,
            child: const AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              backgroundColor: Colors.black87,
              content: SizedBox(
                width: 32,
                height: 82,
                child: Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 10,),
                      Text("Mengambil Data...", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
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
          'Status Pengajuan',
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 68, 122),
        leading: const BackButton(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.only(
          bottom: 10.0,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.green,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("No. Pedaftaran : "),
                        Text(
                          nopendaftaran,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Perumahan : "),
                        Text(
                          nmperumahan,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    timelineRow(
                        "Pengajuan",
                        "Pengajuan Pengurusan Rekomtek Perumahan",
                        stsVerifikasi1,
                        Icons.insert_drive_file_outlined),
                    timelineRow(
                        "Verifikasi",
                        "Verifikasi Kelengkapan Persyaratan",
                        stsVerifikasi2,
                        Icons.check),
                    timelineRow(
                        "Survey Lapangan",
                        "Survey Lapangan oleh Team Perumahan Perumda Tirta Kanjuruhan",
                        stsVerifikasi3,
                        Icons.sync),
                    timelineRow(
                        "Expose Hasil Survey",
                        "Penyampaian Hasil Survey oleh Team Perumahan Perumda Tirta Kanjuruhan",
                        stsVerifikasi4,
                        CupertinoIcons.book),
                    timelineLastRow(
                        "Terbit Rekomtek",
                        "Penerbitan Surat Rekomendasi Teknis Perumahan",
                        stsVerifikasi5,
                        CupertinoIcons.wand_stars),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timelineRow(
      String title, String subTile, int isVerifikasi, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: isVerifikasi == 0 ? Colors.grey : Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 5,
                height: 50,
                decoration: BoxDecoration(
                  color: isVerifikasi == 0 ? Colors.grey : Colors.green,
                  shape: BoxShape.rectangle,
                ),
                child: const Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              ListTile(
                title: Text(title),
                subtitle: Text(subTile),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget timelineLastRow(
      String title, String subTile, int isVerifikasi, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: isVerifikasi == 0 ? Colors.grey : Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 5,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.rectangle,
                ),
                child: const Text(""),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              ListTile(
                title: Text(title),
                subtitle: Text(subTile),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
