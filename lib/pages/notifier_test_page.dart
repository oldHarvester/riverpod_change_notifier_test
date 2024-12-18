import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_change_test/controllers/notifier_controller.dart';
import 'package:state_change_test/controllers/state.dart';

class NotifierTestPage extends ConsumerStatefulWidget {
  const NotifierTestPage({super.key});

  @override
  ConsumerState<NotifierTestPage> createState() => _NotifierTestPageState();
}

class _NotifierTestPageState extends ConsumerState<NotifierTestPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notifierProvider);
    final controller = ref.watch(notifierProvider.notifier);
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
