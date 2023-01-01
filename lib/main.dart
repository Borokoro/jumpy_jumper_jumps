import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jumpy_jumper_jumps/Game/GameScreen.dart';
import 'package:jumpy_jumper_jumps/Game/MainGame.dart';
import 'package:flame/flame.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MenuHandler.dart';
import 'package:jumpy_jumper_jumps/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;
import 'Highscore/SharedPreferences.dart';
import 'Main_menu/Shop.dart';
import 'package:jumpy_jumper_jumps/Firebase/myFirebase.dart';
import 'package:jumpy_jumper_jumps/Tutorial/tutorial.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getMoney();
  await getShop();
  await getPick();
  await getLeaderboard();
  await getTutorial();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: variables.tutorial == 0 ? MenuHandler() : Tutorial()),
      builder: (context, child){
        return MediaQuery(
            child: child!,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
    ),
  );
}

Future<void> getMoney() async{
  SharedPreferences? preferences;
  preferences=await SharedPreferences.getInstance();
  if(preferences!.containsKey("MoneyJumpyJumper911")){
    variables.money=preferences!.getInt("MoneyJumpyJumper911")!;
  }
  else {
    variables.money=0;
  }
}

Future<void> getShop() async {
  SharedPreferences? preferences;
  preferences = await SharedPreferences.getInstance();
  if (preferences!.containsKey("ShopJumpyJumper911")) {
    variables.shopList = preferences!.getStringList("ShopJumpyJumper911")!;
  } else {
    variables.shopList.add('true');
    for (int i = 0; i < 5; i++) {
      variables.shopList.add('false');
    }
  }
}

Future<void> getPick() async {
  SharedPreferences? preferences;
  preferences = await SharedPreferences.getInstance();
  if (preferences!.containsKey("PickJumpyJumper911")) {
    variables.pick = preferences!.getInt("PickJumpyJumper911")!;
  } else {
    variables.pick=0;
  }
}

Future<void> getTutorial() async {
  SharedPreferences? preferences;
  preferences = await SharedPreferences.getInstance();
  if (preferences!.containsKey("TutorialJumpyJumper911")) {
    variables.tutorial = preferences!.getInt("TutorialJumpyJumper911")!;
  } else {
    variables.tutorial=1;
  }
}

Future<void> getLeaderboard() async {
  MyFirebase myFirebase=MyFirebase();
  variables.photo=await myFirebase.getPhotos();
  variables.score=await myFirebase.getScore();
  variables.users=await myFirebase.getUser();
}