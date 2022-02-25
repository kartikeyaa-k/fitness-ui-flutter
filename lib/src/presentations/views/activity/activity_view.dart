import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/constants/app_constants.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/appbar_style.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/styles.dart';
import 'package:metrics_bubble_flutter/src/presentations/widgets/tonal_appbar.dart';

// This screen is only for design demo purpose
// Does not have metric bubble widget
class ActivityView extends StatefulWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: AppConstants.activityViewAppBarTitle,
          appBarStyle: AppBarStyle.nonScrollable,
        ),
        body: _buildBody());
  }

  // Main body
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(
              height: 8,
            ),
            _buildActivityMainCard(),
          ],
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // This text should be dynamic
        // For now it's hardcoded
        Text(
          ActivityViewStrings.thisWeek.toUpperCase(),
          style: viewHeaderTextStyles,
        ),
      ],
    );
  }

  Widget _buildActivityMainCard() {
    return SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Card(
            elevation: 10,
            color: ColorConstant.blackBar,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ActivityViewStrings.activityName.toUpperCase(),
                        style:
                            viewHeaderTextStyles.copyWith(color: ColorConstant.white90),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        ActivityViewStrings.activityTime.toUpperCase(),
                        style: viewHeaderTextStyles.copyWith(
                            color: ColorConstant.textPlaceholderGray, fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ActivityViewStrings.movementTargetValue.toUpperCase(),
                              style: viewHeaderTextStyles.copyWith(
                                  color: ColorConstant.white90),
                            ),
                            Text(
                              ActivityViewStrings.movementTarget.toUpperCase(),
                              style: viewHeaderTextStyles.copyWith(
                                  color: ColorConstant.textPlaceholderGray, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ActivityViewStrings.volumeValue.toUpperCase(),
                              style: viewHeaderTextStyles.copyWith(
                                  color: ColorConstant.white90),
                            ),
                            Text(
                              ActivityViewStrings.volumeUnit.toUpperCase(),
                              style: viewHeaderTextStyles.copyWith(
                                  color: ColorConstant.textPlaceholderGray, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
