import 'package:flutter/material.dart';

class CachedNetworkImage extends StatelessWidget {
  const CachedNetworkImage(
      {super.key, this.imageUrl, required this.height, required this.width});

  final String? imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? "",
      loadingBuilder: (_, child, progress) {
        if (progress == null) {
          return child;
        }
        return SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      errorBuilder: (_, __, ___) {
        return SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: Icon(Icons.error_outline),
          ),
        );
      },
      height: height,
      width: width,
      fit: BoxFit.fill,
      semanticLabel: "Network Image",
    );
  }
}
