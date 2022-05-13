import '../../profile/components/user/user.dart';
import '../../pub/components/pub.dart';

class Review {
  final Pub pub;
  final User user;
  final double rate;
  final String comment;

  Review({
    required this.user,
    required this.rate,
    required this.comment,
    required this.pub,
  });
}
