import 'package:flutter/material.dart';
import 'package:news_app/features/news/domain/entity/news.dart';
import 'package:news_app/features/news/presentation/custom_widgets/source_item_card.dart';

class NewsListItemCard extends StatelessWidget {
  const NewsListItemCard(
      {super.key, required this.news, required this.callback});

  final VoidCallback callback;
  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: callback,
          child: Row(
            children: [
              Image.network(
                news.thumbnail ?? "https://source.unsplash.com/random",
                errorBuilder: (_, __, ___) {
                  return const Icon(Icons.error);
                },
                fit: BoxFit.fill,
                height: 120,
                width: 100,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: news.sourceName != null,
                      child: SourceCard(source: news.sourceName ?? ""),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        news.dateTime,
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
