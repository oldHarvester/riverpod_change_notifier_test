import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_change_test/controllers/change_notifier_controller.dart';
import 'package:state_change_test/controllers/state.dart';

class ChangeNotifierTestPage extends ConsumerStatefulWidget {
  const ChangeNotifierTestPage({super.key});

  @override
  ConsumerState<ChangeNotifierTestPage> createState() =>
      _ChangeNotifierTestPageState();
}

class _ChangeNotifierTestPageState
    extends ConsumerState<ChangeNotifierTestPage> {
  final ChangeNotifierController _controller = ChangeNotifierController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          for (var i = 0; i < 10; i++) {
            if (_controller.state is! LoadingState) {
              _controller.updateNumber(i);
            }
          }
        },
        icon: const Icon(Icons.add),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, child) {
            final state = _controller.state;
            debugPrint('${_controller.runtimeType} changed in widget - $state');
            return switch (state) {
              InitialState _ => const Text('initial'),
              LoadingState _ => const CircularProgressIndicator(),
              ErrorState _ => const Text('Error'),
              DataState e => Text('${e.number}'),
            };
          },
        ),
      ),
    );
  }
}
