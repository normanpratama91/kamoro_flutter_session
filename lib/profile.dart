import 'package:flutter/material.dart';

class ProfileTestPage extends StatefulWidget {
  final String parameterData;

  const ProfileTestPage({Key? key, required this.parameterData})
      : super(key: key);

  @override
  State<ProfileTestPage> createState() => _ProfileTestPageState();
}

class _ProfileTestPageState extends State<ProfileTestPage> {
  final List bulan = [
    "Januari",
    "Fabruari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

  @override
  Widget build(BuildContext context) {
    final stringParameter = widget.parameterData;

    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Profile Test Page"),
          ),
          body: ListView.builder(
            itemCount: bulan.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(bulan[index]),
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
    );
  }
}
