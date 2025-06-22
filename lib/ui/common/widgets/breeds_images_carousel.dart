import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../common.dart';

class BreedsImagesCarousel extends StatefulWidget {

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
  State<BreedsImagesCarousel> createState() => _BreedsImagesCarouselState();
}

class _BreedsImagesCarouselState extends State<BreedsImagesCarousel> {
  int _currentImage = 0;
  final _controller = PageController(viewportFraction: 0.94);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if(
      widget.status == RequestStatusEnum.none
    ) {

      return _LoadingElement(widget.width, widget.height);
    }

    if(widget.status == RequestStatusEnum.error) {

      return Scaffold(
        body: NetworkErrorMessage()
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.imagesUrls.length,
              onPageChanged: (value) {
                setState(() {
                  _currentImage = value;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      widget.imagesUrls[index],
                      fit: widget.fit,
                      loadingBuilder: (context, child, loadingProgress) {
                        if(loadingProgress?.cumulativeBytesLoaded == loadingProgress?.expectedTotalBytes){
                          return child;
                        }

                        return _LoadingElement(
                          widget.width,
                          widget.height,
                          loadingProgress: loadingProgress,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imagesUrls.length, (index) {
                final double size = _currentImage == index ? 12 : 8;

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImage == index ? colorScheme.surfaceTint : colorScheme.onSurface,
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

class _LoadingElement extends StatelessWidget {

  final double? width;
  final double? height;
  final ImageChunkEvent? loadingProgress;

  const _LoadingElement(
    this.width,
    this.height,
    {this.loadingProgress}
  );

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          value:
            loadingProgress != null
            && loadingProgress?.expectedTotalBytes != null
            && loadingProgress?.cumulativeBytesLoaded != null
              ? loadingProgress!.expectedTotalBytes! / loadingProgress!.cumulativeBytesLoaded
              : null
        ),
      ),
    );
  }
}

