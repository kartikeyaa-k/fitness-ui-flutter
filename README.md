# Metrics Bubble Flutter Project 
https://user-images.githubusercontent.com/67781046/155631098-9e81a703-dbf8-4088-b08e-7bab2570b510.mp4


Created a widget named <b>"MetricsBubbleWidget"</b> and a wrapper <b>"MetricsBubbleWrapper"</b> using flutter. Video attached below. This widget is highly customizable, reusable. You can use it and design as per any requirement just by passing parameters. 

MetricsBubbleWrapper gives you access to even show list of Bubbles either in horizontal or vertical axis.</br>


<b>Project Highlights : </b>
1. Flutter Bloc/Cubit
2. <b>Reusable, Customizable Components/Widgets </b>
3. Get It (Dependency Injection) 
4. Extensions
5. <b>Designs </b>
6. Models, Common Widgets, Exceptions   



This wrapper widget can be used with multiple purposes. 

MetricsBubbleWrapper :  </br>
```
  final List<MetricsBubble> bubbleList; // list of bubbles </br>
  final Axis direction; // decide if you want to show bubbles vertically or horizatally  </br>
  final Function onSelected; // decide action when user clicks on any bubble </br>
  final double bubbleDiameter; // bubble size </br>
  final Color backgroundColor; // bubble bg color </br>
  final bool isShadow;  // shadow can be turned off </br>
  final Color shadowColor;  </br>
  final double shadowRadius;  </br>
  final Offset shadowOffset; // change direction of shadow </br>
  // Network Image not implemented </br>
  // todo : Network Image Implementation </br>
  final String localAssetSvgGraphPath; // currently only assets </br>
  final TextStyle? topStringTextStyle; // bubble top text styling </br>
  final TextStyle? middleStringTextStyle; // bubble middle text styling </br>
  final TextStyle? bottomStringTextStyle; // bubble bottom text styling </br>
  final double containerHorizontalMargin;  </br>
  final double containerVerticalMargin; </br>
  final double containerExtraHeight; // vertical padding (extra height on top and bottom of the bubble) </br>
  final double containerHorizontalPadding; </br>
  final double gapBetweenBubbles;  </br>
```


Further, Wrapper calls MetricsBubbleWidget. 

<b> MetricsBubbleWidget : </b>
 ```
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
```







