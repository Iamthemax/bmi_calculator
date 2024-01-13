import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  /*const ReusableCard({
    super.key,
  });*/

  const ReusableCard({super.key, @required this.colour, this.cardChild,this.onTapped});

  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? onTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}