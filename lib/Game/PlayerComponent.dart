import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flame/assets.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'dart:ui';
import 'dart:math' as math;
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/painting.dart';
import 'package:jumpy_jumper_jumps/Game/Obstacle.dart';
import 'dart:async';
import 'Platform.dart';
import 'ScoreCounter.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;

class PlayerComponent extends SpriteComponent
    with HasGameRef, HasHitboxes, Collidable{
  Vector2 moveDirection =
      Vector2(0, 1); //dodatnia pierwsza prawo, dodatnia druga dol
  double x = 0, y = 1;
  int licznik = 6;
  bool dontLoop=true;
  PlayerComponent({
    Vector2? position,
    Vector2? size,
    Sprite? sprite,
  }) : super(position: position, sprite: sprite, size: size);

  @override
  void onMount() {
    super.onMount();
    final shape = HitboxRectangle(relation: Vector2(0.55,1));
    addHitbox(shape);
  }

  @override
  void update(double dt) {
    variables.jumperdy = position[1];
    if (licznik > 100) licznik = 6;
    licznik++;
    if (variables.speed <= 0) {
      //variables.speed=0;
      variables.isDown = true;
      moveDirection = Vector2(0, 1);
      dontLoop=true;
    }
    if (variables.isDown) {
      variables.speed += 8;
      position += moveDirection.normalized() * variables.speed * 0.016;
    } else {
      if (variables.jumperdy > variables.screenHeight / 2) {
        position += moveDirection.normalized() * variables.speed * 0.016;
      } else if(variables.firstTime==false){
         position += Vector2((x*0.5) * variables.speed * 0.016, 0);
        variables.spawner += variables.speed * 0.016;
      }
      else{
        position += moveDirection.normalized() * variables.speed * 0.016;
      }
      variables.speed -= 8;
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is Platform) {
      variables.firstTime=false;
      variables.speed = 700;
      x = (position.x - variables.platformPositionX) * 0.06;
      y = -1;
      moveDirection = Vector2(x, y);
      variables.isDown = false;
      other.removeFromParent();
    } else if (other is ScreenCollidable) {
      final firstPoint = intersectionPoints.first;
      final screenPoint = gameRef.viewportProjector;
      final screenSize = gameRef.size;
      if (screenPoint.projectVector(firstPoint).x == 0 ||
          screenPoint.projectVector(firstPoint).x == screenSize.x) {
        if (licznik > 5) {
          FlameAudio.play('bounceWall.mp3');
          licznik = 0;
          x = -x;
        }
      } else if(variables.firstTime){
        if (dontLoop) {
          dontLoop=false;
          FlameAudio.play('jumping.mp3');
        }
        variables.speed = 550;
        y = -1;
      }
      else{
        FlameAudio.play('death.mp3');
        variables.pauseColision=true;
        variables.isDead=true;
      }
      moveDirection = Vector2(x, y);
      variables.isDown = false;
    }
  }
}
