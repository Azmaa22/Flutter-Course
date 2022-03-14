import 'package:flutter/material.dart';

class TomatoPage extends StatefulWidget {
  const TomatoPage({Key? key}) : super(key: key);

  @override
  State<TomatoPage> createState() => _TomatoPageState();
}

class _TomatoPageState extends State<TomatoPage> {
  bool _isDropped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Drag and Drop'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Draggable<String>(
                // axis: Axis.horizontal,
                data: 'red',
                child: SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: !_isDropped
                        ? Image.asset('assets/images/tomato.png')
                        : Container(),
                  ),
                ),
                feedback: SizedBox(
                  height: 220.0,
                  width: 220.0,
                  child: Center(child: Image.asset('assets/images/tomato.png')),
                ),
                childWhenDragging: SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: !_isDropped
                        ? Image.asset('assets/images/tomato_greyed.png')
                        : Container(),
                  ),
                ),
                onDragStarted: () {
                  print('Drag started');
                },
                onDragEnd: (details) {
                  print('Drag end ${details.toString()}');
                },
                // onDraggableCanceled: (velocity, offset) {
                //   print('canceled at $offset with velocity $velocity');
                // },
              ),
              DragTarget<String>(
                onLeave: (data) {
                  print('object will be missed $data');
                },
                builder: (BuildContext context, List<dynamic> accepted,
                    List<dynamic> rejected) {
                  return Container(
                    height: 300.0,
                    width: 300.0,
                    child: Center(
                      child: Image.asset(_isDropped
                          ? 'assets/images/bowl_full.png'
                          : 'assets/images/bowl.png'),
                    ),
                  );
                },
                onWillAccept: (data) {
                  print('data will be accepted $data');
                  return data == 'red';
                },
                onAccept: (data) {
                  setState(() {
                    print('Dropped successfully!');
                    _isDropped = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
