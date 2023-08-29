import 'package:carousel_slider/carousel_slider.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'Leaderboard.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;
import 'Shop.dart';

class MainMenu extends StatefulWidget {
  final MainGame gameRef;
  static const String ID = 'MainMenu';
  MainMenu({required this.gameRef,});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  static const String ID = 'MainMenu';
  late MainGame gameRef;
  late Shop _shop;
  final Leaderboard _leaderboard=Leaderboard();

  @override
  void initState() {
    _shop=Shop(update: _update);
    executeFunctions();
    gameRef=widget.gameRef;
    super.initState();
  }

  Future<void> executeFunctions() async{
  }

  void _update(int something){
    setState(() {
      gameRef.player=SpriteSheet.fromColumnsAndRows(image: gameRef.images.fromCache(gameRef.jumpers[variables.pick]), columns: 1, rows: 1);
      gameRef.reset();
    });
  }

  Widget menu(BuildContext context){
    return Container(
      width:  MediaQuery.of(context).size.width,
      height:  MediaQuery.of(context).size.height,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FlameAudio.play('cliskSound.wav');
          gameRef.pauseColision = false;
          gameRef.overlays.remove(MainMenu.ID);
        },
        child: Container(
          width:  MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height:  MediaQuery.of(context).size.height / 3,
                  width:  MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Title.png'))),
                ),
                SizedBox(
                  height:  MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  height:  MediaQuery.of(context).size.height / 3,
                  width:  MediaQuery.of(context).size.width,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CarouselSlider(
        items: [
          _shop.shop(context),
          menu(context),
          _leaderboard.leaderboard(context),
        ],
        options: CarouselOptions(
          autoPlay: false,
          reverse: false,
          initialPage: 1,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

