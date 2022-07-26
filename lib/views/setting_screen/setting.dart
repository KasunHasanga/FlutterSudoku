import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:sudoku_puzzle/views/setting_screen/about_us.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isFlashlightOnStartup = false;
  final String _url =
      "https://play.google.com/store/apps/details?id=com.kasun_hasanga.sudoku_puzzle";
  final String _mail =
      "mailto:Kasunhasanga96@gmail.com?subject=About Sudoku Puzzle Application&body=That Application was amazing";
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Share Sudoku Game',
        text: 'Best Free Sudoku Game',
        linkUrl:
            'https://play.google.com/store/apps/details?id=com.kasun_hasanga.sudoku_puzzle'
        );
  }

  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  void _sendMail() async {
    if (!await launch(_mail)) {
      throw 'Could not launch $_url';
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading:  IconButton(
          alignment: Alignment.center,
          icon: const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // appBar: AppBar(
      //   title: const Text('Setting'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ListTile(
                title: const Text('About Game'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutUs()),
                  );
                },
                leading: const Icon(Icons.info_outline),
                subtitle: const Text(
                    'What is Sudoku game and other details'),
              ),
              ListTile(
                title: const Text('Share'),
                onTap: () {
                  share();
                },
                leading: const Icon(Icons.share),
                subtitle: const Text(
                    'The best Sudoku Game, tap to share with your friends'),
              ),
              ListTile(
                title: const Text('Rate Us'),
                leading: const Icon(Icons.star_rate),
                onTap: () {
                  _launchURL();
                },
                subtitle: const Text(
                    'The best Sudoku Game, tap to Rate us on PlayStore'),
              ),
              ListTile(
                title: const Text('Feedback'),
                onTap: () {
                  _sendMail();
                },
                leading: const Icon(Icons.feedback_outlined),
                subtitle: const Text('We are love to here anything from you'),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 20),
            child: const Text("Version : 1.0.0v"),)
        ],
      ),
    );
  }
}
