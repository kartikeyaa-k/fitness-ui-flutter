import 'package:dartz/dartz.dart';
import 'package:metrics_bubble_flutter/src/data/models/coach_ai_model.dart';

abstract class ICustomizeWorkoutRepository {
  Future<Either<Exception, CoachAiWorkoutPlan>> getCoachAiWorkout();
}
