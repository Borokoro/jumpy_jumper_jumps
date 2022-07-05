//import 'dart:html';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variable;
import 'package:google_fonts/google_fonts.dart';

class MainMenu extends StatelessWidget {
  static const String ID = 'MainMenu';
  final MainGame gameRef;

  const MainMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FlameAudio.play('cliskSound.wav');
        variable.pauseColision = false;
        gameRef.overlays.remove(MainMenu.ID);
      },
      child: Container(
        width: variable.screenWidth,
        height: variable.screenHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: variable.screenHeight / 3,
                width: variable.screenWidth,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Title.png'))),
              ),
              SizedBox(
                height: variable.screenHeight / 20,
              ),
              Container(
                height: variable.screenHeight / 3,
                width: variable.screenWidth,
                alignment: Alignment.center,
                child: const Text(
                  'TAP TO PLAY',
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
