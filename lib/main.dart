import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kamoro_flutter_session/dependency_injection/service_locator.dart';
import 'package:kamoro_flutter_session/profile.dart';

Future<void> main() async {
  await setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(), primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Kamoro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userName = '';
  String password = '';
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  userName = value.toString();
                },
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  password = value.toString();
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Column(
              children: [
                RadioListTile(
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // Fluttertoast.showToast(
                      //     msg: '$userName $password $gender');
                      final dataObj = {
                        "username": userName,
                        "password": password,
                        "gender": gender
                      };

                      final encodedString = jsonEncode(dataObj);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileTestPage(
                                  parameterData: encodedString)));
                    },
                    child: const Text('Login'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                )
              ],
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Fluttertoast.showToast(msg: 'hellow');
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.ac_unit_outlined),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
