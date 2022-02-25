import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/constants/app_constants.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/appbar_style.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/styles.dart';

import 'content_over_home_view_banner.dart';
import 'image_with_top_shadow_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? imagePath;
  final bool centerTitle;
  final AppBarStyle appBarStyle;
  final Widget? bannerContent;

  const AppBarWidget(
      {Key? key,
      this.title = AppConstants.defaultAppBarTitle,
      this.imagePath,
      this.centerTitle = true,
      this.appBarStyle = AppBarStyle.nonScrollable,
      this.bannerContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (appBarStyle) {
      case AppBarStyle.scrollable:
        return SliverAppBar(
          backgroundColor: Colors.black,
          expandedHeight: 450.0,
          floating: false,
          pinned: true,
          flexibleSpace:
              LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
            // var top = constraints.biggest.height;
            return FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              centerTitle: true,
              stretchModes: const [StretchMode.blurBackground],
              title: SizedBox(
                  height: 20, child: Image.asset('assets/tonal-logo-202004.png')),
              background: ImageWithTopShadowWidget(
                imagePath ?? ImagePaths.homeView,
                contentOverBackground: bannerContent,
              ),
            );
          }),
        );
      case AppBarStyle.nonScrollable:
        return AppBar(
          title: Text(title, style: appBarTextStyles),
          centerTitle: true,
          backgroundColor: ColorConstant.white90,
          foregroundColor: ColorConstant.blackBar,
        );

      default:
        return AppBar(
            title: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: ColorConstant.white90,
          foregroundColor: ColorConstant.blackBar,
        ));
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
