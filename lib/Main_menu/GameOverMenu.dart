import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MainMenu.dart';

class GameOverMenu extends StatelessWidget {
  static const String ID = 'GameOverMenu';
  final MainGame gameRef;

  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/GameOver.png'))),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: const Color(0xffc9a064),
              border: Border.all(
                width: 5,
                color: Colors.black,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //SizedBox(
                //  width: MediaQuery.of(context).size.width * 0.001,
              //  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                      child: Container(
                        child: Text(
                          'Score: ${gameRef.scorePoints}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15,15, 0, 0),
                      child: Container(
                        width: (MediaQuery.of(context).size.width * 0.85)/2,
                        child: Text(
                          'Highscore: ${gameRef.highScore}',
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/12,
                            child: const Text(
                                'Come on you can do better give it another try',
                                style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                      ),
                    ),
                  ],
                ),
                //SizedBox(
               //   width: MediaQuery.of(context).size.width / 5,
               // ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 8,
                        width: MediaQuery.of(context).size.width/6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: gameRef.scorePoints >= 10 && gameRef.scorePoints < 30
                                    ? const AssetImage('assets/images/brown.png')
                                    : gameRef.scorePoints >= 30 && gameRef.scorePoints < 50
                                        ? const AssetImage(
                                            'assets/images/silver.png')
                                        : gameRef.scorePoints >= 50
                                            ? const AssetImage(
                                                'assets/images/gold.png')
                                            : const AssetImage(
                                                'assets/images/nothing.png'))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width / 4,
                          child: gameRef.scorePoints >= 10 && gameRef.scorePoints < 30
                              ? Column(
                                  children: const [
                                     Text('YOU GOT BRONZE...', textAlign: TextAlign.center,),
                                    SizedBox(height: 4),
                                     Text('Not bad at all', textAlign: TextAlign.center,),
                                  ],
                                )
                              : gameRef.scorePoints >= 30 && gameRef.scorePoints < 50
                                  ? Column(
                                      children: const [
                                        Text('WOW SILVER TROPHY', textAlign: TextAlign.center,),
                                        SizedBox(height: 4),
                                        Text('You are so good', textAlign: TextAlign.center,),
                                      ],
                                    )
                                  : gameRef.scorePoints >= 50
                                      ? Column(
                                          children: const [
                                            Text('GOLDEN TROPHY?!?!', textAlign: TextAlign.center,),
                                            SizedBox(height: 4),
                                            Text('you are pro', textAlign: TextAlign.center,),
                                          ],
                                        )
                                      : Column(
                                          children: const [
                                            Text('NO TROPHY THIS TIME', textAlign: TextAlign.center,),
                                            SizedBox(height: 4),
                                            //Text('Keep trying and you will get one', textAlign: TextAlign.center,),
                                          ],
                                        )),
                    ),
                  ],
                ),
             //   SizedBox(
             //     width: MediaQuery.of(context).size.width * 0.001,
               // ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  gameRef.overlays.remove(GameOverMenu.ID);
                  gameRef.reset();
                  gameRef.resumeEngine();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/button.png')),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.15,
              ),
              GestureDetector(
                onTap: () {
                  //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  exit(0);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/buttonExit1.png')),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}