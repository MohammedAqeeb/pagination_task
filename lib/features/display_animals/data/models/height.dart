class Height {
  final String imperial;
  final String metric;

  Height({
    required this.imperial,
    required this.metric,
  });

  factory Height.fromMap(Map<String, dynamic> map) {
    return Height(
      imperial: (map['imperial'] ?? '') as String,
      metric: (map['metric'] ?? '') as String,
    );
  }
}
