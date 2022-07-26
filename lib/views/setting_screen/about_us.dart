import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'About Sudoku',
          style: TextStyle(color: Colors.black),
        ),
      ),
      // appBar: AppBar(
      //   title: const Text('Setting'),
      // ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerText("What is Sudoku"),
            _subHeaderText("Sudoku is a logic-based, combinatorial number-placement puzzle. In classic Sudoku, the objective is to fill a 9 × 9 grid with digits so that each column, each row, and each of the nine 3 × 3 subgrids that compose the grid contain all of the digits from 1 to 9.")
,const SizedBox(height: 20,),
            // _headerText("Rules Sudoku"),
          ],
        ),
      ),
    );
  }

  Widget _headerText(String text){
    return Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(text,style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),));
  }
  Widget _subHeaderText(String text){
    return Text(text,style: const TextStyle(color: Colors.black,fontSize: 16),);
  }
}
