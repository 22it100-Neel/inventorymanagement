class Material {
  final String id;
  final String name;
  final double unitCost;
  final double stock;
  final String unitType;
  final String? barcode;

  Material({
    required this.id,
    required this.name,
    required this.unitCost,
    required this.stock,
    required this.unitType,
    this.barcode,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'unit_cost': unitCost,
      'stock': stock,
      'unit_type': unitType,
      'barcode': barcode,
    };
  }

  factory Material.fromMap(Map<String, dynamic> map) {
    return Material(
      id: map['id'],
      name: map['name'],
      unitCost: map['unit_cost'],
      stock: map['stock'],
      unitType: map['unit_type'],
      barcode: map['barcode'],
    );
  }

  Material copyWith({
    String? id,
    String? name,
    double? unitCost,
    double? stock,
    String? unitType,
    String? barcode,
  }) {
    return Material(
      id: id ?? this.id,
      name: name ?? this.name,
      unitCost: unitCost ?? this.unitCost,
      stock: stock ?? this.stock,
      unitType: unitType ?? this.unitType,
      barcode: barcode ?? this.barcode,
    );
  }
} 