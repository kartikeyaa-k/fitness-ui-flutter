import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrics_bubble_flutter/src/configurations/constants/app_constants.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/appbar_style.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/styles.dart';
import 'package:metrics_bubble_flutter/src/data/models/metrics_bubble_model.dart';
import 'package:metrics_bubble_flutter/src/presentations/blocs/coach_ai_workouts/coach_ai_cubit.dart';
import 'package:metrics_bubble_flutter/src/presentations/blocs/coach_ai_workouts/coach_ai_state.dart';
import 'package:metrics_bubble_flutter/src/presentations/widgets/metrics_bubble_wrapper.dart';
import 'package:metrics_bubble_flutter/src/presentations/widgets/tonal_appbar.dart';

// This page demonstrates using metrics-bubble-widget to its full capacity
// Entirely separate widget can be customzied as per the UI needs
class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  late CoachAiCubit coachAiCubit;
  List<MetricsBubble> listStrengthBubble = [];

  @override
  void initState() {
    coachAiCubit = BlocProvider.of<CoachAiCubit>(context);
    getCoachAiEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const AppBarWidget(
        title: AppConstants.exploreViewAppBarTitle,
        appBarStyle: AppBarStyle.nonScrollable,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [_buildStrengthScore()],
        ),
      ),
    );
  }

  // Card for demo purpose
  _buildStrengthScore() {
    return Container(
      height: 330,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hardcoded
                  Text(
                    HomeViewStrings.strengthScoreTitle.toUpperCase(),
                    style: viewHeaderTextStyles,
                  ),
                  const Text(
                    HomeViewStrings.totalVolumeCount,
                    style: viewHeaderTextStyles,
                  ),
                ],
              ),
            ),
            _buildCustomBubbles()
          ],
        ),
      ),
    );
  }

  // Customizable bubble widget
  Widget _buildCustomBubbles() {
    return BlocConsumer<CoachAiCubit, CoachAiState>(
      listener: (context, state) {
        if (state is CoachAiWorkoutLoading) {
        } else if (state is CoachAiWorkoutFetchSuccess) {
          listStrengthBubble = state.plan.bubbleList;
        } else if (state is CoachAiWorkoutFetchFailed) {
          //todo: Unimplemented
        }
      },
      buildWhen: (p, c) =>
          c is CoachAiWorkoutFetchSuccess ||
          c is CoachAiSelectedBubble ||
          c is CoachAiUpdateBubble,
      builder: (context, state) {
        return // Everything about the bubble is customizable

            MetricsBubbleWrapper(
          onSelected: (MetricsBubble selectedBubble) {},
          bubbleDiameter: 200,
          backgroundColor: ColorConstant.blackBar,
          shadowColor: ColorConstant.battleshipGrey,
          shadowOffset: const Offset(10, 27),
          shadowRadius: 30,
          isShadow: false,
          bubbleList: listStrengthBubble,
          containerHorizontalMargin: 16,
          containerVerticalMargin: 0,
          gapBetweenBubbles: 20,
          containerExtraHeight: 0,
          direction: Axis.horizontal,
        );
      },
    );
  }

  // Bloc event
  getCoachAiEvent() {
    coachAiCubit.getCoachAiWorkout();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
