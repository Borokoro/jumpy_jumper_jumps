
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variable;
class InitializePref{
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
  static Future setHighscore() async{
    preferences=await SharedPreferences.getInstance();
    preferences!.setInt("HighscoreJumpyJumper911", variable.score);
  }
}