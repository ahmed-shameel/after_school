import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../review/components/body.dart';
import 'components/review.dart';

class ReviewScreen extends StatelessWidget {
  final List<Review> reviews;

  ReviewScreen({Key? key, required this.reviews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: GestureDetector(
          child: Icon(Icons.keyboard_backspace_sharp, color: iconColor,),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(
        reviews: reviews,
      ),
    );
  }
}
