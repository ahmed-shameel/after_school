import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  List<String> images;

  ImageGallery({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(250.0),
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 8.0,
            ),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(8.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[index],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
