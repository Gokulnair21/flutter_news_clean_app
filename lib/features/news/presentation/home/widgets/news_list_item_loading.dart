import 'package:flutter/material.dart';

class NewsListItemLoading extends StatelessWidget {
  const NewsListItemLoading({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10,left:10,right:10),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(20)),
    );
  }
}
