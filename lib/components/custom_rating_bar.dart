import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatefulWidget {
  String? text;
  double starSize;
  double? ratingValue;
  Color? starColor;

  CustomRatingBar({
    Key? key,
    this.text,
    required this.starSize,
    this.ratingValue,
    this.starColor,
  }) : super(key: key);

  @override
  CustomRatingBarState createState() {
    return CustomRatingBarState();
  }
}

class CustomRatingBarState extends State<CustomRatingBar> {
  @override
  Widget build(BuildContext context) {
    if (widget.text != null) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text!,
              style: TextStyle(fontSize: 20),
            ),
            RatingBar(
                initialRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: widget.starSize,
                ratingWidget: RatingWidget(
                    full: Icon(Icons.star,
                        color: widget.starColor ?? Colors.white),
                    half: Icon(
                      Icons.star_half,
                      color: widget.starColor ?? Colors.white,
                    ),
                    empty: Icon(
                      Icons.star_outline,
                      color: widget.starColor ?? Colors.white,
                    )),
                onRatingUpdate: (value) {
                  setState(() {
                    widget.ratingValue = value;
                  });
                }),
          ],
        ),
      );
    } else {
      return RatingBar(
          initialRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: widget.starSize,
          ratingWidget: RatingWidget(
              full: Icon(Icons.star, color: widget.starColor ?? Colors.white),
              half: Icon(
                Icons.star_half,
                color: widget.starColor ?? Colors.white,
              ),
              empty: Icon(
                Icons.star_outline,
                color: widget.starColor ?? Colors.white,
              )),
          onRatingUpdate: (value) {
            setState(() {
              widget.ratingValue = value;
            });
          });
    }
  }
}
