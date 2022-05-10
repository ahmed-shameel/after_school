import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatefulWidget {
  CustomRatingBar({
    Key? key,
  }) : super(key: key);

  @override
  CustomRatingBarState createState() {
    return CustomRatingBarState();
  }
}

class CustomRatingBarState extends State<CustomRatingBar> {
  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Rating: ',
            style: TextStyle(fontSize: 20),
          ),
          RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30,
              ratingWidget: RatingWidget(
                  full: const Icon(Icons.star, color: Colors.white),
                  half: const Icon(
                    Icons.star_half,
                    color: Colors.white,
                  ),
                  empty: const Icon(
                    Icons.star_outline,
                    color: Colors.white,
                  )),
              onRatingUpdate: (value) {
                setState(() {
                  _ratingValue = value;
                });
              }),
        ],
      ),
    );
  }
}
