import 'package:flutter/material.dart';

import '../../../domain/domain.dart';


class BreedsImagesCarousel extends StatelessWidget {

  final double width;
  final double height;
  final RequestStatusEnum status;
  final List<String> imagesUrls;
  final BoxFit? fit;

  const BreedsImagesCarousel({
    super.key,
    required this.width,
    required this.height,
    required this.status,
    this.imagesUrls = const [],
    this.fit
  });

  @override
  Widget build(BuildContext context) {

    if(status == RequestStatusEnum.none || status == RequestStatusEnum.isLoading) {
      return _LoadingElement(null, width, height);
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(5)
      ),
      child: ListView.builder(
        itemExtent: width-20,
        itemCount: imagesUrls.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              imagesUrls[index],
              fit: fit,
            ),
          );
        },
      ),
    );
  }
}

class _LoadingElement extends StatelessWidget {

  final double? width;
  final double? height;
  final ImageChunkEvent? loadingProgress;

  const _LoadingElement(this.loadingProgress, this.width, this.height);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          value: loadingProgress != null && loadingProgress?.expectedTotalBytes != null && loadingProgress?.cumulativeBytesLoaded != null
            ? loadingProgress!.expectedTotalBytes! / loadingProgress!.cumulativeBytesLoaded
            : null
        ),
      ),
    );
  }
}

