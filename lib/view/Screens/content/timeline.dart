import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  List<StepperData> stepperData = [
    StepperData(
        title: StepperText("Pengajuan"),
        subtitle: StepperText("Pengajuan Pengurusan Rekomtek Perumahan"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.check, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Verifikasi"),
        subtitle: StepperText("Verifikasi Kelengkapan Persyaratan"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.sync, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Survey Lapangan"),
        subtitle: StepperText(
            "Survey Lapangan oleh Team Perumahan Perumda Tirta Kanjuruhan"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_3, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Expose Hasil Survey"),
        subtitle: StepperText(
            "Penyampaian Hasil Survey oleh Team Perumahan Perumda Tirta Kanjuruhan"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(Icons.looks_4, color: Colors.white),
        )),
    StepperData(
        title: StepperText("Terbit Rekomtek"),
        subtitle: StepperText("Penerbitan Surat Rekomendasi Teknis Perumahan"),
        iconWidget: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: const Icon(CupertinoIcons.wand_stars, color: Colors.white),
        )),
    // StepperData(
    //     title: StepperText("Delivered",
    //         textStyle: const TextStyle(color: Colors.grey)),
    //     iconWidget: Container(
    //       padding: const EdgeInsets.all(8),
    //       decoration: const BoxDecoration(
    //           color: Colors.grey,
    //           borderRadius: BorderRadius.all(Radius.circular(30))),
    //     )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Status Pengajuan',
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Pengajuan Rekomtek dalam Proses",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: AnotherStepper(
              stepperList: stepperData,
              stepperDirection: Axis.vertical,
              iconWidth: 40,
              iconHeight: 40,
              activeBarColor: Colors.green,
              inActiveBarColor: Colors.grey,
              inverted: false,
              verticalGap: 30,
              activeIndex: 1, //warna pada garis
              barThickness: 8,
            ),
          ),
        ],
      ),
    );
  }
}
