import 'package:metrics_bubble_flutter/src/data/repositories/workout_repository/customize_workout_repository.dart';
import 'package:get_it/get_it.dart';
import 'data/repositories/workout_repository/i_customize_workout_repository.dart';
import 'presentations/blocs/coach_ai_workouts/coach_ai_cubit.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // bloc
  sl.registerFactory(() => CoachAiCubit(
        sl(),
      ));

  // repository
  sl.registerLazySingleton<ICustomizeWorkoutRepository>(
      () => CustomizeWorkoutRepository());
}
