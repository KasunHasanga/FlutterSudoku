import 'package:flutter/material.dart';

class SudokuHomePage extends StatefulWidget {
  const SudokuHomePage({Key? key}) : super(key: key);

  @override
  State<SudokuHomePage> createState() => _SudokuHomePageState();
}

class _SudokuHomePageState extends State<SudokuHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              // color: Colors.red,
              padding: EdgeInsets.all(20),
              width: double.maxFinite,
              alignment: Alignment.center,
              child: GridView.builder(
                controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (buildContext,index){
                    return Container(
                      color: Colors.red,
                      alignment: Alignment.center,
                      child: Text("${index + 1}",),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.center,

              child: Text("action"),
            ))
          ],
        ),
      )),
    );
  }
}
