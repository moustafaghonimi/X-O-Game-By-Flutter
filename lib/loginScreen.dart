import 'package:flutter/material.dart';
import 'package:x_o/game.dart';
import 'package:x_o/player_data.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'Login';
  String palyer1Name = '';
  String palyer2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'X-O Game',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: Theme.of(context).textTheme.headline4,
                  )
                ],
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    onChanged: (value) {
                      palyer1Name = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Player 1',
                      suffixText: '  (X)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    onChanged: (value) {
                      palyer2Name = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Player 2',
                      suffixText: ' (O)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            GameScreen.routeName,
                            arguments: PlayerDataArg(palyer1Name, palyer2Name)
                          );
                        },
                        child: Text('Go To Game')),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
