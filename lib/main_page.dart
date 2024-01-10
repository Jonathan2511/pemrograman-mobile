import 'package:flutter/material.dart';
import 'package:sesi10sampai14/text_field_builder.dart';

class MainPage extends StatefulWidget {
  final String token;
  const MainPage({super.key, required this.token});

  @override
  State<MainPage> createState() => _MainPageState();
}

// mixin buat controller tab bar
class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController _tabController;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

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
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(
            child: Text('This Is Post'),
          ),
          Center(
            child: Text('This Is My Post'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPostDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showPostDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Create Post'),
            content: Column(
              children: [
                textFieldBuilder(
                    label: "Title",
                    controller: _titleController,
                    obsecureText: false),
                const SizedBox(
                  height: 8,
                ),
                textFieldBuilder(
                    maxLines: 4,
                    label: "Content",
                    controller: _contentController,
                    obsecureText: false),
              ],
            ),
          );
        });
  }
}
