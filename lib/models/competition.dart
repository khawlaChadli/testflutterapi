import 'dart:convert';

class Competition {
  final int CompetitionId;
  final String Name;
  final String Location;
  final String Status;
  // final String Type;
  final String Sport;

  final int StartDate;

  const Competition({
    required this.CompetitionId,
    required this.Name,
    required this.Location,
    required this.Status,
    // required this.Type,
    required this.Sport,
    required this.StartDate,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      CompetitionId: json['CompetitionId'],
      Name: json['Name'],
      Location: json['Location'],
      Status: json['Status'] ?? '',
      // Type: json['Type'],
      Sport: json['Sport'],

      StartDate: json['StartDate'],
    );
  }

  // String? get title => null;
}
