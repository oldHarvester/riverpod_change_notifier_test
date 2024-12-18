import 'package:flutter/material.dart';
import 'package:state_change_test/change_notifier_test.dart';
import 'package:state_change_test/riverpod_change_notifier_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          ChangeNotifierTestPage(),
          RiverpodChangeNotifierTestPage()
        ],
      ),
    );
  }
}
