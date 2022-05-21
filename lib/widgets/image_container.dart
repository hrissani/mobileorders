

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ImageCustomContainer extends StatelessWidget {
  final String imageUrl;
  const ImageCustomContainer({ 
    Key? key,
    required this.imageUrl 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return OptimizedCacheImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error)  {
          return Container(
          margin:const EdgeInsets.symmetric(horizontal: 4),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
          ));
        },
        imageBuilder: (context, imageProvider) => Container(
          margin:const EdgeInsets.symmetric(horizontal: 4),
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(8)
          )));
  }
}