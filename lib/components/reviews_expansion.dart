import 'package:after_school/components/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import '../screens/user/components/user.dart';
import '../screens/review/components/review.dart';

class ReviewsExpansionPanel extends StatefulWidget {
  User user;
  ReviewsExpansionPanel({Key? key, required this.user}) : super(key: key);

  @override
  _ReviewsExpansionPanelState createState() {
    return _ReviewsExpansionPanelState();
  }
}

class _ReviewsExpansionPanelState extends State<ReviewsExpansionPanel> {
  List<bool> expandedList = <bool>[
    false,
    false,
    false,
  ];

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 500),
        children: [
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  'Reviews',
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            body: Column(
              children: [
                ...ListTile.divideTiles(
                  color: Colors.grey,
                  tiles: [
                    ...widget.user.reviews.map(
                      (Review reviewOfUser) => ListTile(
                        leading: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Colors.grey))),
                            width: 40,
                            height: 40,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              child: Center(
                                child: Text(
                                  reviewOfUser.pub.pubName,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            )),
                        title: Text(reviewOfUser.comment),
                        subtitle: CustomRatingBar(
                          starSize: 20, ratingValue: reviewOfUser.rate,
                          starColor: Colors.amber, //TODO:RATING UPDATE
                        ),
                        trailing: IconButton(
                            icon: Icon(
                              Icons.highlight_remove_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                widget.user.reviews.removeWhere(
                                    (Review currentReview) =>
                                        reviewOfUser == currentReview);
                              });
                            }),
                      ),
                    )
                  ],
                ),
              ],
            ),
            isExpanded: expanded,
            canTapOnHeader: true,
          ),
        ],
        dividerColor: Colors.grey,
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            expanded = !isExpanded;
          });
        },
      ),
    );
  }
}
