import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        color: Colors.blueAccent,
        child: Column(
          children: [
            Container(
              color: Colors.blueAccent.shade700,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(5),
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
                  itemBuilder: (buildContext, index) {
                    return Container(
                      color: Colors.red.shade100,
                      alignment: Alignment.center,
                      child: GridView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          itemCount: 9,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2),
                          itemBuilder: (buildContext, index) {
                            return Container(
                              color: Colors.yellow.shade100,
                              alignment: Alignment.center,
                              child: Text(
                                "${index + 1}",
                              ),
                            );
                          }),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(

                    child: GridView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 9,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemBuilder: (buildContext, index) {
                          return ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "${index + 1}",
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Clear"),
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
