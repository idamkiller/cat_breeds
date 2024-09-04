import 'package:flutter/material.dart';

import '../models/cat.dart';

class CatData extends StatelessWidget {
  const CatData({
    super.key,
    required this.cat,
  });

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            _buildInfoRow(
              title: 'Description',
              value: cat.description,
            ),
            _buildInfoRow(
              title: 'Origin',
              value: cat.origin,
            ),
            _buildInfoRow(
              title: 'Intelligence',
              value: cat.intelligence.toString(),
            ),
            _buildInfoRow(
              title: 'Adaptability',
              value: cat.adaptability.toString(),
            ),
            _buildInfoRow(
              title: 'Life S pan',
              value: cat.lifeSpan,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
