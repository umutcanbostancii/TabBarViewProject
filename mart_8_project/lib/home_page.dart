import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mart_8_project/tab_sub_widgets/profile_page.dart';

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
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        bottom: TabBar(
            onTap: (tabIndex) {
              setState(() {
                _tabController.index = tabIndex;
              });
            },
            indicatorColor: Colors.transparent,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.label,
            padding: const EdgeInsets.all(8),
            controller: _tabController,
            tabs: const [
              Icon(
                Icons.home_outlined,
                size: 27,
              ),
              Icon(
                Icons.abc_outlined,
                size: 27,
              ),
              Icon(
                Icons.person_outlined,
                size: 27,
                shadows: [
                  Shadow(color: Colors.black, offset: Offset.infinite),
                ],
              ),
            ]),
      ),

      body: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _tabController.index == 0
                ? Center(
                    child: Text(
                      "Ana sayfam",
                      style: _style,
                    ),
                  )
                : _tabController.index == 1
                    ? Center(
                        child: Text(
                          "Egitim Sayfam",
                          style: _style,
                        ),
                      )
                    : const MyProfilePage(),
          ],
        ),
      ),

      // body: TabBarView(
      //   controller: _tabController,children: [
      //     Center(
      //       child: Text(
      //         "Ana Sayfam",
      //         style: _style,
      //       ),
      //     ),
      //     Center(
      //       child: Text(
      //         "Egitim Sayfam",
      //         style: _style,
      //       ),
      //     ),
      //     Center(
      //       child: Text(
      //         "Profil Sayfam",
      //         style: _style,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  final TextStyle _style = TextStyle(
      color: Colors.blueGrey[700], fontWeight: FontWeight.w600, fontSize: 20);
}
