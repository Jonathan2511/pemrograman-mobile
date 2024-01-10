import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String token;
  const MainPage({super.key, required this.token});

  @override
  State<MainPage> createState() => _MainPageState();
}

// mixin buat controller tab bar
class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: "Post",
            ),
            Tab(
              text: "My Post",
            )
          ],
        ),
      ),
    );
  }
}
