import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MainMenu.dart';

class GameOverMenu extends StatelessWidget {
  static const String ID = 'GameOverMenu';
  final MainGame gameRef;

  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
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