import 'package:flutter/material.dart';
import 'package:testflutterapi/models/competition.dart';
import 'package:testflutterapi/services/competition_service.dart';
import 'package:testflutterapi/views/CompetitionPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Competition>? competitions;
  var isLoaded = false;

  get index => null;

  //var $competitions;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    competitions = await CompetitionService().getCompetitions();
    if (competitions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

//
//
//
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          title: const Text(
            'The Competitions',
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
        // backgroundColor: Colors.white12,

        //
        //
        //
        //

        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: competitions?.length,
              itemBuilder: (context, index) {
                return _competitionCard2(competitions, index, context);
              }),
        ),
      ),
    );
  }
}

Widget _competitionCard2(competitions, index, context) {
  return Container(
    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
    width: double.infinity,
    margin: const EdgeInsets.all(20),
    color: Colors.blueGrey,
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsetsDirectional.fromSTEB(0, 20, 605, 0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 12,
                  ),
                ),
                child: const Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsetsDirectional.fromSTEB(645, 40, 0, 0),
                child: Chip(
                  // padding: const EdgeInsets.all(
                  //   2,
                  // ),
                  label: Text(
                    competitions![index].Status,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Container(
              // margin: EdgeInsetsDirectional.fromSTEB(start, top, end, bottom),
              Row(
                children: [
                  Text(
                    competitions![index].Name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // ),
              Row(
                children: [
                  const Icon(Icons.sports, color: Colors.white),
                  Text(
                    competitions![index].Sport,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_pin, color: Colors.white),
                  Text(
                    competitions![index].Location,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsetsDirectional.fromSTEB(620, 10, 0, 0),
                child: Row(
                  children: [
                    Text(
                      formattedDate(competitions![index].StartDate),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CompetitionPage(
                  competitionId: competitions![index].CompetitionId,
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}
