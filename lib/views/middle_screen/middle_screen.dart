import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sudoku_puzzle/views/sudoku_home_page.dart';

class MiddleScreen extends StatefulWidget {
  const MiddleScreen({Key? key}) : super(key: key);

  @override
  State<MiddleScreen> createState() => _MiddleScreenState();
}

class _MiddleScreenState extends State<MiddleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff46e7d2),
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
              const Text("Sudoku",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 28),),
           ListView.builder(itemBuilder: (context, index) {
             return levelWidget(index);
           },
             physics: ScrollPhysics(),
             shrinkWrap: true,
             scrollDirection: Axis.vertical,
           itemCount:20,)


            ],
          ),
        ),
      ),
    );
  }
  Widget levelWidget(int index){
   return ListTile(
     leading: Icon(Icons.lock),
      title: Text("Level ${index+1}"),
      trailing: Text("${index+1}"),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SudokuHomePage(difficultyStatus: (index+1)*2,)),
        );
      },
    );
  }
}
