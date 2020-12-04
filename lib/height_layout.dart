import 'package:flutter/material.dart';

class HeightLayout extends StatefulWidget {
  final double number;
  final Function(double) callback;

  const HeightLayout({Key key, this.number, this.callback}) : super(key: key);

  @override
  _HeightLayoutState createState() => _HeightLayoutState();
}

class _HeightLayoutState extends State<HeightLayout> {
  double number;

  @override
  void initState() {
    number = widget.number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black87,
      ),
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HEIGHT',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${number.round()}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              Text(
                'cm',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Slider(
            min: 0,
            max: 200,
            onChanged: (double value) {
              widget.callback(value);
              setState(() {
                number = value;
              });
            },
            value: number,
          ),
        ],
      ),
    );
  }
}
