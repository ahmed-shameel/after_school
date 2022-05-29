import '../../pub/components/pub.dart';
import '../../user/components/user.dart';

class CheckIn {
  DateTime timeCheckedIn = DateTime(2022, 1, 1, 00, 00);
  DateTime timeCheckedOut = DateTime(2022, 1, 1, 00, 00);
  //Duration visitDuration = timeCheckedOut.difference(timeCheckedIn);
  Pub pub;
  User? user;
  //bool? isCheckedIn;

  CheckIn({required this.timeCheckedIn, required this.pub});
}
