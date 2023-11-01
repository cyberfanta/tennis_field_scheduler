import 'dart:convert';

ReservedDate reservedDateFromJson(String str) =>
    ReservedDate.fromJson(json.decode(str) as Map<String, dynamic>);

String reservedDateToJson(ReservedDate data) => json.encode(data.toJson());

class ReservedDate {
  final String id;
  final String field;
  final String date;
  final String owner;

  ReservedDate({
    required this.id,
    required this.field,
    required this.date,
    required this.owner,
  });

  String toJson() => json.encode({
        'id': id,
        'field': field,
        'date': date,
        'owner': owner,
      });

  factory ReservedDate.fromJson(Map<String, dynamic> json) {
    return ReservedDate(
      id: json['id'],
      field: json['field'],
      date: json['date'],
      owner: json['owner'],
    );
  }

  factory ReservedDate.empty() {
    return ReservedDate(
      id: "0",
      field: "A",
      date: "2023-10-31",
      owner: "Julio Leon",
    );
  }

  @override
  String toString() {
    return "{"
        "\"id\":\"$id\","
        "\"field\":\"$field\","
        "\"date\":\"$date\","
        "\"owner\":\"$owner\""
        "}";
  }
}
