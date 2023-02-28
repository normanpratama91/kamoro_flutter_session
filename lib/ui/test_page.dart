import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:kamoro_flutter_session/models/list_api_data.dart';
import 'package:kamoro_flutter_session/helpers/rest_api.dart';
import 'package:kamoro_flutter_session/services/interfaces/data_service.dart';
import 'package:kamoro_flutter_session/view_model/data_view_model.dart';
import 'package:stacked/stacked.dart';

class TestPage extends StatefulWidget {
  final String parameterData;

  const TestPage({Key? key, required this.parameterData}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
            actions: [
              IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Open profile page");
                  },
                  icon: Icon(Icons.person))
            ],
            title: Text("Get API list Page"),
          ),
          body: _listFromApiViewModel,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }


// viewmodel implementation
  get _listFromApiViewModel {
    return ViewModelBuilder<DataViewModel>.reactive(
      viewModelBuilder: () => DataViewModel(),
      onModelReady: (vm) => vm.getData(),
      builder: (context, vm, child) {
        if (vm.isBusy) {
          //still getting data
          return const Center(child: CircularProgressIndicator());
        } else {
          if (vm.listData == null) {
            return const SizedBox(
              child: Text("No data"),
            );
          }

          //if data exist
          else {
            final listData = vm.listData!;
            return Container(
              child: RefreshIndicator(
                  onRefresh: () => vm.getData(),
                  child: ListView.builder(
                    itemCount: listData.count,
                    itemBuilder: (context, index) {
                      final dataDisplay = listData.entries[index];

                      return GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: dataDisplay.Description ?? "");

                          /// any event
                        },
                        child: Card(
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
                        ),
                      );
                    },
                  )),
            );
          }
        }
      },
    );
  }

}
