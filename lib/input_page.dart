import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';

const activeCardColour = Color(0xFF31395D);
const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFF10102B);
const inActiveCardColor = Color(0xFF10102B);
enum Gender{male,female}
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  Color maleCardColor=inActiveCardColor;
  Color femaleCardColor=inActiveCardColor;

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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender=Gender.male;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender==Gender.male?activeCardColour:inActiveCardColor,
                        cardChild: const IconContent(
                          myIcon: FontAwesomeIcons.mars,
                          iconText: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedGender=Gender.female;
                        });
                      },
                      child: ReusableCard(
                        colour: selectedGender==Gender.female?activeCardColour:inActiveCardColor,
                        cardChild: const IconContent(
                            myIcon: FontAwesomeIcons.venus, iconText: "FEMALE"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: ReusableCard(
                colour: inActiveCardColor,
              ),
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
