import 'package:flutter/material.dart';
import 'package:state_change_test/pages/bloc_test_page.dart';
import 'package:state_change_test/pages/change_notifier_test.dart';
import 'package:state_change_test/pages/notifier_test_page.dart';
import 'package:state_change_test/pages/riverpod_change_notifier_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
          NotifierTestPage(),
          RiverpodChangeNotifierTestPage(),
          BlocTestPage(),
        ],
      ),
    );
  }
}
