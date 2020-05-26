import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );
class BallPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue,
     appBar: AppBar(
       title: Text('Ask Me Anything'),
       backgroundColor: Colors.blue.shade900,
     ),
     body: Ball(),
    );
  }
}
class Ball extends StatefulWidget {
  @override
  BallState createState() => BallState();
}

class BallState extends State <Ball>{
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
          child: FlatButton(
            onPressed: (){
              setState(() {
                ballNumber = Random().nextInt(5)+1;
                print(ballNumber);
              });

            } ,
            child:Image.asset('images/ball$ballNumber.png'),
          ),
    );
  }
}