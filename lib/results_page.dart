import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key,  this.result, this.bmi});

  String? result;
  String? bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATER",
          style: labelTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Your result",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: inActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toString(),style:TextStyle(fontWeight: FontWeight.w900, fontSize: 40)),
                  Text(
                    bmi.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 50.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                margin: EdgeInsets.all(2),
                child: Center(
                    child: Text(
                  "Re-Calculate",
                  style: labelTextStyle,
                )),
                color: Colors.pink,
                width: double.infinity,
                height: 60.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
