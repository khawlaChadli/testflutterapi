import 'dart:convert';

class Competition {
  final int CompetitionId;
  final String Name;
  final String Location;
  final int StartDate;

  const Competition({
    required this.CompetitionId,
    required this.Name,
    required this.Location,
    required this.StartDate,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      CompetitionId: json['CompetitionId'],
      Name: json['Name'],
      Location: json['Location'],
      StartDate: json['StartDate'],
    );
  }

  String? get title => null;
}
