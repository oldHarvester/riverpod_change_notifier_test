import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_change_test/controllers/bloc_controller.dart';
import 'package:state_change_test/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UiBloc();
      },
      child: const ProviderScope(
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }
}
