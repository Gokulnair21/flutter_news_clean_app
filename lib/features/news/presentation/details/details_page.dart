import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/util/extension/ui_extension.dart';

class DetailsPage extends StatelessWidget {
  final News news;

  const DetailsPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              news.thumbnail!,
              fit: BoxFit.fill,
              height: 300,
              width: double.infinity,
            ),
            const SizedBox().verticalGap(2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                news.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
            ),
            const SizedBox().verticalGap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                news.content,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
