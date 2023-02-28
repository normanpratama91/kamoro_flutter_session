import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/main.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/helpers/rest_api.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';
import 'package:kamoro_flutter_session/ui/lookup_page.dart';
import 'package:kamoro_flutter_session/view_model/data_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // final _dataService = GetIt.instance.get<DataService>();
  // final _listData = [
  //   {"name": "Lookup", "description": "Lookup Page"}
  // ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () async{
                  

                    
    final shr = await SharedPreferences.getInstance();
 shr.remove('token');

   Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                           MyHomePage(title: '',)));
                  },
                  icon: Icon(Icons.logout))
            ],
            title: Text("API List"),
          ),
          body: _listPages,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }

// viewmodel implementation
  get _listPages {
    return ListView(
      children: [
        ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          // TestPage(parameterData: '')
                          const LookupPage()));
            },
            title: const Text(
              "Lookup",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
   
  }
}
