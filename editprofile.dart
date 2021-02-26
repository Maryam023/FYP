import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
String email;
String password;
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfile(),
    );
  }
}
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202125) ,
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF202125),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
            onPressed: () => {Navigator.of(context).pop()},
        ),
        shadowColor: Colors.blue,
        /*actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: (){} ,
          ),
        ],*/
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 15, right: 16),
        child: ListView(
          children: [
            /*Text(
              'Edit Profile',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
            ),*/
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                      new BoxShadow(
                      color: Colors.blue,
                      blurRadius: 20.0,
                      spreadRadius: 1.0,
                    )],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://images.unsplash.com/photo-1611867416224-2bed6e3e4cd1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=334&q=80'),
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                          color: Color(0xFF202125)
                        ),
                        child: Icon(
                          Icons.edit, color: Colors.white
                        ),
                      ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'First Name',
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

            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Last Name',
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
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Email',
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
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Age',
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
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: 'Phone',
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            /*TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            )*/
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  color: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  onPressed: (){},
                  child: Text('CANCEL',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.white,
                  )
                ),
                ),
                RaisedButton(
                  color: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  onPressed: (){},
                  child: Text(
                      'SAVE',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white,
                    ),
                  )
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}

/*Scaffold(

     appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF202125),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                shape: new CircleBorder(),
                //padding: EdgeInsets.fromLTRB(0.5, 0.5, 0.5, 0.5),
                //shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(50)),
              onPressed: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50.0,
                ),
              ),
            ),
          ],

        ),
      )
    );*/
