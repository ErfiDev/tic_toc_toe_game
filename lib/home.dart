import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tic_toc_toe/classes/infoType.dart';
import 'package:tic_toc_toe/tools/boardChecker.dart';
import 'package:tic_toc_toe/tools/text.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int plOneScore = 0;
  int plTwoScore = 0;
  List<String> gameBoard = List.filled(9, '');
  bool turn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tic_toc_toe'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            SizedBox(height: 20),
            _getScoreBar(),
            SizedBox(height: 50),
            Expanded(
              child: _getView(),
            ),
            turn ? createText('turn 1') : createText('turn 2'),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _getScoreBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            createText('Player 1'),
            createText('$plOneScore'),
          ],
        ),
        Column(
          children: [
            createText('Player 2'),
            createText('$plTwoScore'),
          ],
        ),
      ],
    );
  }

  Widget _getView() {
    return GridView.builder(
      itemCount: 9,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (ctx, i) {
        return InkWell(
          onTap: () {
            setState(() {
              if (gameBoard[i] == '') {
                gameBoard[i] = turn ? '1' : '2';
                turn = !turn;
              } else {
                return;
              }
            });
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  '${gameBoard[i] == '1' ? 'X' : gameBoard[i] == '2' ? 'O' : ''}',
                  style: TextStyle(
                    fontSize: 60,
                    color: gameBoard[i] == '1' ? Colors.red : Colors.blue,
                  ),
                ),
              )),
        );
      },
    );
  }
}
