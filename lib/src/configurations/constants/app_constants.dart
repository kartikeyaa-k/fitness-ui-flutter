import 'dart:core';

/// Some of these values shoule be loaded from an external source
/// Currently it is out of scope of this demo
/// Hence Hardcoded here

class AppConstants {
  static const String defaultAppBarTitle = 'Tonal';
  static const String activityViewAppBarTitle = 'Activity';
  static const String exploreViewAppBarTitle = 'Explore';
  static const String customizeViewAppBarTitle = 'Customize';
}

class ImagePaths {
  static const String homeView = 'assets/strength.jpeg';
}

class BottomNavIndex {
  static const int home = 0;
  static const int summary = 1;
  static const int coachAi = 2;
  static const int customize = 3;
}

class BottomNavTitles {
  static const String home = 'Home';
  static const String activity = 'Activity';
  static const String explore = 'Explore';
  static const String customize = 'Customize';
}

class CustomzieViewStrings {
  static const String coachAiString = 'Coach A.I. recommends';
  static const String nextSessionGoal = 'Next Session Goal';
  static const String customizeWorkoutSuggestion =
      'You can edit this goal by clicking on the circles below';
}

class ActivityViewStrings {
  static const String thisWeek = 'This Week';
  static const String activityName = 'Free Lift';
  static const String activityTime = '3:25 PM (113 Mins)';
  static const String movementTarget = 'Movement Target';
  static const String volumeUnit = 'Volume(lbs)';
  static const String movementTargetValue = '94%';
  static const String volumeValue = '5717';
}

class HomeViewStrings {
  static const String homeViewProgramName = 'Go Big Or Go Home';
  static const String coachName = 'Coach Jackson';
  static const String upNext = 'Up Next';
  static const String workoutCount = 'Workout 16';
  static const String workoutTotalCount = 'of 16';
  static const String duration = '50';
  static const String durationUnit = 'Min';
  static const String whichBodyPart = 'Upper body';
  static const String weekNumber = '12 weeks';
  static const String currentStreak = 'Current Streak';
  static const String totalVolumeTitle = 'Total Volume';
  static const String movementCount = '2 Movements';
  static const String totalVolumeCount = '5,546 lbs';
  static const String strengthScoreTitle = 'Strength \nScore';
  static const String strengthScoreCount = '548';
  static const String tricepExtension = 'Tricep Extension';
  static const String tricepExtensionDetails = '1 set, 14 reps, 40 lbs max';
}
