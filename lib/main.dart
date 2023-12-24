import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool showWelcomeScreen = prefs.getBool('showWelcomeScreen') ?? true;

  runApp(MaterialApp(
    initialRoute: showWelcomeScreen ? '/welcome' : '/loading',
    routes: {
      '/welcome': (context) {
        prefs.setBool('showWelcomeScreen', false);
        return WelcomeScreen();
      },
      '/loading': (context) => Loading(),
      '/home': (context) => Home(),
      '/location' : (context) => ChooseLocation()
    },
  ));
}
