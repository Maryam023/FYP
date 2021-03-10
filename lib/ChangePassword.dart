import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangePassword(),
    );
  }
}
class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202125),
      appBar: AppBar(
        backgroundColor: Color(0xFF202125),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: CupertinoColors.white,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
          title: Text("Password Settings"),
        shadowColor: Colors.blue,
    ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 15, right: 16),
        child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, top: 150, right: 16),
            child: Center(child: Text(
              "Create new Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 2.2,
                //fontFamily: "Source Sans Pro",
              ),
            )),
          ),
          SizedBox(
          height: 50,
        ),
          TextField(
            style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 20),
    labelText: 'New Password',
    labelStyle: TextStyle(
    color: Colors.white,
    fontSize: 20
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    ),
          SizedBox(
          height: 40,
    ),

          TextField(
            style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
    contentPadding: EdgeInsets.only(bottom: 20),
    labelText: 'Re-enter new Password',
    labelStyle: TextStyle(
    color: Colors.white,
    fontSize: 20
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    ),
          SizedBox(
            height: 35,
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 65),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                onPressed: (){},
                child: Text('CONFIRM PASSWORD CHANGES',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 2.2,
                      color: Colors.white,
                    )
                ),
              ),
      ]
          ),

  ]),
    ),
    );
  }
}