import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:state_change_test/controllers/state.dart';

final notifierProvider = NotifierProvider<NotifierController, UiState>(
  () {
    return NotifierController();
  },
);

class NotifierController extends Notifier<UiState> {
  void changeState(UiState newState) {
    state = newState;
  }

  Future<void> updateNumber(int number) async {
    debugPrint('$runtimeType update - $number state: $state');
    changeState(LoadingState());
    await Future.delayed(
      const Duration(seconds: 1),
    );
    changeState(DataState(number: number));
  }

  @override
  UiState build() {
    return InitialState();
  }
}
