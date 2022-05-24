

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ImageCustomContainer extends StatelessWidget {
  final String imageUrl;
  final double? size;
  const ImageCustomContainer({ 
    Key? key,
    required this.imageUrl ,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return OptimizedCacheImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error)  {
          return Container(
          margin:const EdgeInsets.symmetric(horizontal: 4),
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
          ));
        },
        imageBuilder: (context, imageProvider) => Container(
          margin:const EdgeInsets.symmetric(horizontal: 4),
          width:size == null ? 120 : size,
          height: size == null ? 120 : size,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(8)
          )));
  }
}