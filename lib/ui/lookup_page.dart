import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kamoro_flutter_session/view_model/data_view_model.dart';

class LookupPage extends StatefulWidget {
  const LookupPage({super.key});

  @override
  State<LookupPage> createState() => _LookupPageState();
}

class _LookupPageState extends State<LookupPage> {
  dynamic _lookupPostBody;
  dynamic _lookupPostValue;
  dynamic _lookupGetValue;
  dynamic _lookupGetRequest;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              actions: [

                
              ],
              title: const Text("Get API Lookup"),
            ),
            body: ListView(
              children: [
                ListTile(
                  title: const Text("Get"),
                  subtitle: TextField(
                      onChanged: (value) {
                        _lookupGetRequest = value;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.search),
                          labelText: 'Get Lookup by ID')),
                  trailing: IconButton(
                      onPressed: () async {
                        final lookupId = int.parse(_lookupGetRequest);
                        final data = await DataViewModel().getLookup(lookupId);

                        setState(() {
                          _lookupGetValue = data;
                        });

                        /// Show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(jsonEncode(_lookupGetValue)),
                          action: SnackBarAction(
                            label: 'Dismiss',
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                        ));
                      },
                      icon: Icon(Icons.send)),
                ),
                ListTile(
                  onTap: () {},
                  title: Text("Post"),
                  subtitle: TextField(
                      onChanged: (value) {
                        _lookupPostBody = value;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.post_add),
                          labelText: 'Post Lookup')),
                  trailing: IconButton(
                      onPressed: () async {
                        if (_lookupPostBody == null || _lookupPostBody == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Value must not be empty"),
                            action: SnackBarAction(
                              label: 'Dismiss',
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                          ));
                        } else {
                          Object obj = jsonDecode(_lookupPostBody);
                          final data = await DataViewModel().postLookup(obj);

                          setState(() {
                            _lookupPostValue = data;
                          });

                          /// Show snackbar
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(_lookupPostValue),
                            action: SnackBarAction(
                              label: 'Dismiss',
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                          ));
                        }
                      },
                      icon: Icon(Icons.send)),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )));
  }
}
