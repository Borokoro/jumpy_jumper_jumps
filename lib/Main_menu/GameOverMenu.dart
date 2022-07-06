import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MainMenu.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variable;

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
            height: variable.screenHeight / 8,
            width: variable.screenWidth / 2,
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
                          'Score: ${variable.score}',
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
                        child: Text(
                          'Highscore: ${variable.highScore}',
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
                        width: variable.screenWidth/3,
                        height: variable.screenHeight/12,
                            child: const Text(
                                'Come on you can do better give it another try',
                                style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                      ),
                    ),
                  ],
                ),
                //SizedBox(
               //   width: variable.screenWidth / 5,
               // ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Container(
                        height: variable.screenHeight / 8,
                        width: variable.screenWidth/6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: variable.score >= 10 && variable.score < 30
                                    ? const AssetImage('assets/images/brown.png')
                                    : variable.score >= 30 && variable.score < 50
                                        ? const AssetImage(
                                            'assets/images/silver.png')
                                        : variable.score >= 50
                                            ? const AssetImage(
                                                'assets/images/gold.png')
                                            : const AssetImage(
                                                'assets/images/nothing.png'))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Container(
                          height: variable.screenHeight / 10,
                          width: variable.screenWidth / 4,
                          child: variable.score >= 10 && variable.score < 30
                              ? Column(
                                  children: const [
                                     Text('YOU GOT BRONZE...', textAlign: TextAlign.center,),
                                    SizedBox(height: 4),
                                     Text('Not bad at all', textAlign: TextAlign.center,),
                                  ],
                                )
                              : variable.score >= 30 && variable.score < 50
                                  ? Column(
                                      children: const [
                                        Text('WOW SILVER TROPHY', textAlign: TextAlign.center,),
                                        SizedBox(height: 4),
                                        Text('You are so good', textAlign: TextAlign.center,),
                                      ],
                                    )
                                  : variable.score >= 50
                                      ? Column(
                                          children: const [
                                            Text('GOLDEN TROPHY?!?!', textAlign: TextAlign.center,),
                                            SizedBox(height: 4),
                                            Text('you are insane', textAlign: TextAlign.center,),
                                          ],
                                        )
                                      : Column(
                                          children: const [
                                            Text('NO TROPHY THIS TIME', textAlign: TextAlign.center,),
                                            SizedBox(height: 4),
                                            Text('Keep trying and you will get one', textAlign: TextAlign.center,),
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
          GestureDetector(
            onTap: () {
              gameRef.overlays.remove(GameOverMenu.ID);
              gameRef.reset();
              gameRef.resumeEngine();
            },
            child: Container(
              width: variable.screenWidth/3,
              height: variable.screenHeight/8,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/button.png')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* // Restart button.
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              onPressed: () {
                gameRef.overlays.remove(GameOverMenu.ID);
                gameRef.reset();
                gameRef.resumeEngine();
              },
              child: const Text('Restart'),
            ),
          ),
 */

/*
variable.score >= 10 && variable.score < 30
                              ? const AssetImage('assets/images/brown.png')
                              : variable.score >= 30 && variable.score < 50
                                  ? const AssetImage(
                                      'assets/images/silver.png')
                                  : variable.score >= 50
                                      ? const AssetImage(
                                          'assets/images/gold.png')
                                      : const AssetImage(
                                          'assets/images/nothing.png')
 */
