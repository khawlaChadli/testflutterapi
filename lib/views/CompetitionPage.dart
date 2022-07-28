import 'package:flutter/material.dart';
import 'package:testflutterapi/models/competition.dart';
import 'package:testflutterapi/services/competition_service.dart';
import 'package:testflutterapi/views/SearchPage.dart';
import 'package:testflutterapi/views/SecondeRoute.dart';

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
        shadowColor: const Color.fromARGB(255, 50, 45, 47),
        toolbarHeight: 90,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5),
                bottomLeft: Radius.circular(200))),
        title: const Text(
          'Competition',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 7, spreadRadius: 3, color: Colors.blueGrey)
                ], shape: BoxShape.circle, color: Colors.grey),
                child: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchPage()));
                    // setState(() {
                    //   print('ok');
                    // });
                  },
                  //size: 20,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 7, spreadRadius: 3, color: Colors.blueGrey)
                ], shape: BoxShape.circle, color: Colors.grey),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    /*setState(() {
                      print('ok');
                    });*/
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondeRoute()));
                  },
                  //size: 20,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 7, spreadRadius: 3, color: Colors.blueGrey)
                ], shape: BoxShape.circle, color: Colors.grey),
                child: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    setState(() {
                      print('ok');
                    });
                  },
                  //size: 20,
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          )
        ],
      ),
      body: Center(
        child: Card(
          child: Text(competition?.Name ?? 'ok'),
        ),
        //   child: RaisedButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: Text(competition?.Name ?? 'ok'),
        //   ),
      ),
    );
  }
}
