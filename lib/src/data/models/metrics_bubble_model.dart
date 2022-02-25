class MetricsBubble {
  int id;
  String label;
  int weight;
  String unit;

  MetricsBubble(
      {required this.id, required this.label, required this.weight, this.unit = 'lbs'});
}
