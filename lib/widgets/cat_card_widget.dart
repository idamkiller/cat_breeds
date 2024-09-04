import 'package:flutter/material.dart';

import '../helpers/image_helper.dart';
import '../models/cat.dart';
import '../pages/cat_detail_page.dart';

class CatCard extends StatelessWidget {
  const CatCard({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    const paddingRow = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Padding(
            padding: paddingRow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cat.name),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CatDetailPage(cat: cat),
                      ),
                    );
                  },
                  child: const Text('More...'),
                ),
              ],
            ),
          ),
          Hero(
            tag: cat.id,
            child: SizedBox(
              height: 200,
              child: generateCachedImage(
                cat.image.url,
              ),
            ),
          ),
          Padding(
            padding: paddingRow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(cat.origin),
                Text(cat.intelligence.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
