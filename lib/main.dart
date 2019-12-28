import 'package:flutter/material.dart';

void main() => runApp(Demo());

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  //get username function
  String _username = "";
  String getUsername(String username) {
    setState(() {
      _username = username;
    });
    return _username;
  }

//get checked function

  bool _checked = false;
  void check(bool value) {
    setState(() {
      _checked = value;
      if (_checked) {
        // _checked = value;
      }
    });
  }

//get password function
  String _password = "";
  String getPassword(String password) {
    setState(() {
      _password = password;
    });
    return _password;
  }

//get username and password to display
  String _info = "";
  void displayInfo() {
    setState(() {
      if(_checked){
      _info = "Username@: " + _username + " and " + "Password@: " + _password;
      }else{
        _info = "You are not agree";
      }if(_username == ""&& _password== ""){
        _info= "No information";
      }     
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (String message){
                    getUsername(message);
                  },
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.person),
                    hintText: 'Username',
                  ),
                )),
            Container(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  onChanged: (String message){
                    getPassword(message);
                  },
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.lock),
                    hintText: 'Password',
                  ),
                )),
            Container(
           child: Row(
             children: <Widget>[
              // padding: const EdgeInsets.all(16.0),
              Container(
                child: Checkbox(
                  value: _checked,
                  onChanged: (bool value) {
                    check(value);
                  },
                ),
              ), 
              Container(
                child: Text("Are you agree?"),
              ),
             ],
           ),
                ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: MaterialButton(
                  onPressed:() => displayInfo(),
                  textColor: Colors.white,
                  color: Colors.blue,
                  height: 40,
                  child: Text("LOGIN"),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                _info,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
