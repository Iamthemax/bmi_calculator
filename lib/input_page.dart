import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onTapped: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? activeCardColour
                          : inActiveCardColor,
                      cardChild: const IconContent(
                        myIcon: FontAwesomeIcons.mars,
                        iconText: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onTapped: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeCardColour
                          : inActiveCardColor,
                      cardChild: const IconContent(
                          myIcon: FontAwesomeIcons.venus, iconText: "FEMALE"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: inActiveCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("HEIGHT"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 60.0)),
                          Text("cm",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 20.0,
                              )),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        activeColor: Colors.purple,
                        inactiveColor: Colors.blueGrey,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      )
                    ],
                  )),
            ),
            const Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
