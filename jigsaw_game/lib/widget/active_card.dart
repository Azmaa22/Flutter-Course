import 'package:flutter/material.dart';
import 'package:flutter_apps/models/models.dart';

class ActiveCard extends StatelessWidget {
  final CardModel currentCard;
  final String image;
  const ActiveCard({Key? key, required this.image, required this.currentCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: currentCard.color,
      child: SizedBox(
        height: 120.0,
        width: 120.0,
        child: Center(
          child: !currentCard.isDropped ? Image.asset(image) : Container(),
        ),
      ),
      feedback: SizedBox(
        height: 220.0,
        width: 220.0,
        child: Center(child: Image.asset(image)),
      ),
      childWhenDragging: SizedBox(
        height: 120.0,
        width: 120.0,
        child: Center(
          child: Container(),
        ),
      ),
      onDragStarted: () {
        print('Drag started');
      },
      onDragEnd: (details) {
        print('Drag end ${details.toString()}');
      },
    );
  }
}
