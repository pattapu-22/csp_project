class Report {
  final String id;
  final String description;
  final String category;
  final DateTime timestamp;
  final bool isAnonymous;

  Report({
    required this.id,
    required this.description,
    required this.category,
    required this.timestamp,
    required this.isAnonymous,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'category': category,
      'timestamp': timestamp,
      'isAnonymous': isAnonymous,
    };
  }
}