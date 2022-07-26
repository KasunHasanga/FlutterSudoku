import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  // List<Item> _books = generateItems(3);
  List<Item> _rules = <Item>[
    Item(
        headerValue:
            "Rule 1 - Each row must contain the numbers from 1 to 9, without repetitions",
        expandedValue:
            "The player must focus on filling each row of the grid while ensuring there are no duplicated numbers. The placement order of the digits is irrelevant.\n Every puzzle, regardless of the difficulty level, begins with allocated numbers on the grid. The player should use these numbers as clues to find which digits are missing in each row."),
    Item(
        headerValue:
            "Rule 2 - Each column must contain the numbers from 1 to 9, without repetitions",
        expandedValue:
            "The Sudoku rules for the columns on the grid are exactly the same as for the rows. The player must also fill these with the numbers from 1 to 9, making sure each digit occurs only once per column.\nThe numbers allocated at the beginning of the puzzle work as clues to find which digits are missing in each column and their position."),
    Item(
        headerValue:
            "Rule 3 - The digits can only occur once per block (nonet)",
        expandedValue:
            "A regular 9 x 9 grid is divided into 9 smaller blocks of 3 x 3, also known as nonets. The numbers from 1 to 9 can only occur once per nonet.\nIn practice, this means that the process of filling the rows and columns without duplicated digits finds inside each block another restriction to the numbers’ positioning."),
    Item(
        headerValue:
            "Rule 4 - The sum of every single row, column and nonet must equal 45",
        expandedValue:
            "To find out which numbers are missing from each row, column or block or if there are any duplicates, the player can simply count or flex their math skills and sum the numbers. When the digits occur only once, the total of each row, column and group must be of 45."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          alignment: Alignment.center,
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerText("What is Sudoku"),
              _subHeaderText(
                  "Sudoku is a logic-based, combinatorial number-placement puzzle. In classic Sudoku, the objective is to fill a 9 × 9 grid with digits so that each column, each row, and each of the nine 3 × 3 subgrids that compose the grid contain all of the digits from 1 to 9."),
              const SizedBox(
                height: 20,
              ),
              // _headerText("Rules Sudoku"),
              _buildPanel()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _rules[index].isExpanded = !isExpanded;
        });
      },
      children: _rules.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                item.headerValue,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            );
          },
          body: ListTile(
            contentPadding:
                const EdgeInsets.only(bottom: 15, left: 10, right: 10),
            title: Text(item.expandedValue),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  Widget _headerText(String text) {
    return Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ));
  }

  Widget _subHeaderText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
