import 'package:flutter/material.dart';
import 'package:metrics_bubble_flutter/src/configurations/themes/colors.dart';

/// Metric bubble styles
/// Orignal styles as provided, not changed anything
const bubbleDiameter = 272;
const bubbleBoxDecoration = BoxDecoration(
  color: Color(0xff53a99a),
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 33,
      color: Color(0x3827ae96),
    )
  ],
);

const labelTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.w700,
  // Removed font size from here
  // to make text adjustable for different bubble size
  // Font will adjust according to the diameter of the bubble
  // fontSize: 19,
  color: Colors.white,
);

const weightTextStyle = TextStyle(
  fontFamily: 'League Gothic',
  // Removed font size from here
  // to make text adjustable for different bubble size
  // Font will adjust according to the diameter of the bubble
  // fontSize: 127,
  color: Colors.white,
  fontWeight: FontWeight.w300,
);

const unitTextStyle = TextStyle(
  fontFamily: 'League Gothic',
  // Removed font size from here
  // to make text adjustable for different bubble size
  // Font will adjust according to the diameter of the bubble
  // fontSize: 38,
  color: Color(0x80ffffff),
  fontWeight: FontWeight.w300,
);

/* Appbar Title Styles  */

const appBarTextStyles = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.w700,
  fontSize: 19,
  color: ColorConstant.blackBar,
);

/* View Headers  */
const viewHeaderTextStyles = TextStyle(
    fontFamily: 'GT',
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: ColorConstant.blackBar,
    letterSpacing: -0.1);

/* Hint Style */
const hintStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 15,
    color: ColorConstant.steel,
    fontWeight: FontWeight.w300);

/* Forms */
InputDecoration formLabelDecoration({String? hintText}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: hintStyle,
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.blackBar, width: 2.0),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.textGray1, width: 2.0),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.textGray1, width: 2.0),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: ColorConstant.blackBar, width: 2.0),
    ),
  );
}

BoxDecoration activityMainCard = const BoxDecoration(color: ColorConstant.blackBar);
