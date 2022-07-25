import 'package:flutter/material.dart';

class CompetitionPage extends StatelessWidget {
  const CompetitionPage({super.key, required this.competitionId});

  final int competitionId;

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
          "The Competition $competitionId ",
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
}
