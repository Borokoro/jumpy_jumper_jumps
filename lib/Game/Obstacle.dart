import 'package:flutter/material.dart';
import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:jumpy_jumper_jumps/Game/PlayerComponent.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

import 'package:jumpy_jumper_jumps/variables.dart' as variable;

class Obstacle extends SpriteComponent with HasHitboxes, Collidable{
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
    if(variable.jumperdy<=variable.screenHeight/2 && variable.isDown==false){
      position+=moveDirection.normalized() * variable.speed*0.016;
    }
    if(position[1]>=variable.screenHeight) removeFromParent();
    super.update(dt);
  }

@override
void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
  if(other is PlayerComponent && variable.pauseColision==false){
    print('dead');
    variable.pauseColision=true;
    variable.isDead=true;
  }
  }
}