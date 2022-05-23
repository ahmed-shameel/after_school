import 'package:after_school/components/custom_rating_bar.dart';
import 'package:after_school/screens/pub/components/pub.dart';
import 'package:flutter/material.dart';
import '../screens/friend/friend_screen.dart';
import '../screens/user/components/user.dart';
import '../screens/review/components/review.dart';
import '../screens/user/user_screen.dart';

class CustomExpandedPanel extends StatefulWidget {
  User user;
  CustomExpandedPanel({Key? key, required this.user}) : super(key: key);

  @override
  _CustomExpandedPanelState createState() {
    return _CustomExpandedPanelState();
  }
}

class _CustomExpandedPanelState extends State<CustomExpandedPanel> {
  List<bool> expandedList = <bool>[
    false,
    false,
    false,
  ];

  //when logged in, if the main user is friends with another user it should take them to friends page, otherwise to normal
  //user page.
  MaterialPageRoute setRoute(User person) {
    if (widget.user.friends.contains(person)) {
      return MaterialPageRoute(
          builder: (context) => FriendScreen(
                user: person,
              ));
    } else {
      return MaterialPageRoute(
          builder: (context) => UserScreen(
                user: person,
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    //example data
    User user = User(
        username: 'username',
        firstName: 'firstName',
        lastName: 'lastName',
        email: 'email',
        password: 'password');
    User friend1 = User(
        username: 'username1',
        firstName: 'firstName1',
        lastName: 'lastName1',
        email: 'email1',
        password: 'password1');
    User friend2 = User(
        username: 'username2',
        firstName: 'firstName2',
        lastName: 'lastName2',
        email: 'email2',
        password: 'password2');
    Pub pub = Pub(pubName: 'Bojan Crew');
    Pub pub2 = Pub(pubName: 'Foo Bar');
    Pub pub3 = Pub(pubName: 'SöderS Pub');
    Review review =
        Review(user: user, rate: 5, comment: 'awesome pub', pub: pub);
    Review review3 =
        Review(user: user, rate: 1, comment: 'very bad', pub: pub3);
    Review review2 = Review(user: user, rate: 3, comment: 'okay', pub: pub2);

    user.friends.add(friend1);
    user.friends.add(friend2);
    user.reviews.add(review);
    user.reviews.add(review2);
    user.reviews.add(review3);

    return Container(
      color: Colors.transparent,
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 500),
        children: [
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  'Friends',
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            body: Column(
              children: [
                ...ListTile.divideTiles(
                  color: Colors.grey,
                  tiles: [
                    ...widget.user.friends.map(
                      (User friendOfUser) => ListTile(
                          leading: Container(
                            height: 30.0,
                            width: 30.0,
                            decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(50))),
                            child: CircleAvatar(
                              backgroundImage: friendOfUser.profilePhoto.image,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          title: Text(friendOfUser.username),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FriendScreen(
                                          user: friendOfUser,
                                        )));
                          }),
                    )
                  ],
                ),
              ],
            ),
            isExpanded: expandedList[0],
            canTapOnHeader: true,
          ),
          ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return ListTile(
                title: Text(
                  //TODO: IMPLEMENT CHECKINS
                  'Check-ins',
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
            body: ListTile(
              title: Text('Check-ins', style: TextStyle(color: Colors.black)),
            ),
            isExpanded: expandedList[1],
            canTapOnHeader: true,
          ),
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
                      ),
                    )
                  ],
                ),
              ],
            ),
            isExpanded: expandedList[2],
            canTapOnHeader: true,
          ),
        ],
        dividerColor: Colors.grey,
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            expandedList[panelIndex] = !isExpanded;
          });
        },
      ),
    );
  }
}
