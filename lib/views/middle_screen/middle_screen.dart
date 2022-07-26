import 'package:flutter/material.dart';
import 'package:sudoku_puzzle/services/shared_preferences.dart'
    as shared_preferences;
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
    print(playerLevel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff46e7d2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff46e7d2),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Sudoku",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return levelWidget(index);
                },
                physics: ScrollPhysics(),
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
          ? Icon(
              Icons.lock,
              color: Colors.red,
            )
          : Icon(
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
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("You haven`t unlock this level yet"),
          ));
        }
        print(result);
        if (result == true) {
          initilization();
          print("trune");
        }
      },
    );
  }
}
