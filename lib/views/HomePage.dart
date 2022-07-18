import 'package:flutter/material.dart';
import 'package:testflutterapi/models/competition.dart';
import 'package:testflutterapi/services/competition_service.dart';

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
        title: const Text('Competitions'),
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
            itemCount: competitions?.length,
            itemBuilder: (context, index) {
              return Container(
                child: Text('$competitions'),
              );
            }),
      ),
    );
  }
}
