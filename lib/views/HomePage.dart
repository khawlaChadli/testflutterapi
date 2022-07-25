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
        shadowColor: Colors.pink,
        toolbarHeight: 100,
        elevation: 40,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                bottomLeft: Radius.circular(70))),
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
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      blurRadius: 7, spreadRadius: 3, color: Colors.pinkAccent)
                ], shape: BoxShape.circle, color: Colors.pink.shade400),
                child: IconButton(
                  icon: const Icon(Icons.search),
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
              ),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                ], shape: BoxShape.circle, color: Colors.pink.shade400),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    /*setState(() {
                      print('ok');
                    });*/
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondeRoute()));
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
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                ], shape: BoxShape.circle, color: Colors.pink.shade400),
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
              return _CompetitionTile(competitions, context, index);
            }),
      ),
    );
  }
}

Widget _CompetitionTile(List<Competition>? competitions, context, int index) {
  return ListTile(
    title: Text(
      competitions![index].Name,
    ),
    subtitle: Text(
      competitions[index].Location,
    ),
    trailing: const Icon(Icons.arrow_right),
    onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompetitionPage(
                competitionId: competitions[index].CompetitionId))),
  );
}

Widget _CompetitionCard(List<Competition>? competitions, int index) {
  return Card(
    elevation: 100,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        width: 2,
        color: Color.fromARGB(255, 240, 171, 194),
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    margin: const EdgeInsets.all(40),
    child: Row(
      children: [
        /*Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(5),
                        color: Colors.grey,
                      ),
                    ),*/
        const SizedBox(
          width: 50,
          height: 100,
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Text(competitions![index].CompetitionId.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  )),*/
              Text(competitions![index].Name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  )),
              Text(
                competitions[index].Location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              /*Text(
                competitions[index].StartDate.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),*/
            ],
          ),
        ),
      ],
    ),
  );
}

class SecondeRoute extends StatelessWidget {
  const SecondeRoute({Key? key}) : super(key: key);

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
        title: const Text(
          'Settings',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back to Home !'),
        ),
      ),
    );
  }
}

/*class CompetitionPage extends StatelessWidget {
  const CompetitionPage({Key? key}) : super(key: key);

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
        title: const Text(
          'The Competition',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('ok'),
        ),
      ),
    );
  }
}*/
