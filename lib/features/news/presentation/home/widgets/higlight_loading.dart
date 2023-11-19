import 'package:flutter/material.dart';

class HighLightLoading extends StatelessWidget {
  const HighLightLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin:const EdgeInsets.only(right: 10),
      width: 200,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
    );
  }
}
