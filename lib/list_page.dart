import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/helpers/rest_api.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';
import 'package:kamoro_flutter_session/view_model/data_view_model.dart';
import 'package:stacked/stacked.dart';

class ListPage extends StatefulWidget {
 

  const ListPage({Key? key, }) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _dataService = GetIt.instance.get<DataService>();
  final _listData = [{"name":"Lookup","description":"Lookup Page"}];
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
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Select pages");
                  },
                  icon: Icon(Icons.person))
            ],
            title: Text("Get API list Pages"),
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
    return ListView.builder(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        final dataDisplay = _listData[index];

        return GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: dataDisplay["description"] ?? "");

            /// any event
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataDisplay['name'] ?? "",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(dataDisplay["description"] ?? "")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
