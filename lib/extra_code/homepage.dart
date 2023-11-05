import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:small_successes/extra_code/profilepage.dart';

class AgentList extends StatefulWidget {
  const AgentList({Key? key}) : super(key: key);

  @override
  State<AgentList> createState() => _AgentListState();
}

class _AgentListState extends State<AgentList> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "SMB Profiles",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
              title: Text("Elmer's"),
              subtitle: Text("HVAC Company"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/elmer_hvac.png")),
              trailing: Icon(Icons.ios_share)),
        ],
      )),
    );
  }
}
