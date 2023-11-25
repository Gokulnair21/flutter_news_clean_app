import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entity/news.dart';

class NewsHiglightCard extends StatelessWidget {
  const NewsHiglightCard({super.key, required this.news, required this.callbackAction});
  final VoidCallback callbackAction;

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: callbackAction,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: 200,
            height: 300,
            child: Stack(
              children: [
                Image.network(
                  news.thumbnail ?? "https://source.unsplash.com/random",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black87,
                      Colors.black54,
                      Colors.black12,
                      Colors.black12,
                    ],
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      news.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                      maxLines: 3,
                      overflow: TextOverflow.fade
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
