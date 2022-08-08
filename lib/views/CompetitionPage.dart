import 'package:flutter/material.dart';
import 'package:testflutterapi/models/competition.dart';
import 'package:testflutterapi/services/competition_service.dart';
// import 'package:testflutterapi/views/SearchPage.dart';
// import 'package:testflutterapi/views/SecondeRoute.dart';

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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: false,
        title: Text(
          'The Competitions ${widget.competitionId}',
        ),

        //
        //
        //
        //

        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: InkWell(
              onTap: () {
                //Navigator.pop(context);
                print('ok');
              },
              child: const Icon(
                Icons.logout,
                color: Colors.black,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(competition?.Name ?? 'hey'),
        ),
      ),
    );
  }
}
