import 'package:flutter/material.dart';
import 'package:techmaster_lesson3/age_layout.dart';
import 'package:techmaster_lesson3/gender_layout.dart';
import 'package:techmaster_lesson3/height_layout.dart';
import 'package:techmaster_lesson3/weight_layout.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int weightValue = 40;
  int ageValue = 20;
  double heightValue = 180;
  bool genderValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Column(
        children: [
          Expanded(child: buildGender()),
          Expanded(child: buildHeight()),
          Expanded(child: buildWeightAndAge()),
          buildButton(),
        ],
      ),
    );
  }

  Widget buildGender() {
    return GenderLayout(
      genderValue: genderValue,
      callback: gender,
    );
  }

  Widget buildHeight() {
    return Container(
      child: HeightLayout(
        number: heightValue,
        callback: height,
      ),
    );
  }

  Widget buildWeightAndAge() {
    return Container(
      color: Colors.green,
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: WeightLayout(
              weight: weightValue,
              callback: weight,
            ),
          ),
          Expanded(
            child: AgeLayout(
              age: ageValue,
              callback: age,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton() {
    return GestureDetector(
      onTap: () {
        _showMyDialog();
      },
      child: Container(
        height: 60,
        width: double.infinity,
        color: Colors.pink,
        alignment: AlignmentDirectional.center,
        child: Text(
          'CALCULATE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  void weight(weight) {
    print('_HomeScreenState.weight: $weight');
  }

  void height(height) {
    print('_HomeScreenState.height $height');
  }

  void age(age) {
    print('_HomeScreenState.height $age');
  }

  void gender(gender) {
    print('_HomeScreenState.gender $gender');
  }

  double calculateBMI(double height, double weight) {
    height /= 100;
    double heightSquare = height * height;
    double result = weight / heightSquare;
    return result.roundToDouble();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Weight: ',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextSpan(
                        text: '$weightValue',
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Age: ',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextSpan(
                        text: '$ageValue',
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Gender: ',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextSpan(
                        text: genderValue ? 'Male' : 'Female',
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Height: ',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextSpan(
                        text: '$heightValue',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: new TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'BMI: ',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new TextSpan(
                        text: '${calculateBMI(
                          heightValue,
                          weightValue.toDouble(),
                        )}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
