import 'package:flutter/material.dart';
import 'package:small_successes/agentLogin.dart';
import 'package:small_successes/smb_form.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return agentLogin();
  }
}
