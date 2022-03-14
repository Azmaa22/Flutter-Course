import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_apps/models/models.dart';
import 'package:flutter_apps/widget/active_card.dart';
import 'package:flutter_apps/widget/inactive_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CardModel blueCard = CardModel(color: 'blue', isDropped: false);
  CardModel greenCard = CardModel(color: 'green', isDropped: false);
  CardModel yellowCard = CardModel(color: 'yellow', isDropped: false);
  CardModel redCard = CardModel(color: 'red', isDropped: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag and Drop'),
      ),
      body: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: double.infinity,
            margin: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Positioned(
                  top: -53,
                  left: 3,
                  child: InActiveCard(
                      currentCard: blueCard,
                      onAccept: (value) {
                        print('value of card $value');
                        setState(() {
                          blueCard.isDropped = true;
                        });
                      },
                      activeImage: 'assets/images/active_blue_piece.png',
                      inactiveImage: 'assets/images/inactive_blue_piece.png'),
                ),
                Positioned(
                  top: -30,
                  right: 120,
                  child: InActiveCard(
                      currentCard: redCard,
                      onAccept: (value) {
                        print('value of card $value');
                        setState(() {
                          redCard.isDropped = true;
                        });
                      },
                      activeImage: 'assets/images/active_red_piece.png',
                      inactiveImage: 'assets/images/inactive_red_piece.png'),
                ),
                Positioned(
                  bottom: -30,
                  left: -20,
                  child: InActiveCard(
                      currentCard: yellowCard,
                      onAccept: (value) {
                        print('value of card $value');
                        setState(() {
                          yellowCard.isDropped = true;
                        });
                      },
                      activeImage: 'assets/images/active_yellow_piece.png',
                      inactiveImage: 'assets/images/inactive_yellow_piece.png'),
                ),
                Positioned(
                  bottom: -50,
                  right: 142,
                  child: InActiveCard(
                      currentCard: greenCard,
                      onAccept: (value) {
                        print('value of card $value');
                        setState(() {
                          greenCard.isDropped = true;
                        });
                      },
                      activeImage: 'assets/images/active_green_piece.png',
                      inactiveImage: 'assets/images/inactive_green_piece.png'),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: double.infinity,
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ActiveCard(
                      image: 'assets/images/active_blue_piece.png',
                      currentCard: blueCard),
                  ActiveCard(
                      image: 'assets/images/active_red_piece.png',
                      currentCard: redCard),
                  ActiveCard(
                      image: 'assets/images/active_green_piece.png',
                      currentCard: greenCard),
                  ActiveCard(
                      image: 'assets/images/active_yellow_piece.png',
                      currentCard: yellowCard),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
