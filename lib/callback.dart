import 'package:flutter/material.dart';

class CallBack extends StatefulWidget {
  final int number;
  final Function(double) callback;

  const CallBack({Key key, this.number = 0, this.callback}) : super(key: key);

  @override
  _CallBackState createState() => _CallBackState();
}

class _CallBackState extends State<CallBack> {
  double count = 0.0;
  var sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              label: '$sliderValue',
              divisions: 100,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                  widget.callback(sliderValue);
                });
              },
            ),
            RaisedButton(
              onPressed: () {
                print('_CallBackState.build');
                setState(() {
                  sliderValue ++;
                  widget.callback(sliderValue);
                });
              },
              child: Text('Press'),
            ),
          ],
        ),
      ),
    );
  }
}
