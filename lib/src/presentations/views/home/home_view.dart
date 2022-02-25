import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/constants/app_constants.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/appbar_style.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/styles.dart';
import 'package:metrics_bubble_flutter/src/presentations/widgets/content_over_home_view_banner.dart';
import 'package:metrics_bubble_flutter/src/presentations/widgets/tonal_appbar.dart';

// This page demonstrates Slivers and app design
class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        const AppBarWidget(
          imagePath: ImagePaths.homeView,
          appBarStyle: AppBarStyle.scrollable,
          bannerContent: ContentOverHomeViewWidget(),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            // Demo cards for design purpose
            _buildStreakCard(),
            _buildTotalVolumeCard(),

            // Empty Containers for demo purpose
            Container(
              color: Colors.orange,
              height: 420,
            ),
          ], addAutomaticKeepAlives: false, addRepaintBoundaries: false),
        )
      ],
    );
  }

  _buildStreakCard() {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HomeViewStrings.weekNumber.toUpperCase(),
                    style: viewHeaderTextStyles,
                  ),
                  Text(
                    HomeViewStrings.currentStreak,
                    style: viewHeaderTextStyles.copyWith(
                        color: ColorConstant.textPlaceholderGray, fontSize: 12),
                  )
                ],
              ),
              // Hardcoded Icon
              const Icon(Icons.star)
            ],
          ),
        ),
      ),
    );
  }

  _buildTotalVolumeCard() {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    HomeViewStrings.totalVolumeTitle.toUpperCase(),
                    style: viewHeaderTextStyles,
                  ),
                  Text(
                    HomeViewStrings.totalVolumeCount,
                    style: viewHeaderTextStyles.copyWith(
                        color: ColorConstant.textPlaceholderGray, fontSize: 12),
                  )
                ],
              ),
              // Hardcoded
              const Text(
                HomeViewStrings.totalVolumeCount,
                style: viewHeaderTextStyles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
