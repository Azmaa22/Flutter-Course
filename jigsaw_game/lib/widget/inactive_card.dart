import 'package:flutter/material.dart';
import 'package:flutter_apps/models/models.dart';

class InActiveCard extends StatelessWidget {
  final CardModel currentCard;
  final Function(String?) onAccept;
  final String activeImage;
  final String inactiveImage;
  const InActiveCard(
      {Key? key,
      required this.currentCard,
      required this.onAccept,
      required this.activeImage,
      required this.inactiveImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onLeave: (data) {
        print('object will be missed $data');
      },
      builder: (BuildContext context, List<dynamic> accepted,
          List<dynamic> rejected) {
        return Container(
          height: 300.0,
          width: 300.0,
          child: Center(
            child: Image.asset(
                currentCard.isDropped ? activeImage : inactiveImage),
          ),
        );
      },
      onWillAccept: (data) {
        print('data will be accepted $data res ${data == currentCard.color}');
        return data == currentCard.color;
      },
      onAccept: onAccept,
    );
  }
}
