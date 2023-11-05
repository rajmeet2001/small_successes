// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class agentList extends StatelessWidget {
  const agentList({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.all(5),
    )));
  }

  Widget _buildList() {
    return ListView.separated(
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'List Item $position',
            ),
          ),
        );
      },
      separatorBuilder: (context, position) {
        return Card(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              'Separator $position',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }
}
