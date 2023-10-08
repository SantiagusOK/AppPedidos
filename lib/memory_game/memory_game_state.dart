import 'package:equatable/equatable.dart';

enum MemoryGameStatus { initial, success, failure }

class MemoryGameState extends Equatable {
  final MemoryGameStatus status;
  const MemoryGameState({required this.status});
  @override
  List<Object?> get props => [status];
}

class MemoryGameInitialState extends MemoryGameState {
  final int? firstTileIndex;
  final int? secondTileIndex;

  const MemoryGameInitialState({this.firstTileIndex, this.secondTileIndex})
      : super(status: MemoryGameStatus.initial);

  @override
  List<Object?> get props => [status, firstTileIndex, secondTileIndex];
}

class MemoryGameFailureState extends MemoryGameState {
  final String? errorMessage;

  const MemoryGameFailureState({
    this.errorMessage,
  }) : super(status: MemoryGameStatus.failure);
}

class MemoryGameSuccessState extends MemoryGameState {
  final String? message;

  const MemoryGameSuccessState({
    this.message,
  }) : super(status: MemoryGameStatus.success);
}
