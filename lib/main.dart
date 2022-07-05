import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumpy_jumper_jumps/Game/GameScreen.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:flame/flame.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MenuHandler.dart';
import 'Highscore/SharedPreferences.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variable;
//const pauseMenu = 'PauseMenu';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  variable.highScore=await InitializePref.getHighscore();
  print("Raz Dwa Trzy: ${variable.highScore}");
  runApp(
    MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const MenuHandler(),
    ),
  );
}


/*TO DO
1.Dzwiek dla zdobycia punktu
2.MOzesz dodac muzyke w tle jak ci sie chce
3.Zrobic menu gameover
4.Naprawic wzor odbijania sie, mozesz przy okazji dodac jakis fajny dzwiek dla odbijania sie od scian
5.Zlozyc CV :)
 */
