import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/constants/app_constants.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';
import 'package:metrics_bubble_flutter/src/presentations/blocs/coach_ai_workouts/coach_ai_cubit.dart';
import 'package:metrics_bubble_flutter/src/presentations/views/activity/activity_view.dart';
import 'package:metrics_bubble_flutter/src/presentations/views/customize_workout/customize_workout_view.dart';
import 'package:metrics_bubble_flutter/src/presentations/views/explore/explore_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../service_locator.dart';
import 'home_view.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  late PageController _controller;
  late int _tabIndex;
  @override
  void initState() {
    super.initState();
    // For now its hardcoded to zero
    // Current tab index should be dynamic
    _tabIndex = 0;
    _controller = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// Main body
  Widget _buildBody() {
    return PageView.custom(
      physics: const NeverScrollableScrollPhysics(),
      controller: _controller,
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          switch (index) {
            case 0:
              return const HomeView();

            case 1:
              return const ActivityView();

            case 2:
              return BlocProvider<CoachAiCubit>(
                  create: (context) => sl<CoachAiCubit>(), child: const ExploreView());

            case 3:
              return BlocProvider<CoachAiCubit>(
                  create: (context) => sl<CoachAiCubit>(),
                  child: const CustomizeWorkoutView());

            default:
              return const HomeView();
          }
        },
        childCount: 4,
      ),
    );
  }

  /// Bottom nav bar
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 10.0,
      currentIndex: _tabIndex,
      backgroundColor: ColorConstant.white90,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      unselectedItemColor: ColorConstant.appBarUnselectedItemColor,
      selectedItemColor: ColorConstant.blackBar,
      type: BottomNavigationBarType.shifting,
      items: [
        // Ideally Icons / Image, Tab name should be dynamic
        // As the project scope increases this needs to be handled separetly
        // Currently Hardcoding values using icons, labels
        _buildBottomNavigationBarItem(BottomNavTitles.home, const Icon(Icons.home)),
        _buildBottomNavigationBarItem(
            BottomNavTitles.activity, const Icon(Icons.flag_sharp)),
        _buildBottomNavigationBarItem(BottomNavTitles.explore, const Icon(Icons.explore)),
        _buildBottomNavigationBarItem(
            BottomNavTitles.customize, const Icon(Icons.dashboard_customize)),
      ],
      onTap: (index) {
        _onTabClicked(index);
      },
    );
  }

  /// Individual bottom nav bar item
  BottomNavigationBarItem _buildBottomNavigationBarItem(String label, Icon icon) {
    return BottomNavigationBarItem(label: label, icon: icon);
  }

  void _onTabClicked(int index) {
    setState(() {
      _tabIndex = index;
    });
    _controller.jumpToPage(index);
  }

  /// Whenever index is changed from any views it's handled here
  void refresh(int childValue) {
    _onTabClicked(childValue);
  }
}
