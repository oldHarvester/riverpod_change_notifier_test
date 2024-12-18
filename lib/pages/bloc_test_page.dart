import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_change_test/controllers/bloc_controller.dart';

import '../controllers/state.dart';

class BlocTestPage extends StatelessWidget {
  const BlocTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {
          final bloc = context.read<UiBloc>();
          final state = bloc.state;
          for (var i = 0; i < 10; i++) {
            if (state is! LoadingState) {
              bloc.add(
                UpdateNumberEvent(
                  number: i,
                ),
              );
            }
          }
        },
        icon: const Icon(Icons.add),
      ),
      body: Center(
        child: BlocBuilder<UiBloc, UiState>(
          builder: (context, state) {
            debugPrint('Bloc changed in widget - $state');

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
