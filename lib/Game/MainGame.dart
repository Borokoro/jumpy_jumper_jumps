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
import 'package:shared_preferences/shared_preferences.dart';
import 'Grass.dart';
import 'package:jumpy_jumper_jumps/Game/Obstacle.dart';
import 'ScoreCounter.dart';
import 'package:jumpy_jumper_jumps/Highscore/SharedPreferences.dart';
import 'package:flame_audio/bgm.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;
import 'package:jumpy_jumper_jumps/Main_menu/Shop.dart';

class MainGame extends FlameGame with TapDetector, HasCollidables{
  bool hasTapped=false;
  int random=0;
  late final GameScreen gameScreen;
  late PlayerComponent jumper;
  late Obstacle obstacle;
  late final szczebel;
  late final szczebeln;
  var player;
  late final spriteSheet;
  late final grassTexture;
  late Grass grass;
  late TextComponent score;
  late TextComponent money;
  late ScoreCounter scoreCounter;
  static SharedPreferences? preferences;
  final style=TextStyle(color: BasicPalette.white.color,fontSize: 50,fontFamily: 'FascinateInline',fontWeight: FontWeight.bold);
  final style1=TextStyle(color: BasicPalette.white.color,fontSize: 25,fontFamily: 'FascinateInline',fontWeight: FontWeight.bold);
  int? highScore=0;
  bool firstTime=true;
  int scorePoints=0;
  bool pauseColision=true;
  bool isDead=false;
  bool isDown=true;
  double speed=0;
  double screenWidth=0;
  double screenHeight=0;
  double spawner=0;
  double jumperdy=0;
  double platformPositionX=0;
  List<String> jumpers = [
    'jumper3.png',
    'jumperGreen.png',
    'jumperBlue.png',
    'jumperBlack.png',
    'gold.png',
    'jumperTr2.png',
  ];

  Future<void> onLoad() async {
    for(int i=0; i<jumpers.length;i++){
      await images.load(jumpers[i]);
    }
    await images.load('platform.png');
    await images.load('szczebel.png');
    await images.load('scoreCounter.png');
    await images.load('grass.png');
    highScore=await InitializePref.getHighscore();
    screenWidth=size[0];
    screenHeight=size[1];
    SpriteComponent background=SpriteComponent()
      ..sprite=await loadSprite('background2.png')
      ..size=size;
    add(background);
    player=SpriteSheet.fromColumnsAndRows(image: images.fromCache(jumpers[variables.pick]), columns: 1, rows: 1);
    szczebel=SpriteSheet.fromColumnsAndRows(image: images.fromCache('szczebel.png'), columns: 1, rows: 1);
    szczebeln=SpriteSheet.fromColumnsAndRows(image: images.fromCache('scoreCounter.png'), columns: 1, rows: 1);
    grassTexture=SpriteSheet.fromColumnsAndRows(image: images.fromCache('grass.png'), columns: 1, rows: 1);
    spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache('platform.png'), columns: 1, rows: 1);
    score=TextComponent(text: '0', position: Vector2(screenWidth/2,40),textRenderer: TextPaint(style: style),anchor: Anchor.center);
    money=TextComponent(text: '${variables.money}💰', position: Vector2(screenWidth*0.9,40),textRenderer: TextPaint(style: style1),anchor: Anchor.center);
    add(score);
    add(money);
    add(ScreenCollidable());
     LoadAssets();
  return super.onLoad();
  }

@override
  void update(double dt) async{
    if(spawner>screenHeight/1.75){
      random=randomf();
      spawner=0;
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
        size: Vector2(screenWidth-(64*3 + random),9),
        position: Vector2(random + 64*3,9),
      );
      add(obstacle);
    }
    if(isDead){
      FlameAudio.play('death.mp3');
      isDead=false;
      variables.money+=scorePoints~/2;
      money.text="${variables.money.toString()}💰";
      await setMoney();
      pauseEngine();
      if(scorePoints>highScore!.toInt()){
        highScore=scorePoints;
        InitializePref(score: scorePoints).setHighscore();
      }
      overlays.add(GameOverMenu.ID);

    }
    super.update(dt);
  }

  Future setMoney() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setInt("MoneyJumpyJumper911", variables.money);
  }

  @override
  void onTapDown(TapDownInfo info) {
    if(pauseColision==false) {
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
      platformPositionX = info.raw.globalPosition.dx;
    }
    super.onTapDown(info);
  }

  int randomf(){
    int min = 20;
    int max = screenWidth.toInt()-(192+20);
    return min + Random().nextInt(max-min);
  }

  void reset(){
    children.whereType<Platform>().forEach((element) {remove(element);});
    children.whereType<Obstacle>().forEach((element) {remove(element);});
    children.whereType<ScoreCounter>().forEach((element) {remove(element);});
    children.whereType<PlayerComponent>().forEach((element) {remove(element);});

    pauseColision=false;
    speed=0;
    isDown=true;
    platformPositionX=0;
    jumperdy=0;
    firstTime=true;
    scorePoints=0;
    score.text=scorePoints.toString();
    LoadAssets();
  }

  void LoadAssets(){
    grass=Grass(
      sprite: grassTexture.getSpriteById(0),
      size: Vector2(screenWidth,20),
      position: Vector2(0,screenHeight-20),
    );
    add(grass);
    jumper=PlayerComponent(
      sprite: player.getSpriteById(0),
      size: Vector2(64,55),
      position: camera.canvasSize/2,
    );
    jumper.anchor=Anchor.center;
    add(jumper);
    random=randomf();
    obstacle=Obstacle(
      sprite: szczebel.getSpriteById(0),
      size: Vector2(random.toDouble(),9),
      position: Vector2(0,screenHeight/3),
    );
    add(obstacle);
    obstacle=Obstacle(
      sprite: szczebel.getSpriteById(0),
      size: Vector2(screenWidth-(64*3 + random),9),
      position: Vector2(random + 64*3,screenHeight/3),
    );
    add(obstacle);
    scoreCounter=ScoreCounter(
      sprite: szczebeln.getSpriteById(0),
      size: Vector2(64*3-70,9),
      position: Vector2(random.toDouble()+35,screenHeight/3),
    );
    add(scoreCounter);
    spawner=0;
  }

}