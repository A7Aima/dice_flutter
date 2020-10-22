import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.orange,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  bool diceSelect_1 = true;
  var leftDiceNumber = Random().nextInt(6) + 1;
  var rightDiceNumber = Random().nextInt(6) + 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        diceSelect_1 ? buildDice1() : buildDice2(),
        SizedBox(height: 20),
        Flexible(
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              setState(() {
                diceSelect_1 = !diceSelect_1;
              });
            },
            child: Text(
              diceSelect_1 ? "Use 2 Dice" : "Use 1 Dice",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  Center buildDice2() {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                rollDice();
              },
              child: Image.asset("images/dice$leftDiceNumber.png"),
            ),
          ),
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                rollDice();
              },
              child: Image.asset("images/dice$rightDiceNumber.png"),
            ),
          ),
        ],
      ),
    );
  }

  Center buildDice1() {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                rollDice();
              },
              child: Image.asset(
                "images/dice$leftDiceNumber.png",
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
