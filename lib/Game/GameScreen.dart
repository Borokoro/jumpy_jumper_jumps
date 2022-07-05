import 'package:flutter/material.dart';
import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';


class GameScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: MainGame());
  }

}
