import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/results_page.dart';
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
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        body: SafeArea(
          child: Column(
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
                        Text(
                          "HEIGHT",
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 40.0)),
                            Text("cm",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20.0,
                                )),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 16.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 32.0)),
                          child: Slider(
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
                          ),
                        )
                      ],
                    )),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: inActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(fontSize: 50.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight = weight + 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 0) {
                                        weight = weight - 1;
                                      }
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: inActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: labelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: TextStyle(fontSize: 50.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  child: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age = age + 1;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                RoundIconButton(
                                  child: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 0) {
                                        age = age - 1;
                                      }
                                    });
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: GestureDetector(
                  onTap: (){

                    CalculateBMI calc=CalculateBMI(weight: weight,height: height);
                    //Navigator.pushNamed(context, '/result_page',arguments:ResultPage(result: calc.getResult(),bmi: calc.calculate(),));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(result: calc.getResult(),bmi: calc.calculate(),)));
                  },
                  child: Container(
                    margin: EdgeInsets.all(2),
                    child: Center(child: Text("Calculate",style: labelTextStyle,)),
                    color: Colors.pink,
                    width: double.infinity,
                    height: 60.0,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, this.child, this.onPressed});

  final IconData? child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        child,
        color: Colors.white,
      ),
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
