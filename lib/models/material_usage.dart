class MaterialUsage {
  final String id;
  final String materialId;
  final double quantity;
  final DateTime timestamp;
  final String operatorId;
  final bool synced;

  MaterialUsage({
    required this.id,
    required this.materialId,
    required this.quantity,
    required this.timestamp,
    required this.operatorId,
    this.synced = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'material_id': materialId,
      'quantity': quantity,
      'timestamp': timestamp.toIso8601String(),
      'operator_id': operatorId,
      'synced': synced ? 1 : 0,
    };
  }

  factory MaterialUsage.fromMap(Map<String, dynamic> map) {
    return MaterialUsage(
      id: map['id'],
      materialId: map['material_id'],
      quantity: map['quantity'],
      timestamp: DateTime.parse(map['timestamp']),
      operatorId: map['operator_id'],
      synced: map['synced'] == 1,
    );
  }

  MaterialUsage copyWith({
    String? id,
    String? materialId,
    double? quantity,
    DateTime? timestamp,
    String? operatorId,
    bool? synced,
  }) {
    return MaterialUsage(
      id: id ?? this.id,
      materialId: materialId ?? this.materialId,
      quantity: quantity ?? this.quantity,
      timestamp: timestamp ?? this.timestamp,
      operatorId: operatorId ?? this.operatorId,
      synced: synced ?? this.synced,
    );
  }
} 