import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget generateCachedImage(String imageUrl) {
  return CachedNetworkImage(
    placeholder: (context, url) => Image.asset('assets/images/cat.png'),
    errorWidget: (context, url, error) => Image.asset('assets/images/cat.png'),
    imageUrl: imageUrl,
    fit: BoxFit.cover,
  );
}
