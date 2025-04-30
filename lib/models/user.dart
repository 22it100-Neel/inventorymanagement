class User {
  final String id;

  final String email;

  final String password;

  final String name;

  final String role; // 'admin' or 'operator'

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'name': name,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
      name: map['name'],
      role: map['role'],
    );
  }

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? name,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      role: role ?? this.role,
    );
  }
} 