import 'package:shared_preferences/shared_preferences.dart';

class InitializePref{
  int score=0;
  InitializePref({required this.score});
  static SharedPreferences? preferences;
  static Future<int?> getHighscore() async{
    preferences=await SharedPreferences.getInstance();
    if(preferences!.containsKey("HighscoreJumpyJumper911")){
      return preferences!.getInt("HighscoreJumpyJumper911");
    }
    else {
      return 0;
    }
  }
   Future setHighscore() async{
    preferences=await SharedPreferences.getInstance();
    preferences!.setInt("HighscoreJumpyJumper911", score);
  }
}