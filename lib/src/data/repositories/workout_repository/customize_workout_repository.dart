import 'package:dartz/dartz.dart';
import 'package:metrics_bubble_flutter/src/data/models/coach_ai_model.dart';
import 'package:metrics_bubble_flutter/src/data/models/metrics_bubble_model.dart';
import 'package:metrics_bubble_flutter/src/data/repositories/workout_repository/i_customize_workout_repository.dart';

class CustomizeWorkoutRepository implements ICustomizeWorkoutRepository {
  @override
  Future<Either<Exception, CoachAiWorkoutPlan>> getCoachAiWorkout() async {
    // if (await networkUtils.isConnected) {}

    try {
      // dynamic res = await workoutsApiProvider.getCustomizeWorkouts();
      var mockResponse = CoachAiWorkoutPlan(title: 'Free Lift Plan', bubbleList: [
        MetricsBubble(id: 1, label: 'Upper Body', weight: 133, unit: 'lbs'),
        MetricsBubble(id: 2, label: 'Core', weight: 67, unit: 'lbs'),
        MetricsBubble(id: 3, label: 'Lower Body', weight: 90, unit: 'lbs')
      ]);

      return Right(mockResponse);
    } on Exception catch (exception) {
      return Left(exception);
    }
  }
}
