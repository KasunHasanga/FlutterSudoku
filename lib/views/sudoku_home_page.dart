import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';
import 'package:sudoku_puzzle/views/block_char.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';
import 'package:sudoku_puzzle/views/box_inner.dart';
import 'package:sudoku_puzzle/views/focus_class.dart';

class SudokuHomePage extends StatefulWidget {
  const SudokuHomePage({Key? key}) : super(key: key);

  @override
  State<SudokuHomePage> createState() => _SudokuHomePageState();
}

class _SudokuHomePageState extends State<SudokuHomePage> {
  List<BoxInner> boxInners = [];
  FocusClass focusClass = FocusClass();
  bool isFinish = false;
  String? tapBoxIndex;

  @override
  void initState() {
    generateSudoku();
    super.initState();
  }

  void generateSudoku() {
    isFinish = false;
    focusClass = new FocusClass();
    tapBoxIndex = null;
    generatePuzzle();
    checkFinish();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                generatePuzzle();
              },
              child: Icon(Icons.refresh))
        ],
      ),
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
                  itemCount: boxInners.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (buildContext, index) {
                    BoxInner boxInner =boxInners[index];
                    return Container(
                      color: Colors.red.shade100,
                      alignment: Alignment.center,
                      child: GridView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: boxInner.blockChars.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 2),
                          itemBuilder: (buildContext, indexChar) {
                            BlockChar blockChar =boxInner.blockChars[indexChar];
                            return Container(
                              color: Colors.yellow.shade100,
                              alignment: Alignment.center,
                              child: Text(
                                "${blockChar.text}",
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


  generatePuzzle() {
    // install plugins sudoku generator to generate one
    boxInners.clear();
    var sudokuGenerator = SudokuGenerator(emptySquares: 3); //54
    // then we populate to get a possible cmbination
    // Quiver for easy populate collection using partition
    List<List<List<int>>> completes = partition(sudokuGenerator.newSudokuSolved,
        sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList();
    partition(sudokuGenerator.newSudoku,
        sqrt(sudokuGenerator.newSudoku.length).toInt())
        .toList()
        .asMap()
        .entries
        .forEach(
          (entry) {
        List<int> tempListCompletes =
        completes[entry.key].expand((element) => element).toList();
        List<int> tempList = entry.value.expand((element) => element).toList();

        tempList.asMap().entries.forEach((entryIn) {
          int index =
              entry.key * sqrt(sudokuGenerator.newSudoku.length).toInt() +
                  (entryIn.key % 9).toInt() ~/ 3;

          if (boxInners.where((element) => element.index == index).length ==
              0) {
            boxInners.add(BoxInner(index, []));
          }

          BoxInner boxInner =
              boxInners.where((element) => element.index == index).first;

          boxInner.blockChars.add(BlockChar(
            entryIn.value == 0 ? "" : entryIn.value.toString(),
            index: boxInner.blockChars.length,
            isDefault: entryIn.value != 0,
            isCorrect: entryIn.value != 0,
            correctText: tempListCompletes[entryIn.key].toString(),
          ));
        });
      },
    );

    // complte generate puzzle sudoku
  }
  void checkFinish() {

  }
}
