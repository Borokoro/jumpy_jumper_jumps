import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/Main_menu/GameOverMenu.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MainMenu.dart';

class MenuHandler extends StatelessWidget {
  MenuHandler({Key? key}) : super(key: key);

  final MainGame _mainGame=MainGame();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,

      body: WillPopScope(
        onWillPop: () async => false,

        child: GameWidget(
          game: _mainGame,
          initialActiveOverlays: const [MainMenu.ID],
          overlayBuilderMap: {
            GameOverMenu.ID: (BuildContext context, MainGame gameRef) =>
                GameOverMenu(
                  gameRef: gameRef,
                ),
            MainMenu.ID: (BuildContext context, MainGame gameRef) =>
                MainMenu(
                  gameRef: gameRef,
                ),
          },
        ),
      ),
    );
  }
}