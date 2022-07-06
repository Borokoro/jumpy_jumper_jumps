import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:jumpy_jumper_jumps/Game/PlayerComponent.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

class Grass extends SpriteComponent with  HasGameRef<MainGame> {
  Grass({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(position: position, sprite: sprite, size: size);


  @override
  void update(double dt) {
    if(gameRef.firstTime==false){
      removeFromParent();
    }
  }
}
