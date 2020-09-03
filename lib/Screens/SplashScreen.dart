import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer(){
    Future.delayed(Duration(seconds: 5))
        .then((value) => Navigator.pushReplacementNamed(context, '/movieList'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Top Rated Movies \n\n From TMDB API',
          style: TextStyle(
            fontSize: 40
          ),
        ),
      ),
    );
  }
}
