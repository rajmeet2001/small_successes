// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SMBRecommended extends StatefulWidget {
  const SMBRecommended({Key? key}) : super(key: key);

  @override
  State<SMBRecommended> createState() => _SMBRecommendedState();
}

class _SMBRecommendedState extends State<SMBRecommended> {
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
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "We have recieved your application!",
              style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text:
                  "Based on your submission, we recommend the following products: ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30),
          ExpansionTile(
            title: Text(
              'Business Owners Policy (BOP)',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'The BOP is a package policy that combines multiple coverages into one policy, making it easier and more affordable for small businesses to protect themselves from a variety of risks. The BOP covers a wide range of business property, including buildings, equipment, inventory, and furniture, as well as a variety of business liabilities, such as general liability, professional liability, and workers compensation',
                  style: TextStyle(fontSize: 15),
                  maxLines: 4,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ExpansionTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            title: Text(
              'Commercial Auto Insurance',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Commercial auto insurance covers vehicles owned and operated by businesses. This includes liability coverage, which protects the business from lawsuits alleging bodily injury or property damage caused by the business vehicles, as well as physical damage coverage, which covers the business vehicles from damage caused by accidents, theft, and other events.',
                  style: TextStyle(fontSize: 15),
                  maxLines: 4,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ExpansionTile(
            title: Text(
              'Workers Compensation Insurance',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Workers compensation insurance provides benefits to employees who are injured or become ill on the job. This coverage is required for most businesses in the United States, and it can help to protect businesses from financial losses caused by employee injuries and illnesses.',
                  style: TextStyle(fontSize: 15),
                  maxLines: 4,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
