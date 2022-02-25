import 'package:equatable/equatable.dart';
import 'package:metrics_bubble_flutter/src/data/models/coach_ai_model.dart';
import 'package:metrics_bubble_flutter/src/data/models/metrics_bubble_model.dart';

abstract class CoachAiState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CoachAiWorkoutInitial extends CoachAiState {}

class CoachAiWorkoutLoading extends CoachAiState {}

class CoachAiWorkoutFetchSuccess extends CoachAiState {
  final CoachAiWorkoutPlan plan;
  CoachAiWorkoutFetchSuccess({
    required this.plan,
  });

  @override
  List<Object?> get props => [plan];
}

class CoachAiWorkoutFetchFailed extends CoachAiState {
  final Exception error;
  CoachAiWorkoutFetchFailed(this.error);
  @override
  List<Object?> get props => [error];
}

class CoachAiSelectedBubble extends CoachAiState {
  final MetricsBubble bubble;
  CoachAiSelectedBubble(this.bubble);
  @override
  List<Object?> get props => [bubble];
}

class CoachAiUpdateBubble extends CoachAiState {
  final List<MetricsBubble> bubbleList;
  CoachAiUpdateBubble(this.bubbleList);
  @override
  List<Object?> get props => [bubbleList];
}
