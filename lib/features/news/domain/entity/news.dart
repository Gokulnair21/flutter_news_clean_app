class News {
  final String? sourceName;
  final String? thumbnail;
  final String content;
  final String title;
  final String dateTime;
  final String? author;
  final String source;

  News(
      {required this.sourceName,
      required this.thumbnail,
      required this.content,
      required this.title,
      required this.dateTime,
      required this.author,
      required this.source});
}
