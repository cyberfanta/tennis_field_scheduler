import 'dart:convert';

class ReservedDate {
  final String id;
  final String field;
  final String date;

  ReservedDate({
    required this.id,
    required this.field,
    required this.date,
  });

  String toJson() => json.encode({
        'id': id,
        'field': field,
        'date': date,
      });

  static ReservedDate fromJson(String str) {
    final data = json.decode(str);
    return ReservedDate(
      id: data['id'],
      field: data['field'],
      date: data['date'],
    );
  }
}
