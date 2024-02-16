import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tr_store/providers/home/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
          builder: (context, value, child) => Text("Home")),
    );
  }
}
