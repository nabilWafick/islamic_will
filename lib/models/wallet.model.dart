// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Wallet {
  num? balance;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;

  Wallet({
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  Wallet copyWith({
    num? balance,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? id,
  }) {
    return Wallet(
      balance: balance ?? this.balance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'balance': balance,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'id': id,
    };
  }

  factory Wallet.fromMap(Map<String, dynamic> map) {
    return Wallet(
      balance: map['balance'] != null ? map['balance'] as num : null,
      createdAt: map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallet.fromJson(String source) =>
      Wallet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Wallet(balance: $balance, createdAt: $createdAt, updatedAt: $updatedAt, id: $id)';
  }

  @override
  bool operator ==(covariant Wallet other) {
    if (identical(this, other)) return true;

    return other.balance == balance &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.id == id;
  }

  @override
  int get hashCode {
    return balance.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ id.hashCode;
  }
}
