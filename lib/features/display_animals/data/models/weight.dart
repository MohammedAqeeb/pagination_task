class Weight {
  final String imperial;
  final String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  factory Weight.fromMap(Map<String, dynamic> map) {
    return Weight(
      imperial: (map['imperial'] ?? '') as String,
      metric: (map['metric'] ?? '') as String,
    );
  }
}
