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

class Obstacle extends SpriteComponent with HasHitboxes, Collidable, HasGameRef<MainGame>{
  Vector2 moveDirection=Vector2(0,1);
  Obstacle({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }): super(position: position,sprite: sprite,size: size);

@override
void onMount() {
  final shape=HitboxRectangle();
  addHitbox(shape);
  super.onMount();
  }

  @override
  void update(double dt) {
    if(gameRef.jumperdy<=gameRef.screenHeight/2 && gameRef.isDown==false && gameRef.firstTime==false){
      position+=moveDirection.normalized() * gameRef.speed*0.016;
    }
    if(position[1]>=gameRef.screenHeight) removeFromParent();
    super.update(dt);
  }

@override
void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
  if(other is PlayerComponent && gameRef.pauseColision==false){
    gameRef.pauseColision=true;
    gameRef.isDead=true;
  }
  }
}