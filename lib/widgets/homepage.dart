import 'package:flutter/material.dart';

import 'package:recrutement/widgets/Start.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyMobileBody(),
    );
  }
}
