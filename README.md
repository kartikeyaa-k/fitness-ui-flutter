# Metrics Bubble Flutter Project 
Created a widget named "MetricsBubbleWidget" and a wrapper "MetricsBubbleWrapper" using flutter. Video attached below. This widget is highly customizable, reusable. You can use it and design as per any requirement just by passing parameters. 

MetricsBubbleWrapper gives you access to even show list of Bubbles either in horizontal or vertical axis.

Highlights : 
1. Flutter Bloc/Cubit
2. Reusable, Customizable Components/Widgets
3. Get It (Dependency Injection)
4. Extensions
5. Designs
5. Models, Common Widgets, Exceptions   



// This wrapper widget is more like a general widget, can be used any type of app
MetricsBubbleWrapper : 
  final List<MetricsBubble> bubbleList; // list of bubbles
  final Axis direction; // decide if you want to show bubbles vertically or horizatally
  final Function onSelected; // decide action when user clicks on any bubble
  final double bubbleDiameter; // bubble size
  final Color backgroundColor; // bubble bg color
  final bool isShadow;  // shadow can be turned off
  final Color shadowColor; 
  final double shadowRadius; 
  final Offset shadowOffset; // change direction of shadow
  // Network Image not implemented
  // todo : Network Image Implementation
  final String localAssetSvgGraphPath; // currently only assets
  final TextStyle? topStringTextStyle; // bubble top text styling
  final TextStyle? middleStringTextStyle; // bubble middle text styling
  final TextStyle? bottomStringTextStyle; // bubble bottom text styling
  final double containerHorizontalMargin; 
  final double containerVerticalMargin;
  final double containerExtraHeight; // vertical padding (extra height on top and bottom of the bubble)
  final double containerHorizontalPadding;
  final double gapBetweenBubbles; 



Further, Wrapper calls MetricsBubbleWidget. 

MetricsBubbleWidget :
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

