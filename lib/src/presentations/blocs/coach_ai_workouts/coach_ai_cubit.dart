import 'package:bloc/bloc.dart';
import 'package:metrics_bubble_flutter/src/configurations/extensions/string_extensions.dart';
import 'package:metrics_bubble_flutter/src/data/models/metrics_bubble_model.dart';
import 'package:metrics_bubble_flutter/src/data/repositories/workout_repository/i_customize_workout_repository.dart';

import 'coach_ai_state.dart';

class CoachAiCubit extends Cubit<CoachAiState> {
  final ICustomizeWorkoutRepository _customizeWorkoutRepository;

  CoachAiCubit(this._customizeWorkoutRepository) : super(CoachAiWorkoutInitial());

  late MetricsBubble currentBubble;
  List<MetricsBubble> bubbleList = [];

  Future<void> getCoachAiWorkout() async {
    emit(CoachAiWorkoutLoading());
    final coachAiWorkout = await _customizeWorkoutRepository.getCoachAiWorkout();
    coachAiWorkout.fold((exception) {
      CoachAiWorkoutFetchFailed(exception);
    }, (program) {
      bubbleList = program.bubbleList;
      emit(CoachAiWorkoutFetchSuccess(plan: program));
    });
  }

  Future<void> getSelectedBubble(MetricsBubble selectedBubble) async {
    currentBubble = selectedBubble;
    emit(CoachAiSelectedBubble(currentBubble));
  }

  Future<void> updateSelectedBubble(String label, String weight) async {
    emit(CoachAiWorkoutLoading());
    currentBubble.label = label;
    currentBubble.weight = weight.isNumeric(weight) ? int.parse(weight) : 0;
    List<MetricsBubble> updatedList = [];
    if (currentBubble.weight < 350) {
      for (var bubble in bubbleList) {
        if (bubble.id == currentBubble.id) {
          updatedList.add(currentBubble);
        } else {
          updatedList.add(bubble);
        }
        // }
        emit(CoachAiUpdateBubble(updatedList.toList()));
      }
    }
  }

  bool validateWeight(String? weight) {
    if (weight != null) {
      var num = weight.isNumeric(weight) ? int.parse(weight) : 0;

      if (num > 350) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
}
