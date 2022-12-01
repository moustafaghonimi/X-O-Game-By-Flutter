import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_o/player_data.dart';

import 'ItemBtn.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = 'game';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int player1score = 0;
  int player2score = 0;
  String win = '';

  List<String> gameBord = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    PlayerDataArg args =
        ModalRoute.of(context)?.settings.arguments as PlayerDataArg;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('X-O', style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                win,
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '${args.name1} (X)',
                        style: Theme.of(context).textTheme.headline1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$player1score',
                      style: Theme.of(context).textTheme.headline2,

                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      child: Text(
                        '${args.name2} (O)',
                        style: Theme.of(context).textTheme.headline1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('$player2score',
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ItemButton(gameBord[0], 0, onBreasedBtn),
                ItemButton(gameBord[1], 1, onBreasedBtn),
                ItemButton(gameBord[2], 2, onBreasedBtn),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ItemButton(gameBord[3], 3, onBreasedBtn),
                ItemButton(gameBord[4], 4, onBreasedBtn),
                ItemButton(gameBord[5], 5, onBreasedBtn),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ItemButton(gameBord[6], 6, onBreasedBtn),
                ItemButton(gameBord[7], 7, onBreasedBtn),
                ItemButton(gameBord[8], 8, onBreasedBtn),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void newGame() {
    gameBord = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
  }

  int counter = 0;

  void onBreasedBtn(index) {
    if (gameBord[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      gameBord[index] = 'X';
      player1score += 2;
      bool wineer = chechwinner('X');
      if (wineer) {
        player1score += 10;
        win = 'Player X Is WINNER';
        counter = 0;

        newGame();
      }
    } else {
      gameBord[index] = 'O';
      player2score += 2;
      bool wineer = chechwinner('O');
      if (wineer) {
        player2score += 10;
        win = 'Player O Is WINNER';
        counter = 0;

        newGame();
      }
    }
    if (counter == 9) {
      win = 'OPPS! No Winner ';
      player1score = 0;
      player2score = 0;
      counter = 0;

      newGame();
    }

    counter++;
    setState(() {});
  }

  bool chechwinner(String sympol) {
    for (int i = 0; i < 9; i += 3) {
      if (gameBord[i] == sympol &&
          gameBord[i + 1] == sympol &&
          gameBord[i + 2] == sympol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (gameBord[i] == sympol &&
          gameBord[i + 3] == sympol &&
          gameBord[i + 6] == sympol) {
        return true;
      }
    }
    if (gameBord[0] == sympol &&
        gameBord[4] == sympol &&
        gameBord[8] == sympol) {
      return true;
    }

    if (gameBord[2] == sympol &&
        gameBord[4] == sympol &&
        gameBord[6] == sympol) {
      return true;
    }
    return false;
  }
}
