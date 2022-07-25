import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sudoku_puzzle/views/sudoku_home_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // redirectHomePage();
    super.initState();
  }

  void redirectHomePage(){
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const SudokuHomePage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff46e7d2),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Tic Tac Toe",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 28),),
            Center(
              child: Image.asset(
                'assests/playstore.png',
                height: MediaQuery.of(context).size.width *2/ 3,
                width: MediaQuery.of(context).size.width *2/ 3,
                alignment: Alignment.center,
              ),
            ),
            const SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}