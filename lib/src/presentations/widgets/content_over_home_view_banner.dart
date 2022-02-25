import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/constants/app_constants.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/styles.dart';

class ContentOverHomeViewWidget extends StatelessWidget {
  const ContentOverHomeViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Here the values such as program name, program list should be
    // added from the network

    // for demo purpose, hardcoded values
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Program Title
                Text(
                  HomeViewStrings.homeViewProgramName,
                  style: appBarTextStyles.copyWith(
                    color: ColorConstant.white90,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // Coach Name
                Text(
                  HomeViewStrings.coachName,
                  style: viewHeaderTextStyles.copyWith(
                      color: ColorConstant.textPlaceholderGray, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
