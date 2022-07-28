import 'package:flutter/material.dart';
import 'package:testflutterapi/views/HomePage.dart';
import 'package:testflutterapi/views/SearchPage.dart';

class SecondeRoute extends StatefulWidget {
  const SecondeRoute({Key? key}) : super(key: key);

  @override
  State<SecondeRoute> createState() => _SecondeRouteState();
}

class _SecondeRouteState extends State<SecondeRoute> {
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
          'Settings',
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
                            builder: (context) => const HomePage()));
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
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text('Back to Home !'),
      //   ),
      // ),
    );
  }
}
