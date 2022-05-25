import 'dart:convert';
import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/newPub.dart';
import '../pubs_list/components/body.dart';
import "package:http/http.dart" as http;

class PubsScreen extends StatefulWidget {
  const PubsScreen({Key? key}) : super(key: key);




  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
           'Pubs',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
//      body: Body(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return PubsScreenState();
    
  }
}
class PubsScreenState extends State<PubsScreen> {
  late Future<newPub> futureNewPub;

  @override
  void initState() {
    super.initState();
    futureNewPub = fetchPubs();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<newPub>(
//      header: ,
      future: futureNewPub,
      builder: (context, snapshot)  {
        if (snapshot.hasData) {
          return Text(snapshot.data!.pubName);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
  Future<newPub> fetchPubs() async {

    final response = await http
        .get(Uri.parse('http://localhost:8080/bars'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return newPub.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load pub');
    }
  }




}
