import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:Devraj/utils/constants.dart' as global;

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = ""; // Enter your dessire url

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<WebViewStateChanged> _onchanged; // here we checked the url state if it loaded or start Load or abort Load

  @override
  void initState() {
    
    super.initState();
    _onchanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        if(state.type== WebViewState.finishLoad){ // if the full website page loaded
          flutterWebviewPlugin.evalJavascript('document.getElementById("normal_login_email").value="${global.username}"'); // Replace with the id of username field
          flutterWebviewPlugin.evalJavascript('document.getElementById("normal_login_password").value="${global.password}"'); // Replace with the id of password field
           flutterWebviewPlugin.evalJavascript('document.getElementById("login-submit").click()');  // Replace with Submit button id

         
        }else if (state.type== WebViewState.abortLoad){ // if there is a problem with loading the url
          print("there is a problem...");
        } else if(state.type== WebViewState.startLoad){ // if the url started loading
          print("start loading...");
        }
      }
    });



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebviewPlugin.dispose(); // disposing the webview widget to avoid any leaks
  }



  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withLocalStorage: true,
      clearCache: false,
      appCacheEnabled: true,
      clearCookies: false,
      withJavascript: true, // run javascript
      withZoom: false, // if you want the user zoom-in and zoom-out
      hidden: false , // put it true if you want to show CircularProgressIndicator while waiting for the page to load

        appBar: AppBar(
        title: Text("Devraj Kumar"),
        centerTitle: true,
        elevation: 1, // give the appbar shadows
        iconTheme: IconThemeData(color: Colors.white),

      ),



    );
  }
}