import 'package:flutter/material.dart';
import 'package:tic_toc_toe/tools/text.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int plOneScore = 0;
  int plTwoScore = 0;

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          SizedBox(height: 20),
          _getScoreBar(),
          SizedBox(height: 80),
          SizedBox(
            height: 400,
            child: _getView(),
          )
        ],
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
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
        );
      },
    );
  }
}
