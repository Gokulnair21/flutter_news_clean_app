import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/util/extension/string_extensions.dart';

import '../../../../../common_widgets/network_image.dart';

class NewsListItemCard extends StatelessWidget {
  const NewsListItemCard(
      {super.key,
      required this.news,
      required this.callback,
      required this.showDivider});

  final VoidCallback callback;
  final News news;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: InkWell(
        onTap: callback,
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedNetworkImage(
                    imageUrl: news.thumbnail,
                    height: 110,
                    width: 170,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: news.author != null,
                        child: Text(
                          'By ${news.author ?? ""}',
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        news.title,
                        maxLines: 3,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black87),
                      ),
                      Text(
                        news.dateTime.formatDate(),
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Visibility(
              visible: showDivider,
              child: const Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 0.5,
                    color: Colors.black12,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
