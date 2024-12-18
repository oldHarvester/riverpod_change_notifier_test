import 'package:equatable/equatable.dart';

sealed class UiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends UiState {}

class DataState extends UiState {
  DataState({required this.number});
  final int number;
}

class ErrorState extends UiState {}

class InitialState extends UiState {}
