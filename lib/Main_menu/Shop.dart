import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jumpy_jumper_jumps/variables.dart' as variables;

class Shop {
  final ValueChanged<int> update;
  Shop({required this.update});
  static SharedPreferences? preferences;
  List<String> jumpers = [
    'assets/images/jumper3.png',
    'assets/images/jumperGreen.png',
    'assets/images/jumperBlue.png',
    'assets/images/jumperBlack.png',
    'assets/images/gold.png',
    'assets/images/jumperTr1.png',
  ];

  List<int> price = [
    0,
    80,
    100,
    120,
    500,
    1000,
  ];

  List<String> name = [
    'standard',
    'green',
    'blue',
    'black',
    'golden',
    'transparent'
  ];

  Future setShop() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setStringList("ShopJumpyJumper911", variables.shopList);
  }

  Future setMoney() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setInt("MoneyJumpyJumper911", variables.money);
  }

  Future setPick() async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setInt("PickJumpyJumper911", variables.pick);
  }

  Widget gotItemAndPicked(BuildContext context) {
    bool checked = true;
    return Transform.scale(
      scale: 2.0,
      child: Checkbox(
        value: checked,
        onChanged: (bool? value) {},
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
    );
  }

  Widget gotItemAndNotPicked(int i) {
    bool checked = false;
    return Transform.scale(
      scale: 2.0,
      child: Checkbox(
        value: checked,
        onChanged: (bool? value) async{
          variables.pick = i;
          await setPick();
          update(0);
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
    );
  }

  Widget noItemHaveMoney(int i, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.3,
      child: ElevatedButton(
        onPressed: () async {
          variables.money -= price[i];
          variables.shopList[i] = 'true';
          await setShop();
          await setMoney();
          update(0);
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(20),
        ),
        child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Icon(Icons.attach_money_rounded, size: 18)),
      ),
    );
  }

//Icons.attach_money_rounded
  Widget noItemNoMoney(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.3,
      child: ElevatedButton(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "Not enough money!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.all(20),
        ),
        child: const FittedBox(
            fit: BoxFit.fitWidth,
            child: Icon(Icons.attach_money_rounded, size: 18)),
      ),
    );
  }

  Widget buttonReturn(int i, BuildContext context) {
    if (variables.shopList[i] == 'true') {
      if (variables.pick == i) {
        return gotItemAndPicked(context);
      }
      return gotItemAndNotPicked(i);
    } else {
      if (variables.money >= price[i]) {
        return noItemHaveMoney(i, context);
      } else {
        return noItemNoMoney(context);
      }
    }
  }

  Widget item(int i, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        border: i < 5
            ? const Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 5,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.95 * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(jumpers[i]),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${name[i]}',
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Price: ${price[i]}',
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          buttonReturn(i, context),
        ],
      ),
    );
  }

  Widget shop(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: const Color(0xffc9a064),
          border: Border.all(
            width: 5,
            color: Colors.black,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: (MediaQuery.of(context).size.height * 0.8) / 9,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Shop.png'))),
            ),
            Container(
              height: 20,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
              ),
            ),
            for (int i = 0; i < 6; i++) item(i, context),
          ],
        ),
      ),
    );
  }
}
