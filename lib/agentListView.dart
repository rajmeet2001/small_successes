// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "SMB Profiles",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
              title: Text("Elmer's",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text("HVAC Company"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/elmer_hvac.png")),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text("Globe India",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text("Grocery Store"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/globe_india.png")),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text("Native",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text("Landscaping Company"),
              leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/landscaping_business.jpeg")),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text("Spice Bazaar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text("Spice Store"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/spice_bazaar.png")),
              trailing: Icon(Icons.arrow_forward_ios)),
          ListTile(
              title: Text("Mandie's",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              subtitle: Text("Event Planning Agency"),
              leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/mandie_eventplan.jpeg")),
              trailing: Icon(Icons.arrow_forward_ios)),
        ],
      )),
    );
  }
}
