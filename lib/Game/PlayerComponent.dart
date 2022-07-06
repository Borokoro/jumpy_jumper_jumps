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

class PlayerComponent extends SpriteComponent
    with HasGameRef<MainGame>, HasHitboxes, Collidable{
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
    gameRef.jumperdy = position[1];
    if (licznik > 100) licznik = 6;
    licznik++;
    if (gameRef.speed <= 0) {
      //gameRef.speed=0;
      gameRef.isDown = true;
      moveDirection = Vector2(0, 1);
      dontLoop=true;
    }
    if (gameRef.isDown) {
      gameRef.speed += 8;
      position += moveDirection.normalized() * gameRef.speed * 0.016;
    } else {
      if (gameRef.jumperdy > gameRef.screenHeight / 2) {
        position += moveDirection.normalized() * gameRef.speed * 0.016;
      } else if(gameRef.firstTime==false){
         position += Vector2((x*0.5) * gameRef.speed * 0.016, 0);
        gameRef.spawner += gameRef.speed * 0.016;
      }
      else{
        position += moveDirection.normalized() * gameRef.speed * 0.016;
      }
      gameRef.speed -= 8;
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (other is Platform) {
      gameRef.firstTime=false;
      gameRef.speed = 700;
      x = (position.x - gameRef.platformPositionX) * 0.06;
      y = -1;
      moveDirection = Vector2(x, y);
      gameRef.isDown = false;
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
      } else if(gameRef.firstTime){
        if (dontLoop) {
          dontLoop=false;
          FlameAudio.play('jumping.mp3');
        }
        gameRef.speed = 550;
        y = -1;
      }
      else{
        gameRef.pauseColision=true;
        gameRef.isDead=true;
      }
      moveDirection = Vector2(x, y);
      gameRef.isDown = false;
    }
  }
}
