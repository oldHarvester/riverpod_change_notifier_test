import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_change_test/controllers/state.dart';

final riverpodChangeNotifierProvider = ChangeNotifierProvider(
  (ref) {
    return RiverpodChangeNotifierController();
  },
);

class RiverpodChangeNotifierController extends ChangeNotifier {
  UiState _state = InitialState();

  UiState get state => _state;

  void changeState(UiState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> updateNumber(int number) async {
    debugPrint('$runtimeType update - $number');
    changeState(LoadingState());
    await Future.delayed(
      const Duration(seconds: 1),
    );
    changeState(DataState(number: number));
  }
}
