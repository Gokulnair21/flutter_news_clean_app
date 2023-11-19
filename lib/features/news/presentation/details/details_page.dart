import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Image.network(
                    news.thumbnail ?? "https://source.unsplash.com/random",
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )))
                ],
              ),
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
