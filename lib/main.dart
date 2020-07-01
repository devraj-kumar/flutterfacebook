import 'package:Gocomet/UI/MyHomePage.dart';
import 'package:Gocomet/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Gocomet/utils/constants.dart';


Future main() async {
 WidgetsFlutterBinding.ensureInitialized();
 Constants.prefs = await SharedPreferences.getInstance();
 runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Complete WebView in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Constants.prefs.getBool("loggedIn")==true? MyHomePage() : LoginPage(),
    );
  }
}