import 'package:Gocomet/UI/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:Gocomet/utils/constants.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: global.username);

  final _passwordController = TextEditingController(text: global.password);
  getValue() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     setState(() {
        global.username =   prefs.getString('username');
        global.password =   prefs.getString('password');
     });
     

  }
  @override
  void initState() {

    getValue();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter Email", labelText: "Company Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        login();
                      },
                      child: Text("Log in"),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ), // coloumn
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();

      SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('username', _usernameController.text);
        await prefs.setString('password', _passwordController.text);

      


      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }
}
