import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;

class Leaderboard {
  bool iHaveInternet = true;

  List<String> jumpers = [
    'assets/images/jumper3.png',
    'assets/images/jumperGreen.png',
    'assets/images/jumperBlue.png',
    'assets/images/jumperBlack.png',
    'assets/images/gold.png',
    'assets/images/jumperTr1.png',
  ];

  Widget recordsList(int i, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 5,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          Text(
            '${i + 1}. ',
            style: const TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: MediaQuery.of(context).size.width/14),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.95 * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(jumpers[variables.photo[i].toInt()]),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width/10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User: ${variables.users[i]}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Score: ${variables.score[i]}',
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
         // SizedBox(width: 20,),
        ],
      ),
    );
  }

  Widget scoreboardList(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < variables.users.length; i++)
          recordsList(i, context),
      ],
    );
  }

  Widget noInternet() {
    return Container();
  }

  Widget checkConnectionStatus(BuildContext context) {
    if (iHaveInternet) {
      return scoreboardList(context);
    } else {
      return noInternet();
    }
  }

  Widget leaderboard(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: const Color(0xffc9a064),
          border: Border.all(
            width: 5,
            color: Colors.black,
          ),
        ),
        child: ListView(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height * 0.8)/7,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Leaderboard.png'))),
            ),
            for(int i=0;i<variables.users.length;i++)recordsList(i,context),
          ],
        ),
      ),
    );
  }
}
