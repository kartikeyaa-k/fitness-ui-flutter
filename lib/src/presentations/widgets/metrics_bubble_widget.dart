import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metrics_bubble_flutter/src/configurations/extensions/double_modifier.dart';

// This Widget Works Dynamically
// Based on the diameter you provide
// Fonts will change automatically
class MetricsBubbleWidget extends StatelessWidget {
  final String label;
  final int weight;
  final String unit;
  final double bubbleDiameter;
  final BoxDecoration bubbleBoxDecoration;
  final TextStyle labelTextStyle;
  final TextStyle weightTextStyle;
  final TextStyle unitTextStyle;
  final String graphPath;
  final EdgeInsetsGeometry margin;

  const MetricsBubbleWidget(
      {Key? key,
      required this.label,
      required this.weight,
      this.unit = 'lbs',
      this.bubbleDiameter = 272,
      required this.bubbleBoxDecoration,
      required this.labelTextStyle,
      required this.weightTextStyle,
      required this.unitTextStyle,
      required this.graphPath,
      this.margin = const EdgeInsets.symmetric(horizontal: 2, vertical: 2)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: bubbleDiameter,
      height: bubbleDiameter,
      decoration: bubbleBoxDecoration,
      margin: margin,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              graphPath,
              width: bubbleDiameter,
              height: bubbleDiameter,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Label
                Padding(
                  padding: EdgeInsets.only(
                      left: bubbleDiameter / 4, right: bubbleDiameter / 4),
                  child: Text(
                    label,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: labelTextStyle.fontFamily,
                      fontSize:
                          bubbleDiameter.getFontSizeAsPerDiameter(bubbleDiameter).value1,
                      fontWeight: labelTextStyle.fontWeight,
                      color: labelTextStyle.color,
                      height: 1,
                    ),
                  ),
                ),
                // Weight
                Text(weight.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: weightTextStyle.fontFamily,
                      fontWeight: weightTextStyle.fontWeight,
                      fontSize:
                          bubbleDiameter.getFontSizeAsPerDiameter(bubbleDiameter).value2,
                      color: weightTextStyle.color,
                      height: 1.1,
                    )),
                // Unit
                Text(unit,
                    style: TextStyle(
                      fontFamily: unitTextStyle.fontFamily,
                      fontWeight: unitTextStyle.fontWeight,
                      fontSize:
                          bubbleDiameter.getFontSizeAsPerDiameter(bubbleDiameter).value3,
                      color: unitTextStyle.color,
                      height: 0.5,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
