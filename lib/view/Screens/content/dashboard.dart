import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/custom_slider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const NetworkImage(
        'http://180.250.162.129:8686/sim/assets/images/rekomtek/slide1.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'e-SPAM',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Des 2023',
      rightSubtitle: 'v1.0.0',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'http://180.250.162.129:8686/sim/assets/images/rekomtek/slide2.png',
      ),
      title: 'e-SPAM',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Des 2023',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
    CarouselItem(
      // image: const ExactAssetImage('assets/justec.jpg'),
      image: const NetworkImage(
        'http://180.250.162.129:8686/sim/assets/images/rekomtek/rekomtek_spam.jpg',
      ),
      title: 'Tahapan Rekomtek SPAM',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Des 2023',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
    CarouselItem(
      // image: const ExactAssetImage('assets/justec.jpg'),
      image: const NetworkImage(
        'http://180.250.162.129:8686/sim/assets/images/rekomtek/rekomtek_alih_kelola.jpg',
      ),
      title: 'Tahapan Rekomtek Alih Kelola',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Des 2023',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
    CarouselItem(
      // image: const ExactAssetImage('assets/justec.jpg'),
      image: const NetworkImage(
        'http://180.250.162.129:8686/sim/assets/images/rekomtek/rekomtek_sipa.jpg',
      ),
      title: 'Rekomtek SIPA',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Des 2023',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var sf = (5 / 100);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 2, 68, 122),
          leading: Image.asset("assets/images/logo.png"),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "e-SPAM",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Perumda Tirta Kanjuruhan",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            Image.asset("assets/images/tde.png"),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Container(
              decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 2, 68, 122),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 2, 68, 122),
                    Color.fromARGB(255, 72, 144, 251),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // borderRadius: BorderRadius.only(
                //   bottomRight: Radius.circular(50),
                // ),
              ),
              child: Column(
                children: [
                  // const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      // contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                      leading: const CircleAvatar(
                        radius: 35,

                        backgroundColor: Colors.white,
                        child: Icon(Icons.accessibility),
                        // backgroundImage: AssetImage('assets/images/user.JPG'),
                      ),
                      title: Text('Hello Ahad!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white)),
                      subtitle: Text('Good Morning',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white54)),
                      // trailing: const CircleAvatar(
                      //   radius: 30,

                      //   backgroundColor: Colors.white,
                      //   child: Icon(Icons.person),
                      //   // backgroundImage: AssetImage('assets/images/user.JPG'),
                      // ),
                    ),
                  ),
                  // const SizedBox(height: 30)
                ],
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * .4,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    itemDashboard('Pengajuan Rekomtek', CupertinoIcons.doc_text,
                        Colors.blue, 'ajuan_rktk'),
                    itemDashboard('Pengajuan SPAM', CupertinoIcons.add_circled,
                        Colors.teal, ''),
                    itemDashboard('Alih Kelola', CupertinoIcons.add_circled,
                        Colors.orange, ''),
                    itemDashboard('Surat Keterangan SIPA',
                        CupertinoIcons.add_circled, Colors.red, ''),
                    itemDashboard('Daftar Perumahan', CupertinoIcons.book,
                        Colors.blueAccent, ''),
                    itemDashboard(
                        'Cek Status', CupertinoIcons.repeat, Colors.green, ''),
                    // itemDashboard('Tahapan Proses', CupertinoIcons.repeat,
                    //     Colors.purple, ''),
                    // itemDashboard('Revenue', CupertinoIcons.money_dollar_circle,
                    //     Colors.indigo),
                    // itemDashboard(
                    //     'Upload', CupertinoIcons.add_circled, Colors.teal),
                    // itemDashboard(
                    //     'About', CupertinoIcons.question_circle, Colors.blue),
                    // itemDashboard(
                    //     'Kontak', CupertinoIcons.phone, Colors.pinkAccent, ''),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                // padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  // color: Color.fromARGB(255, 127, 187, 42),
                  color: Colors.white,
                  // gradient: LinearGradient(
                  //     begin: Alignment.centerRight,
                  //     end: Alignment.centerLeft,
                  //     colors: [
                  //       Color.fromARGB(255, 19, 16, 228),
                  //       Color.fromARGB(255, 72, 144, 251),
                  //     ]),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(color: Colors.black, blurRadius: 2.0),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCarouselSlider(
                      items: itemList,
                      height: 150,
                      subHeight: 50,
                      width: MediaQuery.of(context).size.width * .85,
                      autoplay: true,
                    ),
                    // Image.asset(
                    //   "assets/images/welcome.png",
                    //   alignment: Alignment.center,
                    //   width: MediaQuery.of(context).size.width * .91,
                    //   height: MediaQuery.of(context).size.height * 0.21,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemDashboard(
          String title, IconData iconData, Color background, String halaman) =>
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(halaman);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(iconData, color: Colors.white)),
              const SizedBox(height: 8),
              Text(title.toUpperCase(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(fontSize: 11.0)),
            ],
          ),
        ),
      );
}
