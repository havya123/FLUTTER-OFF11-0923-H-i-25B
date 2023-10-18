import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Item extends StatelessWidget {
  Item(
      {required this.imageUrl,
      required this.title,
      required this.content,
      required this.description,
      super.key});
  String imageUrl;
  String title;
  String content;
  String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.memoryNetwork(
                  fit: BoxFit.cover,
                  placeholder: kTransparentImage,
                  image: imageUrl),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.orange, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ))
      ],
    );
  }
}
