import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jumpy_jumper_jumps/Main_menu/MenuHandler.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  bool checked = false;
  static SharedPreferences? preferences;

  Future setTutorial() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setInt("TutorialJumpyJumper911", variables.tutorial);
  }

  Widget nothingPlay(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height / 15,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 5,
            ),
          ),
          color: Color(0xffc9a064),
        ),
        child: Align(
          alignment: Alignment.center,
          child: const Text(
            'You are in tutorial',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Swipe me to play',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/swipeUp.gif"))),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height / 8,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 5,
            ),
          ),
          color: Color(0xffc9a064),
        ),
      ),
    ]);
  }

  Widget nothing(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height / 15,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 5,
            ),
          ),
          color: Color(0xffc9a064),
        ),
        child: Align(
          alignment: Alignment.center,
          child: const Text(
            'You are in tutorial',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tutorial',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/swipeUp.gif"))),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height / 8,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 5,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 5,
            ),
          ),
          color: Color(0xffc9a064),
        ),
      ),
    ]);
  }

  Widget tutorialScreen1(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          right: BorderSide(
            color: Colors.black,
            width: 5,
          ),
        ),
        color: Color(0xffc9a064),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'To access the shop swipe left in the main menu',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Total amount of your money is shown on the top of your screen next to 💰',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'If button is red, it means that you dont have enough money',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'If button is dark it means you can buy this skin',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'If there is checkbox next to the skin, it means that you already own this skin',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'The checked skin is the one you are currently using',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Swipe down to quit this page and then right to go to another tutorial page',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget tutorialScreen2(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          right: BorderSide(
            color: Colors.black,
            width: 5,
          ),
        ),
        color: Color(0xffc9a064),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'To access the leaderboard swipe right in the main menu',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You can add your record here after you end your run, by pressing this button:',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/saveScore.png')),
                ),
              ),
            ],
          ),
          //your score if it is good enough (there are only 10 places in the leaderboard) and you have internet connection
          Text(
            'Remember that you can only add your score after finished run. If you leave game over screen, you will no longer be able to publish your score',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Remember that your score will be published only if it is good enough (there are only 10 places in the leaderboard) and your device has internet connection',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'Swipe down to quit this page and then right to go to another tutorial page',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget tutorialScreen3(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          left: BorderSide(
            color: Colors.black,
            width: 5,
          ),
          right: BorderSide(
            color: Colors.black,
            width: 5,
          ),
        ),
        color: Color(0xffc9a064),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'To start your game you have to simply tap the screen in the main menu',
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'If you are in the game over menu you can try again by pressing this button: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/button.png')),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You can also go to the main menu by pressing this button: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 5,
                height: MediaQuery.of(context).size.height / 15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/buttonExit1.png')),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 2.0,
                child: Checkbox(
                  value: checked,
                  onChanged: (bool? value) async {
                    if (value == true) {
                      variables.tutorial = 0;
                    } else {
                      variables.tutorial = 1;
                    }
                    await setTutorial();
                    setState(() {
                      checked = value!;
                    });
                  },
                  checkColor: Colors.white,
                  side: MaterialStateBorderSide.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const BorderSide(color: Colors.white);
                    } else {
                      return const BorderSide(color: Colors.white);
                    }
                  }),
                  fillColor: MaterialStateProperty.all(const Color(0xffc9a064)),
                ),
              ),
              Text(
                'I dont want to see this tutorial again',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MenuHandler()));
            },
            child: Text('Press me and go play'),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget screen1(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/swipeShop.gif"))),
      child: CarouselSlider(
        items: [
          nothing(context),
          tutorialScreen1(context),
        ],
        options: CarouselOptions(
          autoPlay: false,
          reverse: false,
          initialPage: 0,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          scrollDirection: Axis.vertical,
          //height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  Widget screen2(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/swipeLeaderboard.gif"))),
      child: CarouselSlider(
        items: [
          nothing(context),
          tutorialScreen2(context),
        ],
        options: CarouselOptions(
          autoPlay: false,
          reverse: false,
          initialPage: 0,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          scrollDirection: Axis.vertical,
          //height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  Widget screen3(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/gameplay.gif"))),
      child: CarouselSlider(
        items: [
          nothingPlay(context),
          tutorialScreen3(context),
        ],
        options: CarouselOptions(
          autoPlay: false,
          reverse: false,
          initialPage: 0,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          scrollDirection: Axis.vertical,
          //height: MediaQuery.of(context).size.height,
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
          screen1(context),
          screen2(context),
          screen3(context),
        ],
        options: CarouselOptions(
          autoPlay: false,
          reverse: false,
          initialPage: 0,
          enableInfiniteScroll: false,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
