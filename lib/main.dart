import 'package:flutter/material.dart';
import 'package:movies_app/Screens/SplashScreen.dart';
import 'package:movies_app/Screens/TopRatedMovies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/movieList' : (context) => MovieList(),
      },
    );
  }
}
