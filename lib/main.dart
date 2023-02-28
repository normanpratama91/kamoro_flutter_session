import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kamoro_flutter_session/dependency_injection/service_locator.dart';
import 'package:kamoro_flutter_session/ui/list_page.dart';
import 'package:kamoro_flutter_session/ui/test_page.dart';
import 'package:kamoro_flutter_session/view_model/data_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

Future<void> main() async {
  await setupServiceLocator();

  final shr = await SharedPreferences.getInstance();
  final token = shr.getString('token');

  bool isLogin = false;
  if (token != null) {
    isLogin = true;
  }

  runApp(MyApp(isLogin: isLogin));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.isLogin}) : super(key: key);

  final bool isLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var home =
        isLogin ? ListPage() : const MyHomePage(title: 'Flutter Demo Kamoro');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(), primarySwatch: Colors.blue),
      home: home,
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Example"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    userName = value;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Username'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide username';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.key), labelText: 'Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide password';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          var token =
                              await DataViewModel().login(userName, password);
                          print(token);

                          if (token != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        // TestPage(parameterData: '')
                                        const ListPage()));
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Cancel')),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
