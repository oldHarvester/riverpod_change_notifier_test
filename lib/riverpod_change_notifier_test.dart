import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_change_test/controllers/riverpod_change_notifier_controller.dart';
import 'package:state_change_test/controllers/state.dart';

class RiverpodChangeNotifierTestPage extends StatelessWidget {
  const RiverpodChangeNotifierTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref(riverpodChangeNotifierProvider).state;
        final controller = ref(riverpodChangeNotifierProvider.notifier);
        debugPrint('${controller.runtimeType} changed - $state');
        return Scaffold(
          floatingActionButton: IconButton(
            onPressed: () {
              for (var i = 0; i < 10; i++) {
                if (state is! LoadingState) {
                  controller.updateNumber(i);
                }
              }
            },
            icon: const Icon(Icons.add),
          ),
          body: Center(
            child: Builder(
              builder: (context) {
                switch (state.runtimeType) {
                  case InitialState:
                    return const Text('initial');

                  case LoadingState:
                    return const CircularProgressIndicator();

                  case ErrorState:
                    return const Text('Error');
                  case DataState:
                    return Text('${(state as DataState).number}');
                  default:
                    return const SizedBox();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
