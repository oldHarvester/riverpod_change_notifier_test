import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_change_test/controllers/riverpod_change_notifier_controller.dart';
import 'package:state_change_test/controllers/state.dart';

class RiverpodChangeNotifierTestPage extends ConsumerStatefulWidget {
  const RiverpodChangeNotifierTestPage({super.key});

  @override
  ConsumerState<RiverpodChangeNotifierTestPage> createState() =>
      _RiverpodChangeNotifierTestPageState();
}

class _RiverpodChangeNotifierTestPageState
    extends ConsumerState<RiverpodChangeNotifierTestPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(riverpodChangeNotifierProvider).state;
    final controller = ref.watch(riverpodChangeNotifierProvider.notifier);
    debugPrint('${controller.runtimeType} changed in widget - $state');
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
        child: switch (state) {
          InitialState _ => const Text('initial'),
          LoadingState _ => const CircularProgressIndicator(),
          ErrorState _ => const Text('Error'),
          DataState e => Text('${e.number}'),
        },
      ),
    );
  }
}
