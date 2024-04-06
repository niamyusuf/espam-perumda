import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../Widget/placeholder_dialog.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final dio = Dio();

  Future _Info() async {
    final info = await PackageInfo.fromPlatform();
    _packageInfo = info;
    setState(() {
      String AppName = _packageInfo.appName;
      String packageName = _packageInfo.packageName;
      String version = _packageInfo.version;
      String buildNumber = _packageInfo.buildNumber;
      String buildSignature = _packageInfo.buildSignature;
    });
    debugPrint("Info : " + _packageInfo.appName.toString());
  }

  PackageInfo _packageInfo =
      PackageInfo(appName: '', packageName: '', version: '', buildNumber: '');

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  void request() async {
    Response response;
    response = await dio
        .get('https://niamyusuf.github.io/appsVersion/tesVersion.json');
    Map result = response.data;
    debugPrint(response.data.toString());
    debugPrint('hasi; ' + result['new_app_version']);
    
    // // The below request is the same as above.
    // response = await dio.get(
    //   '/test',
    //   queryParameters: {'id': 12, 'name': 'dio'},
    // );
    // debugPrint(response.data.toString());
  }

  @override
  void initState() {
    super.initState();
    _Info();
    request();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ListView(
            children: [
              _infoTile("App NAme", _packageInfo.appName),
              _infoTile("Package Name", _packageInfo.packageName),
              _infoTile("App Version", _packageInfo.version),
              _infoTile("Build Number", _packageInfo.buildNumber),
              _infoTile("Build Signature", _packageInfo.buildSignature),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => PlaceholderDialog(
                  icon: const Icon(
                    Icons.add_circle,
                    color: Colors.teal,
                    size: 80.0,
                  ),
                  title: 'Save Failed',
                  message: 'An error occurred when attempt to save the message',
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('!Got It'),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Tes"))
      ],
    );
  }
}
