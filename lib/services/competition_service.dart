import 'package:testflutterapi/models/competition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CompetitionService {
  Future<List<Competition>?> getCompetitions() async {
    var client = http.Client();

    var uri = Uri.parse('https://api-d.racegorilla.com/competition');
    var response = await client.get(uri);

    final responseJson = json.decode(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = responseJson['Data'];
      //print(jsonResponse.length);
      return jsonResponse
          .map((competition) => Competition.fromJson(competition))
          .toList();
    }
  }
}
