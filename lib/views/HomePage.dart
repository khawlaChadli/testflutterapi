import 'package:flutter/material.dart';
import 'package:testflutterapi/models/competition.dart';
import 'package:testflutterapi/services/competition_service.dart';
import 'package:testflutterapi/views/CompetitionPage.dart';
import 'package:testflutterapi/views/SearchPage.dart';
import 'package:testflutterapi/views/SecondeRoute.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Competition>? competitions;
  var isLoaded = false;

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
          'The List of Competitions',
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
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: competitions?.length,
            itemBuilder: (context, index) {
              return _CompetitionCard(competitions, context, index);
            }),
      ),
    );
  }
}

// Widget _CompetitionTile(List<Competition>? competitions, context, int index) {
//   return ListTile(
//     title: Text(
//       competitions![index].Name,
//     ),
//     subtitle: Text(
//       competitions[index].Location,
//     ),
//     trailing: const Icon(Icons.arrow_right),
//     onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => CompetitionPage(
//                 competitionId: competitions[index].CompetitionId))),
//   );
// }

Widget _CompetitionCard(List<Competition>? competitions, context, int index) {
  return Card(
      elevation: 10.0,
      child: Column(
        children: [
          ListTile(
              title: Row(children: [
                const Icon(Icons.sports),
                Text(
                  competitions![index].Name,
                ),
              ]),
              subtitle: Row(children: [
                const Icon(Icons.location_on_outlined),
                Text(
                  competitions[index].Location,
                ),
              ])
              /*trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => CompetitionPage(
                        competitionId: competitions[index].CompetitionId)))),*/
              ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              competitions[index].Name,
            ),
          ),
          ButtonBar(
            children: [
              /*TextButton(
                child: const Text('CONTACT AGENT'),
                onPressed: () {/* ... */},
              ),*/
              TextButton(
                child: const Text('LEARN MORE'),
                onPressed: () {
                  /*setState(() {
                      print('ok');
                    });*/
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompetitionPage(
                                competitionId:
                                    competitions[index].CompetitionId,
                              )));
                },
              )
            ],
          )
        ],
      ));
}
