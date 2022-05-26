import 'dart:convert';
import 'package:after_school/constants.dart';
import 'package:flutter/material.dart';
import '../pub/components/newPub.dart';
import '../pub/components/pub.dart';
import '../pubs_list/components/body.dart';
import "package:http/http.dart" as http;

class PubsScreen extends StatefulWidget {
  const PubsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PubsScreenState();

  }
}
class PubsScreenState extends State<PubsScreen> {
  late Future<List<newPub>> futureNewPub;

  @override
  void initState() {
    super.initState();
//    futureNewPub = fetchPubs();
  }


  @override
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
      body: Body(),
    );

  }

//       body: FutureBuilder<List<newPub>>(
//
//       future: futureNewPub,
//       builder: (context, snapshot)  {
//         if (snapshot.hasData) {
//           List<newPub>? data = snapshot.data;
//
//
//           return
//               ListView.builder(
//                   itemCount: data?.length,
//                   itemBuilder: (BuildContext context, int index){
//
//                     return ListTile(
//                    tileColor: Colors.white,
//                          title: Text(data![index].name),
//                          subtitle: Text(data![index].coordinates),
//                          isThreeLine: true,
//
//
//                     );
//                   }
//
//
//               );
// //        return Text('Datahämtning lyckades');
//
// //         return ListView.builder(
// //           itemCount: futureNewPub.length,
// //           itemBuilder: (context, index) {
//
// //           }
//         } else if (snapshot.hasError) {
//           return Text('${snapshot.error}');
//         }
//
//         // By default, show a loading spinner.
//         return const CircularProgressIndicator();
//       },
//
//     ));
//   }
//   Future<List<newPub>> fetchPubs() async {
//
//     final response = await http.get(Uri.http('localhost:8080', '/bars'));
//     //newPub.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
//
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((data) => newPub.fromJson(data)).toList();
//
// //      return [
// //        for (final item in jsonDecode(response.body)) newPub.fromJson(item),
// //      ];
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load pub');
//     }
  }



