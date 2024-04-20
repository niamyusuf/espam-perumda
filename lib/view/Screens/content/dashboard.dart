import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/custom_slider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    debugPrint("Versi :");
  }

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
    // Size screenSize = MediaQuery.of(context).size;
    // var sf = (5 / 100);
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
          padding: EdgeInsets.zero,
          children: [
            // Container(
            //   decoration: const BoxDecoration(
            //     // color: Color.fromARGB(255, 2, 68, 122),
            //     gradient: LinearGradient(
            //       begin: Alignment.centerLeft,
            //       end: Alignment.centerRight,
            //       colors: [
            //         Color.fromARGB(255, 19, 16, 228),
            //         Color.fromARGB(255, 72, 144, 251),
            //       ],
            //     ),
            //     borderRadius: BorderRadius.only(
            //       bottomRight: Radius.circular(50),
            //     ),
            //   ),
            //   child: Column(
            //     children: [
            //       const SizedBox(height: 10),
            //       ListTile(
            //         contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            //         leading: const CircleAvatar(
            //           radius: 30,

            //           backgroundColor: Colors.white,
            //           child: Icon(Icons.accessibility),
            //           // backgroundImage: AssetImage('assets/images/user.JPG'),
            //         ),
            //         title: Text('Hello Ahad!',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .headlineSmall
            //                 ?.copyWith(color: Colors.white)),
            //         subtitle: Text('Good Morning',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .titleMedium
            //                 ?.copyWith(color: Colors.white54)),
            //         trailing: const CircleAvatar(
            //           radius: 30,

            //           backgroundColor: Colors.white,
            //           child: Icon(Icons.person),
            //           // backgroundImage: AssetImage('assets/images/user.JPG'),
            //         ),
            //       ),
            //       const SizedBox(height: 30)
            //     ],
            //   ),
            // ),
            Image.network(
                "http://180.250.162.129:8686/sim/assets/images/rekomtek/slide1.png"),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * .4,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 5),
                          color: Theme.of(context).primaryColor.withOpacity(.2),
                          spreadRadius: 2,
                          blurRadius: 2)
                    ],
                  ),
                  child:
                      // Column(
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         itemDashboard(
                      //             'Info \n Rekomtek',
                      //             CupertinoIcons.doc_text,
                      //             Colors.orange,
                      //             'listrekomtek'),
                      //         itemDashboard('Info \n SPAM',
                      //             CupertinoIcons.add_circled, Colors.teal, ''),
                      //         itemDashboard('Info \n Alih Kelola',
                      //             CupertinoIcons.book, Colors.blue, ''),
                      //       ],
                      //     ),
                      //     const SizedBox(
                      //       height: 10,
                      //     ),
                      //     Row(
                      //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         itemDashboard('Persaratan \n Rekomtek',
                      //             CupertinoIcons.repeat, Colors.purple, ''),
                      //         itemDashboard('Persyaratan \n Alih Kelola',
                      //             CupertinoIcons.repeat, Colors.green, ''),
                      //       ],
                      //     ),
                      //   ],
                      // ),

                      GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: MediaQuery.of(context).size.width >= 400 ? 3 : 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      itemDashboard('Info \n Rekomtek ', CupertinoIcons.doc_text,
                          Colors.orange, 'listrekomtek'),
                      itemDashboard('Info \n SPAM', CupertinoIcons.add_circled,
                          Colors.blue, ''),
                      itemDashboard('Info \n Alih Kelola', CupertinoIcons.book,
                          Colors.green, ''),
                      itemDashboard('Persaratan \n Rekomtek',
                          CupertinoIcons.repeat, Colors.purple, ''),
                      itemDashboard('Persyaratan \n Alih Kelola',
                          CupertinoIcons.repeat, Colors.green, ''),
                    ],
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Layanan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black12,
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "http://180.250.162.129:8686/sim/assets/images/rekomtek/rekomtek_spam.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black12,
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "http://180.250.162.129:8686/sim/assets/images/rekomtek/rekomtek_sipa.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black12,
                              image: const DecorationImage(
                                image: NetworkImage(
                                  "http://180.250.162.129:8686/sim/assets/images/rekomtek/rekomtek_alih_kelola.jpg",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CustomCarouselSlider(
            //         items: itemList,
            //         height: 150,
            //         subHeight: 50,
            //         width: MediaQuery.of(context).size.width * .9,
            //         autoplay: true,
            //       ),
            //       // Image.asset(
            //       //   "assets/images/welcome.png",
            //       //   alignment: Alignment.center,
            //       //   width: MediaQuery.of(context).size.width * .91,
            //       //   height: MediaQuery.of(context).size.height * 0.21,
            //       // ),
            //     ],
            //   ),
            // ),
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
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            // boxShadow: [
            //   BoxShadow(
            //       offset: const Offset(0, 5),
            //       color: Theme.of(context).primaryColor.withOpacity(.2),
            //       spreadRadius: 2,
            //       blurRadius: 2)
            // ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width >= 400 ? MediaQuery.of(context).size.width / 15 : MediaQuery.of(context).size.width / 8,
                  )),
              const SizedBox(height: 10),
              Text(title.toUpperCase(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width >= 400 ? MediaQuery.of(context).size.width / 35 : MediaQuery.of(context).size.width / 28)),
            ],
          ),
        ),
      );
}
