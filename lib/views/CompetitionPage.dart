import 'package:flutter/material.dart';
import 'package:testflutterapi/models/competition.dart';
import 'package:testflutterapi/services/competition_service.dart';

class CompetitionPage extends StatefulWidget {
  const CompetitionPage({super.key, required this.competitionId});

  final int competitionId;

  @override
  State<CompetitionPage> createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
  Competition? competition;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    competition =
        await CompetitionService().getCompetitionsId(widget.competitionId);
    if (competition != null) {
      setState(() {
        isLoaded = true;
      });
      print(competition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBDBCBD),
        shadowColor: Colors.pink,
        toolbarHeight: 100,
        elevation: 40,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
        title: Text(
          "The Competition ${widget.competitionId} ",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(competition?.Name ?? 'ok'),
        ),
      ),
    );
  }
}
