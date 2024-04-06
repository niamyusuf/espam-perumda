// import 'dart:math';

// import 'package:another_stepper/another_stepper.dart';
// import 'package:espam/controller/controller_timeline/timeline_controller.dart';
// import 'package:espam/model/model_timeline/timeline_model.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TimeLine extends StatefulWidget {
//   final String? nodaftar;

//   const TimeLine({super.key, required this.nodaftar});

//   @override
//   State<TimeLine> createState() => _TimeLineState();
// }

// class _TimeLineState extends State<TimeLine> {
//   String? iduser;
//   int? jmlItem;
//   int? stsVerifikasi1 =0;

//   final timelineController = TimelineController();
//   List<DataTimeline> tl = [];

//   getDataTL() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     iduser = pref.getInt('iduser').toString();

//     Map<String, dynamic> daftarTL = {
//       "iduser": iduser,
//       "nodaftar": widget.nodaftar
//     };

//     debugPrint(daftarTL.toString());

//     final response = await timelineController.getTimeLine(daftarTL);
//     if (response.code == '200') {
//       // debugPrint(response.toJson().toString());
//       tl = response.data.toList();
//       jmlItem = tl.length;

//       debugPrint(tl[1].toJson().toString());

//       print(jmlItem);
//       setState(() {
//         stsVerifikasi1 = 0;  
//       });
      

//       // // Lakukan perulangan pada data JSON
//       // for (var item in tl) {
//       //   print('Posisi: ${item.posisi}, Verfiikasi: ${item.stsverifikasi}');
//       //   switch (item.posisi) {
//       //     case 1:
//       //       if (item.stsverifikasi == 1) {
//       //         stsVerifikasi1 = Colors.green;
//       //       }
//       //       break;

//       //     default:
//       //     // stsVerifikasi1 = Colors.grey;
//       //   }
//       // }

//       // print(daftarList.length);
//     } else {
//       jmlItem = 0;
//       print(response.code.toString());
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getDataTL();
//     debugPrint(jmlItem.toString());
//   }

//   List<StepperData> stepperData = [
    
//     StepperData(
//       title: StepperText("Pengajuan"),
//       subtitle: StepperText("Pengajuan Pengurusan Rekomtek Perumahan"),
//       iconWidget: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: const BoxDecoration(
//           color:  Colors.green,
//           borderRadius: BorderRadius.all(Radius.circular(30)),
//         ),
//         child: Icon(Icons.check, color: Colors.white),
//       ),
//     ),
//     StepperData(
//         title: StepperText("Verifikasi"),
//         subtitle: StepperText("Verifikasi Kelengkapan Persyaratan"),
//         iconWidget: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: const BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: const Icon(Icons.sync, color: Colors.white),
//         )),
//     StepperData(
//         title: StepperText("Survey Lapangan"),
//         subtitle: StepperText(
//             "Survey Lapangan oleh Team Perumahan Perumda Tirta Kanjuruhan"),
//         iconWidget: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: const BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: const Icon(Icons.looks_3, color: Colors.white),
//         )),
//     StepperData(
//         title: StepperText("Expose Hasil Survey"),
//         subtitle: StepperText(
//             "Penyampaian Hasil Survey oleh Team Perumahan Perumda Tirta Kanjuruhan"),
//         iconWidget: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: const BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: const Icon(Icons.looks_4, color: Colors.white),
//         )),
//     StepperData(
//         title: StepperText("Terbit Rekomtek"),
//         subtitle: StepperText("Penerbitan Surat Rekomendasi Teknis Perumahan"),
//         iconWidget: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: const BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.all(Radius.circular(30))),
//           child: const Icon(CupertinoIcons.wand_stars, color: Colors.white),
//         )),
//     // StepperData(
//     //     title: StepperText("Delivered",
//     //         textStyle: const TextStyle(color: Colors.grey)),
//     //     iconWidget: Container(
//     //       padding: const EdgeInsets.all(8),
//     //       decoration: const BoxDecoration(
//     //           color: Colors.grey,
//     //           borderRadius: BorderRadius.all(Radius.circular(30))),
//     //     )),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Status Pengajuan ${widget.nodaftar}',
//           style: const TextStyle(fontSize: 15, color: Colors.white),
//         ),
//         backgroundColor: const Color.fromARGB(255, 2, 68, 122),
//         leading: const BackButton(color: Colors.white),
//       ),
//       body: RefreshIndicator(
//         color: Colors.white,
//         backgroundColor: Colors.blue,
//         onRefresh: () {
//           return Future<void>.delayed(const Duration(seconds: 3));
//         },
//         // notificationPredicate: (ScrollNotification notification){
//         //   return notification.depth == 1;
//         // },
//         child: Stack(
//           children: [
//             ListView(
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: AnotherStepper(
//                         stepperList: stepperData,
//                         stepperDirection: Axis.vertical,
//                         iconWidth: 40,
//                         iconHeight: 40,
//                         activeBarColor: stsVerifikasi1 == 0 ? Colors.grey : Colors.green,
//                         inActiveBarColor: Colors.grey,
//                         inverted: false,
//                         verticalGap: 30,
//                         activeIndex: 1, //warna pada garis
//                         barThickness: 8,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
