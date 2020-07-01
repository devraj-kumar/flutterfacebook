import 'package:Gocomet/UI/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:Gocomet/utils/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login")
      ),
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
                        hintText: "Enter Email",
                        labelText: "Company Email"
                       ),
                    ),
                    SizedBox(
                     height: 20, 
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password"
                       ),
                    ),
                    SizedBox(
                     height: 20, 
                    ),
                    RaisedButton(onPressed: () {
                      Constants.prefs.setBool("loggedIn", true);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
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
}