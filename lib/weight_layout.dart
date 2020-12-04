import 'package:flutter/material.dart';

class WeightLayout extends StatefulWidget {
  final int weight;
  final Function(int) callback;

  const WeightLayout({Key key, this.weight, this.callback}) : super(key: key);

  @override
  _WeightLayoutState createState() => _WeightLayoutState();
}

class _WeightLayoutState extends State<WeightLayout> {
  int number;

  @override
  void initState() {
    number = widget.weight;
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
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black54,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WEIGHT',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Text(
            '$number',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      number++;
                    });
                    widget.callback(number);
                  },
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      number--;
                    });
                    widget.callback(number);
                  },
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
