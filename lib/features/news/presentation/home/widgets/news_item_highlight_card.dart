import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entity/news.dart';

import '../../../../../common_widgets/network_image.dart';

class NewsHiglightCard extends StatelessWidget {
  const NewsHiglightCard(
      {super.key, required this.news, required this.callbackAction});

  final VoidCallback callbackAction;

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: callbackAction,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: news.thumbnail,
                  height: double.infinity,
                  width: double.infinity,
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
                    child: Text(news.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                        maxLines: 3,
                        overflow: TextOverflow.fade),
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
