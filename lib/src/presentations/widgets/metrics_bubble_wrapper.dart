import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/styles.dart';
import 'package:metrics_bubble_flutter/src/data/models/metrics_bubble_model.dart';

import 'metrics_bubble_widget.dart';

class MetricsBubbleWrapper extends StatelessWidget {
  final double bubbleDiameter;
  final Color backgroundColor;
  final bool isShadow;
  final Color shadowColor;
  final double shadowRadius;
  final Offset shadowOffset;
  // Network Image not implemented
  // todo : Network Image Implementation
  final String localAssetSvgGraphPath;
  final TextStyle? topStringTextStyle;
  final TextStyle? middleStringTextStyle;
  final TextStyle? bottomStringTextStyle;
  final double containerHorizontalMargin;
  final double containerVerticalMargin;
  final double containerExtraHeight;
  final double containerHorizontalPadding;
  final double gapBetweenBubbles;
  final List<MetricsBubble> bubbleList;
  final Axis direction;
  final Function onSelected;

  const MetricsBubbleWrapper(
      {Key? key,
      this.bubbleDiameter = 272,
      this.backgroundColor = const Color(0xff53a99a),
      this.isShadow = true,
      this.shadowColor = const Color(0x3827ae96),
      this.shadowRadius = 33,
      this.shadowOffset = const Offset(0, 27),
      this.localAssetSvgGraphPath = 'assets/graph.svg',
      this.topStringTextStyle,
      this.middleStringTextStyle,
      this.bottomStringTextStyle,
      this.containerHorizontalMargin = 2,
      this.containerVerticalMargin = 2,
      this.containerExtraHeight = 5,
      this.containerHorizontalPadding = 5,
      this.gapBetweenBubbles = 10,
      required this.bubbleList,
      this.direction = Axis.vertical,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Here the bubble list is received from the previous widget
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: containerVerticalMargin, horizontal: containerHorizontalMargin),
        height: bubbleDiameter + containerExtraHeight,
        padding: EdgeInsets.symmetric(horizontal: containerHorizontalPadding),
        child: ListView.builder(
            scrollDirection: direction,
            itemCount: bubbleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onSelected(bubbleList[index]);
                },
                // Everything about the bubble is customizable
                child: MetricsBubbleWidget(
                  bubbleDiameter: bubbleDiameter,
                  label: bubbleList[index].label,
                  weight: bubbleList[index].weight,
                  bubbleBoxDecoration:
                      bubbleBoxDecoration.copyWith(color: backgroundColor, boxShadow: [
                    isShadow
                        ? BoxShadow(
                            offset: shadowOffset,
                            blurRadius: shadowRadius,
                            color: shadowColor,
                          )
                        : const BoxShadow()
                  ]),
                  labelTextStyle: topStringTextStyle ?? labelTextStyle,
                  weightTextStyle: middleStringTextStyle ?? weightTextStyle,
                  unitTextStyle: bottomStringTextStyle ?? unitTextStyle,
                  graphPath: localAssetSvgGraphPath,
                  // This sets the gap between
                  margin: EdgeInsets.only(right: gapBetweenBubbles),
                ),
              );
            }));
  }
}
