import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/constants/app_constants.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/appbar_style.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/styles.dart';
import 'package:metrics_bubble_flutter/src/data/models/metrics_bubble_model.dart';
import 'package:metrics_bubble_flutter/src/presentations/blocs/coach_ai_workouts/coach_ai_cubit.dart';
import 'package:metrics_bubble_flutter/src/presentations/blocs/coach_ai_workouts/coach_ai_state.dart';
import 'package:metrics_bubble_flutter/src/presentations/widgets/metrics_bubble_wrapper.dart';
import 'package:metrics_bubble_flutter/src/presentations/widgets/tonal_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Coach AI suggest a goal which is show in the form of metrics bubbles
// Which user can modify by clicking on it and modifying using the form above it.
class CustomizeWorkoutView extends StatefulWidget {
  const CustomizeWorkoutView({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomizeWorkoutView> createState() => _CustomizeWorkoutViewState();
}

class _CustomizeWorkoutViewState extends State<CustomizeWorkoutView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController labelText;
  late TextEditingController weightText;
  var isFormDisabled = true;
  late CoachAiCubit coachAiCubit;
  List<MetricsBubble> listBubble = [];

  @override
  void initState() {
    labelText = TextEditingController();
    weightText = TextEditingController();
    coachAiCubit = BlocProvider.of<CoachAiCubit>(context);
    getCoachAiEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: AppConstants.customizeViewAppBarTitle,
          appBarStyle: AppBarStyle.nonScrollable,
        ),
        body: _buildBody());
  }

  // Main Body
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(
            height: 16,
          ),
          _buildSuggestion(),
          const SizedBox(
            height: 16,
          ),
          _buildBubbles(),
          const SizedBox(
            height: 16,
          ),
          _randomCard()
        ],
      ),
    );
  }

  // Metric Bubbles
  Widget _buildBubbles() {
    return BlocConsumer<CoachAiCubit, CoachAiState>(
      listener: (context, state) {
        if (state is CoachAiWorkoutLoading) {
        } else if (state is CoachAiWorkoutFetchSuccess) {
          listBubble = state.plan.bubbleList;
        } else if (state is CoachAiSelectedBubble) {
          labelText.text = state.bubble.label;
          weightText.text = state.bubble.weight.toString();
          isFormDisabled = false;
        } else if (state is CoachAiUpdateBubble) {
          // _formKey.currentState!.validate();
          listBubble = state.bubbleList;
        }
      },
      buildWhen: (p, c) =>
          c is CoachAiWorkoutFetchSuccess ||
          c is CoachAiSelectedBubble ||
          c is CoachAiUpdateBubble,
      builder: (context, state) {
        return Column(
          children: [
            _buildForm(),
            MetricsBubbleWrapper(
              onSelected: (MetricsBubble selectedBubble) {
                coachAiCubit.getSelectedBubble(selectedBubble);
              },
              bubbleDiameter: 272,
              bubbleList: listBubble,
              containerHorizontalMargin: 0,
              containerVerticalMargin: 0,
              gapBetweenBubbles: 20,
              containerExtraHeight: 90,
              direction: Axis.horizontal,
            ),
          ],
        );
      },
    );
  }

  // Coach AI Header
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // This text should be dynamic
          // For now hardcoded
          Text(
            CustomzieViewStrings.coachAiString.toUpperCase(),
            style: viewHeaderTextStyles,
          ),
          // ignore: prefer_const_constructors
          Text(
            CustomzieViewStrings.nextSessionGoal.toUpperCase(),
            style: viewHeaderTextStyles,
          )
        ],
      ),
    );
  }

  // Subheader
  Widget _buildSuggestion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        CustomzieViewStrings.customizeWorkoutSuggestion.toUpperCase(),
        style: hintStyle,
      ),
    );
  }

  // Form
  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IgnorePointer(
        ignoring: isFormDisabled,
        child: Card(
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: labelText,
                      maxLength: 20,
                      decoration: formLabelDecoration(hintText: 'Label'),
                      keyboardType: TextInputType.name,
                      onChanged: (value) {
                        coachAiCubit.updateSelectedBubble(value, weightText.text);
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: weightText,
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: formLabelDecoration(hintText: 'Weight'),
                      onChanged: (value) {
                        coachAiCubit.updateSelectedBubble(labelText.text, value);
                      },
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (!coachAiCubit.validateWeight(value)) {
                          return '* Please enter a value between 0 to 350';
                        } else {
                          return '';
                        }
                      },
                    ),
                    // Text(errorMessage.toString())
                  ],
                )),
          ),
        ),
      ),
    );
  }

  // Demo Purpose
  Widget _randomCard() {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, int index) {
            return ListTile(
              title: Text(
                HomeViewStrings.tricepExtension.toUpperCase(),
                style: appBarTextStyles.copyWith(fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                HomeViewStrings.tricepExtensionDetails,
                style: appBarTextStyles.copyWith(
                    color: ColorConstant.textPlaceholderGray, fontSize: 12),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          }),
    );
  }

  // Bloc Event
  getCoachAiEvent() {
    coachAiCubit.getCoachAiWorkout();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
