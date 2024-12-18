import 'package:flutter/material.dart';
import 'package:state_change_test/controllers/change_notifier_controller.dart';
import 'package:state_change_test/controllers/state.dart';

class ChangeNotifierTestPage extends StatefulWidget {
  const ChangeNotifierTestPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierTestPage> createState() => _ChangeNotifierTestPageState();
}

class _ChangeNotifierTestPageState extends State<ChangeNotifierTestPage> {
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
            debugPrint('${_controller.runtimeType} changed - $state');
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
  }
}
