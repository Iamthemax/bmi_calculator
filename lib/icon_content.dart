import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  const IconContent({
    super.key,required this.myIcon,this.myText,required this.iconText});
  final IconData? myIcon;
  final Widget? myText;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
        Icon(myIcon,color: Colors.white,size: 80.0,),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          iconText,
          style: const TextStyle(color: Colors.white,fontWeight:FontWeight.w800),
        ),
      ],
    );
  }
}