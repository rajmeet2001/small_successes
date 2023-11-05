// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class smbform extends StatelessWidget {
  const smbform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Icon(Icons.person_outlined, color: Colors.grey[300], size: 45),
                SizedBox(height: 13),
                Text(
                  "Tell us about you",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Enter to Continue",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.mail, size: 30),
                        labelText: "Name",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, size: 30),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
