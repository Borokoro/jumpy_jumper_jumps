import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:jumpy_jumper_jumps/Main_menu/GameOverMenu.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MenuHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/Game/Obstacle.dart';
import 'package:jumpy_jumper_jumps/Game/PlayerComponent.dart';
import 'package:jumpy_jumper_jumps/Game/GameScreen.dart';
import 'package:jumpy_jumper_jumps/Game/Platform.dart';
import 'package:jumpy_jumper_jumps/Game/Obstacle.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variable;
import 'ScoreCounter.dart';
import 'package:jumpy_jumper_jumps/Highscore/SharedPreferences.dart';
import 'package:flame_audio/bgm.dart';

class MainGame extends FlameGame with TapDetector, HasCollidables{
  bool hasTapped=false;
  int random=0;
  late final GameScreen gameScreen;
  late PlayerComponent jumper;
  late Obstacle obstacle;
  late final szczebel;
  late final szczebeln;
  late final player;
  late final spriteSheet;
  late TextComponent score;
  late ScoreCounter scoreCounter;
  final style=TextStyle(color: BasicPalette.white.color,fontSize: 50,fontFamily: 'FascinateInline',fontWeight: FontWeight.bold);


  Future<void> onLoad() async {
    await images.load('jumper3.png');
    await images.load('platform.png');
    await images.load('szczebel.png');
    await images.load('scoreCounter.png');
    variable.screenWidth=size[0];
    variable.screenHeight=size[1];
    SpriteComponent background=SpriteComponent()
      ..sprite=await loadSprite('background2.png')
      ..size=size;
    add(background);
    player=SpriteSheet.fromColumnsAndRows(image: images.fromCache('jumper3.png'), columns: 1, rows: 1);
    szczebel=SpriteSheet.fromColumnsAndRows(image: images.fromCache('szczebel.png'), columns: 1, rows: 1);
    szczebeln=SpriteSheet.fromColumnsAndRows(image: images.fromCache('scoreCounter.png'), columns: 1, rows: 1);
    spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache('platform.png'), columns: 1, rows: 1);
     LoadAssets();
  return super.onLoad();
  }

@override
  void update(double dt) {
    if(variable.spawner>variable.screenHeight/2){
      random=randomf();
      print(random);
      variable.spawner=0;
      obstacle=Obstacle(
        sprite: szczebel.getSpriteById(0),
        size: Vector2(random.toDouble(),9),
        position: Vector2(0,9),
      );
      add(obstacle);
      scoreCounter=ScoreCounter(
        sprite: szczebeln.getSpriteById(0),
        size: Vector2(64*3-70,9),
        position: Vector2(random.toDouble()+35,9),
      );
      add(scoreCounter);
      obstacle=Obstacle(
        sprite: szczebel.getSpriteById(0),
        size: Vector2(variable.screenWidth-(64*3 + random),9),
        position: Vector2(random + 64*3,9),
      );
      add(obstacle);
    }
    score.text=variable.score.toString();
    if(variable.isDead){
      FlameAudio.play('death.mp3');
      variable.isDead=false;
      this.pauseEngine();
      if(variable.score>variable.highScore!.toInt()){
        variable.highScore=variable.score;
        InitializePref.setHighscore();
      }
      this.overlays.add(GameOverMenu.ID);

    }
    super.update(dt);
  }
  @override
  void onTapDown(TapDownInfo info) {
    if(variable.pauseColision==false) {
      children.whereType<Platform>().forEach((element) {
        remove(element);
      });
      Platform platform = Platform(
        sprite: spriteSheet.getSpriteById(0),
        size: Vector2(50, 20),
        position: Vector2(
            info.raw.globalPosition.dx, info.raw.globalPosition.dy),
      );
      platform.anchor = Anchor.center;
      add(platform);
      variable.platformPositionX = info.raw.globalPosition.dx;
      print("${info.raw.globalPosition.dx}, ${info.raw.globalPosition.dy}");
    }
    super.onTapDown(info);
  }

  int randomf(){
    int min = 20;
    int max = variable.screenWidth.toInt()-(192+20);
    return min + Random().nextInt(max-min);
  }

  void reset(){
    children.whereType<Platform>().forEach((element) {remove(element);});
    children.whereType<Obstacle>().forEach((element) {remove(element);});
    children.whereType<ScoreCounter>().forEach((element) {remove(element);});
    children.whereType<PlayerComponent>().forEach((element) {remove(element);});
    remove(score);

    variable.pauseColision=false;
    variable.speed=0;
    variable.isDown=true;
    variable.platformPositionX=0;
    variable.jumperdy=0;
    variable.firstTime=true;
    LoadAssets();
  }

  void LoadAssets(){

    jumper=PlayerComponent(
      sprite: player.getSpriteById(0),
      size: Vector2(variable.screenWidth/6,variable.screenHeight/12),
      position: camera.canvasSize/2,
    );
    jumper.anchor=Anchor.center;
    add(ScreenCollidable());
    add(jumper);
    random=randomf();
    obstacle=Obstacle(
      sprite: szczebel.getSpriteById(0),
      size: Vector2(random.toDouble(),9),
      position: Vector2(0,variable.screenHeight/3),
    );
    add(obstacle);
    obstacle=Obstacle(
      sprite: szczebel.getSpriteById(0),
      size: Vector2(variable.screenWidth-(64*3 + random),9),
      position: Vector2(random + 64*3,variable.screenHeight/3),
    );
    add(obstacle);
    scoreCounter=ScoreCounter(
      sprite: szczebeln.getSpriteById(0),
      size: Vector2(64*3-70,9),
      position: Vector2(random.toDouble()+35,variable.screenHeight/3),
    );
    add(scoreCounter);
    variable.spawner=variable.screenHeight/8;
    variable.score=0;
    score=TextComponent(text: '0', position: Vector2(variable.screenWidth/2,40),textRenderer: TextPaint(style: style),anchor: Anchor.center);
    add(score);
  }

}