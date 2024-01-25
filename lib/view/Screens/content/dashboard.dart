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
  final List<MenuService> _menuServiceList = [
    MenuService(
      image: CupertinoIcons.doc_text,
      title: "Pengajuan Rekomtek",
      color: Colors.blueAccent,
      halaman: "ajuan_rktk",
    ),
    MenuService(
      image: CupertinoIcons.home,
      title: "Pengajuan SPAM",
      color: Colors.teal,
      halaman: "",
    ),
    MenuService(
      image: CupertinoIcons.building_2_fill,
      title: "Alih Kelola",
      color: Colors.orange,
      halaman: "",
    ),
    MenuService(
      image: CupertinoIcons.doc_on_doc,
      title: "Surat Keterangan SIPA",
      color: Colors.red,
      halaman: "",
    ),
    MenuService(
      image: CupertinoIcons.book,
      title: "Daftar Perumahan",
      color: Colors.blueAccent,
      halaman: "",
    ),
    MenuService(
      image: CupertinoIcons.repeat,
      title: "Cek Status",
      color: Colors.green,
      halaman: "",
    ),
  ];

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
  void initState() {
    super.initState();
  }

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
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              child: SingleChildScrollView(
                //Your SingleChildScrollView Widget
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            ),
                          ),
                          // const SizedBox(height: 30)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _rowMenuService(_menuServiceList[0]),
                              _rowMenuService(_menuServiceList[1]),
                              _rowMenuService(_menuServiceList[2]),
                            ],
                          ),
                          const SizedBox(
                      height: 10,
                    ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               _rowMenuService(_menuServiceList[3]),
                              _rowMenuService(_menuServiceList[4]),
                              _rowMenuService(_menuServiceList[5]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomCarouselSlider(
                          items: itemList,
                          height: 150,
                          subHeight: 50,
                          width: MediaQuery.of(context).size.width * .95,
                          autoplay: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoServicesMenu() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.4,
      child: Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: GridView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, position) {
            return _rowMenuService(_menuServiceList[position]);
          },
        ),
      ),
    );
  }

  Widget _rowMenuService(MenuService menuService) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(menuService.halaman);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.circular(20.0))),
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              menuService.image,
              color: menuService.color,
              size: 32,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 6.0),
        ),
        Text(
          menuService.title,
          style: const TextStyle(fontSize: 10.0),
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}

class MenuService {
  IconData image;
  Color color;
  String title;
  String halaman;

  MenuService(
      {required this.image,
      required this.title,
      required this.color,
      required this.halaman});
}
