import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jumpy_jumper_jumps/Main_menu/GameOverMenu.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;
import 'package:jumpy_jumper_jumps/Firebase/myFirebase.dart';


class Popup extends StatefulWidget {
  final score;
  Popup({required this.score});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  final myController=TextEditingController();
  final MyFirebase _fb=MyFirebase();
  int place=0;
  int pom=0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter your name'),
      contentPadding: const EdgeInsets.all(20.0),
      content: Builder(
        builder: (context){
          var height =MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;
          return Container(
            width: width/3,
            height: height/3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: myController,
                ),
                ElevatedButton(
                    onPressed: () async{
                      if(myController.text.length>10){
                        Fluttertoast.showToast(
                            msg: "Nick must be shortet than 10 letters",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      else{
                        for(int i=0;i<variables.score.length;i++){
                          if(variables.score[i]<widget.score){
                            place=i;
                            break;
                          }
                        }
                        variables.score.insert(place, widget.score);
                        variables.users.insert(place, myController.text);
                        variables.photo.insert(place, variables.pick);
                        variables.score.removeLast();
                        variables.users.removeLast();
                        variables.photo.removeLast();
                        await _fb.setData(variables.users, variables.photo, variables.score);
                        GameOverMenu.alreadyAdded=true;
                        Fluttertoast.showToast(
                            msg: "Score added!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      Navigator.of(context).pop();
                    },
                  child: Text('Save'),
                    ),
              ],
            ),
          );
        },
      ),
    );
  }
}
