import 'package:dartz/dartz.dart';

extension BubbleFontHandler on double {
  Tuple3<double, double, double> getFontSizeAsPerDiameter(double diameter) {
    /// As per given styles
    /// For diameter = 272 : label == 19, weight == 127, unit== 38
    /// We find diameter and weight relation, their ratio is 0.466
    /// Hence for any diameter, weight will be 0.466 * diameter
    var weight = 0.466 * diameter;

    /// Once we calculate weight, we can find label, unit font size
    /// based on their respective ratio
    /// label and weight ration as per given styles are 19/127 = 0.149
    var label = 0.149 * weight;

    /// Similarly we calculate unit font size
    /// based on their respective ratio
    /// unit and weight ration as per given styles are 38/127 = 0.299
    var unit = 0.299 * weight;
    return Tuple3(label, weight, unit);
  }

  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
