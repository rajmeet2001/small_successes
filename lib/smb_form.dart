import 'package:flutter/material.dart';

class smbform extends StatelessWidget {
  const smbform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 40),
            Icon(Icons.person_outlined),
            SizedBox(height: 13),
            Text(
              "We'd like to learn about you",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
