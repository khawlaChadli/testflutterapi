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
      body: Row(children: [
        Expanded(
          child: Column(children: [
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 605, 0),
              child: Text(competition?.Name ?? 'hey'),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 605, 0),
              child: Text(competition?.Location ?? 'hey'),
            ),
            // Container(
            //   margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 605, 0),
            //   child: Text(competition?.Status ?? 'hey'),
            // ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 605, 0),
              child: Text(competition?.Sport ?? 'hey'),
            ),
            Container(
              margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 605, 0),
              child: Text(formattedDate(competition?.StartDate)),
            ),
          ]),
        ),
      ]),
    );
  }
}
