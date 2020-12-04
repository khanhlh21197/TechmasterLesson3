import 'package:flutter/material.dart';

class GenderLayout extends StatefulWidget {
  final bool genderValue;
  final Function(bool) callback;

  const GenderLayout({Key key, this.genderValue, this.callback})
      : super(key: key);

  @override
  _GenderLayoutState createState() => _GenderLayoutState();
}

class _GenderLayoutState extends State<GenderLayout> {
  bool genderValue;

  @override
  void initState() {
    genderValue = widget.genderValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: male(),
          ),
          Expanded(
            child: female(),
          )
        ],
      ),
    );
  }

  Widget male() {
    return GestureDetector(
      onTap: () {
        genderValue = true;
        widget.callback(genderValue);
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: genderValue ? Colors.pink : Colors.black54,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/male.png',
              color: Colors.white,
              width: 50,
              height: 50,
            ),
            Text(
              'MALE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget female() {
    return GestureDetector(
      onTap: () {
        genderValue = false;
        widget.callback(genderValue);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: genderValue ? Colors.black54 : Colors.pink,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/female.png',
              color: Colors.white,
              width: 50,
              height: 50,
            ),
            Text(
              'FEMALE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
