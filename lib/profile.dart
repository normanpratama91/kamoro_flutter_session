import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/restApi.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';

class ProfileTestPage extends StatefulWidget {
  final String parameterData;

  const ProfileTestPage({Key? key, required this.parameterData})
      : super(key: key);

  @override
  State<ProfileTestPage> createState() => _ProfileTestPageState();
}

class _ProfileTestPageState extends State<ProfileTestPage> {
  final _dataService = GetIt.instance.get<DataService>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stringParameter = widget.parameterData;

    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Profile Test Page"),
          ),
          body: _listFromApi,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }

  Future postData() async {
    final restApi = RestApi();
    const url = ""; //isi post URL

    final jsonRequestBody = {"userName": "john_doe@kamoro.com"};
    final result = await restApi.post(url, jsonRequestBody);

    print(result);
  }

  get _listFromApi {
    return FutureBuilder(
      future: _dataService.getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final listApiData = snapshot.data as ListApiData;

          final dataCount = listApiData.count;

          return ListView.builder(
            itemCount: dataCount,
            itemBuilder: (context, index) {
              final dataDisplay = listApiData.entries[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataDisplay.API ?? "",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(dataDisplay.Description ?? "")
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox(child: CircularProgressIndicator());
        }
      },
    );
  }
}
