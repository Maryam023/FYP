
import 'package:flutter/material.dart';
import 'dart:convert';
//import 'package:firebase_core/firebase_core.dart';
import 'package:remedium/patient_sign_in.dart';
import 'package:http/http.dart' as http;
//import 'consultation.dart';
import 'doctor_sign_in.dart';
import 'selfdiagnosis.dart';

class signin extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remedium',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Welcome to Remedium',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String greetings = '';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      appBar: new PreferredSize(
        child: new Container(
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
          ),
          child: new Padding(
            padding: const EdgeInsets.only(
                left: 30.0,
                top: 20.0,
                bottom: 20.0
            ),
            child: Center(
              child: new Text(
                'Welcome to Remedium',
                style: new TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7c4dff)
                ),
              ),
            ),
          ),
          decoration: new BoxDecoration(

                  //color: Color(0xFF202125),
            color: Colors.white,

              boxShadow: [
                new BoxShadow(
                  color: Color(0xFF7c4dff),
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                ),
              ]
          ),
        ),
        preferredSize: new Size(
            MediaQuery.of(context).size.width,
            80.0
        ),
      ),

      body:

      Container(decoration: const BoxDecoration(
        //color: Color(0xFF202125),
        color: Colors.white,

      ),
        child: Center(
          child: Column(

          children: [
            Text(greetings, style: TextStyle(fontSize: 23.0)),
            SizedBox(height: 120,),
            Expanded(
                flex: 1,

                child: Center(
                  child: Container(
                        height: 25,
                      child:Text("SIGN IN AS",style: TextStyle(fontSize: 25,color: Color(0xFF7c4dff)),)),
                )),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    RaisedButton(

                        shape:  new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => doctor_sign_in()),
                        );},
                        color: Color(0xFF7c4dff),


                        padding: EdgeInsets.fromLTRB(80, 20, 80, 20),

                        child: Text("Doctor",
                        style:TextStyle(color: Colors.white))),

                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        color: Color(0xFF7c4dff),
                        padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                        shape:  new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed:(){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => patient_sign_in()),
                        );},
                        child: Text("Patient",style:TextStyle(color: Colors.white))),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        color: Color(0xFF7c4dff),
                        padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                        shape:  new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed:() async{
                        final res = await http.get("http://192.168.10.2/127.0.0.1:5000/");
                        final decoded = json.decode(res.body) as Map <String, dynamic>;

                          setState(() {
                            greetings = decoded['greetings'];
                          });

                        },

                        child: Text("Chatbot",style:TextStyle(color: Colors.white))),

                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        color: Color(0xFF7c4dff),
                        padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                        shape:  new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed:(){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => selfdiagnosis()),
                        );},
                        child: Text("Diagnosis",style:TextStyle(color: Colors.white))),


                  ],
                ),
              ),
            ),

          ],
          ),
        ),
      ),


    );
  }
}

