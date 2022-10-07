import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kamoro_flutter_session/restApi.dart';

class ProfileTestPage extends StatefulWidget {
  final String parameterData;

  const ProfileTestPage({Key? key, required this.parameterData})
      : super(key: key);

  @override
  State<ProfileTestPage> createState() => _ProfileTestPageState();
}

class _ProfileTestPageState extends State<ProfileTestPage> {
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
    final restApi = RestApi();
    const url = "https://api.publicapis.org/entries";

    return FutureBuilder(
      future: restApi.get(url),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final dataApi = snapshot.data as dynamic;

          final dataCount = dataApi != null ? dataApi["count"] : 0;

          return ListView.builder(
            itemCount: dataCount,
            itemBuilder: (context, index) {
              final dataDisplay = dataApi["entries"][index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataDisplay["API"],
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.amber,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(dataDisplay["Description"])
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return SizedBox(
            child: Text("No data"),
          );
        }
      },
    );
  }
}
