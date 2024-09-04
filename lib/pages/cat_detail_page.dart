import 'package:flutter/material.dart';

import '../models/cat.dart';
import '../helpers/image_helper.dart';
import '../widgets/cat_data_widget.dart';

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Hero(
              tag: cat.id,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: generateCachedImage(
                  cat.image.url,
                ),
              ),
            ),
            Expanded(child: CatData(cat: cat)),
          ],
        ),
      ),
    );
  }
}
