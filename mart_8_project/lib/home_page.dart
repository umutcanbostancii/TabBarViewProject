import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    //Uygulama acilirken ne olsun istiyorsak buraya yazariz
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        bottom: TabBar(controller: _tabController, tabs: const [
          Icon(Icons.home),
          Icon(Icons.abc),
          Icon(Icons.person),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Text(
              "Ana Sayfam",
              style: _style,
            ),
          ),
          Center(
            child: Text(
              "Egitim Sayfam",
              style: _style,
            ),
          ),
          Center(
            child: Text(
              "Profil Sayfam",
              style: _style,
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle _style = TextStyle(
      color: Colors.blueGrey[700], fontWeight: FontWeight.w600, fontSize: 20);
}