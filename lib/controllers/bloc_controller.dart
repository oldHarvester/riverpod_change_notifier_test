import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_change_test/controllers/state.dart';

sealed class UiEvent {}

class UpdateNumberEvent extends UiEvent {
  UpdateNumberEvent({
    required this.number,
  });
  final int number;
}

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super(InitialState()) {
    on<UpdateNumberEvent>(_onUpdateNumberEvent);
  }

  Future<void> _onUpdateNumberEvent(
    UpdateNumberEvent event,
    Emitter<UiState> emit,
  ) async {
    debugPrint('$runtimeType update - ${event.number} state: $state');
    emit(LoadingState());
    await Future.delayed(Duration(seconds: event.number));
    emit(DataState(number: event.number));
  }
}
