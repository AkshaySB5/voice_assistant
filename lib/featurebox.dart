import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voice_assistant/pallete.dart';

class FeatureBox extends StatelessWidget {
  final Color colour;
  final String htext;
  const FeatureBox({super.key, required this.colour,required this.htext});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child:  Text(
      htext,style: const TextStyle(
        fontFamily: 'Cera Pro',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Pallete.blackColor
      ),
      ),
    );
  }
}
