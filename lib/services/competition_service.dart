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

  Future<Competition?> getCompetitionsId(competitionId) async {
    final jsonResponse;
    print(competitionId);
    var client = http.Client();
    var uri =
        Uri.parse('https://api-d.racegorilla.com/competition/$competitionId');
    var response = await client.get(uri);
    // //var response = await http.get(
    // //Uri.https('https://api-d.racegorilla.com/competition/', competitionId));
    print(response);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      jsonResponse = jsonData['Data'];
      //print(jsonResponse);
      return Competition.fromJson(jsonResponse);
    }
    // print(jsonResponse.length);
    //return jsonResponse.map((competitionId) => Competition.fromJson(competitionId)).toList();
    //return null;
  }

  //}
}
