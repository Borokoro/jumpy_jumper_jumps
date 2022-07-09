import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumpy_jumper_jumps/Game/GameScreen.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:flame/flame.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MenuHandler.dart';
import 'Highscore/SharedPreferences.dart';
//const pauseMenu = 'PauseMenu';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const MenuHandler(),
    ),
  );
}