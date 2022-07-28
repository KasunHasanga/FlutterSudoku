import 'package:flutter/material.dart';
import 'package:sudoku_puzzle/services/shared_preferences.dart'
    as shared_preferences;
import 'package:sudoku_puzzle/views/setting_screen/setting.dart';
import 'package:sudoku_puzzle/views/sudoku_home_page.dart';

class MiddleScreen extends StatefulWidget {
  const MiddleScreen({Key? key}) : super(key: key);

  @override
  State<MiddleScreen> createState() => _MiddleScreenState();
}

class _MiddleScreenState extends State<MiddleScreen> {
  int playerLevel = 1;
  @override
  void initState() {
    initilization();
    super.initState();
  }

  void initilization() async {
    playerLevel = await shared_preferences.getPlayerLevel();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff46e7d2),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(Icons.settings),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingPage()),
            );
          },
        ),
        title: const Text(
          "Sudoku",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // backgroundColor: const Color(0xff46e7d2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return levelWidget(index);
                },
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget levelWidget(int index) {
    return ListTile(
      leading: playerLevel < index + 1
          ? const Icon(
              Icons.lock,
              color: Colors.red,
            )
          : const Icon(
              Icons.lock_open_sharp,
              color: Colors.green,
            ),
      title: Text("Level ${index + 1}"),
      trailing: Text("${index + 1}"),
      onTap: () async {
        late bool result;
        if (playerLevel > index) {
          result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SudokuHomePage(
                      difficultyStatus: index,
                    )),
          );
          if (result == true) {
            initilization();
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("You haven`t unlock this level yet"),
          ));
        }

      },
    );
  }
}
