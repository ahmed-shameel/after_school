import 'dart:convert';
import 'package:after_school/components/search_field.dart';
import 'package:after_school/screens/pubs_list/components/uni_card.dart';
import 'package:after_school/screens/pubs_list/components/university.dart';
import 'package:flutter/material.dart';
import '../../../components/background_without_logo.dart';
import '../../pub/components/pub.dart';
import "package:http/http.dart" as http;
import '../../pub/pub_screen.dart';


class Body extends StatefulWidget {



  Widget build(BuildContext context) {
    University su = University(
        uniIcon: const Image(image: AssetImage("assets/icons/suicon.png")),
        uniName: 'SU');
    University kth = University(
        uniIcon: const Image(image: AssetImage("assets/icons/kthicon.png")),
        uniName: 'KTH');
    University gih = University(
        uniIcon: const Image(image: AssetImage("assets/icons/gihicon.png")),
        uniName: 'GIH');
    University ki = University(
        uniIcon: const Image(image: AssetImage("assets/icons/kiicon.png")),
        uniName: 'KI');
    University shh = University(
        uniIcon: const Image(image: AssetImage("assets/icons/shhicon.png")),
        uniName: 'SHH');
    University sh = University(
        uniIcon: const Image(image: AssetImage("assets/icons/shicon.png")),
        uniName: 'SH');

  //  Pub pub = Pub(name: 'Bojan Crew', open: false, openingHours: 'openingHours', address: 'address', university: 'university', rating: 0.0, coordinates: 'cords', description: 'desc');
 //   Pub fooBar = Pub(name: 'Foo Bar');
//    PubTile pubTileBJ = PubTile(pub: bojanCrew);
//    PubTile pubTileFB = PubTile(pub: fooBar);
//    su.pubs.add(pubTileBJ);
//    su.pubs.add(pubTileFB);
 //   bojanCrew.images.add('assets/images/logo.png');
 //   bojanCrew.images.add('assets/images/logo.png');
 //   fooBar.images.add('assets/images/logo.png');
 //   fooBar.setHours(
 //       'Onsdagar 15:45 - Sent och sista fredagen i månaden kl. 15:45 - Sent');

    return Background(
      child: ListView(children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(63, 20, 63, 20),
          child: SearchField(),
        ),
        UniCard(university: su),
        UniCard(university: kth),
        UniCard(university: gih),
        UniCard(university: ki),
        UniCard(university: shh),
        UniCard(university: sh),
      ]),
    );
  }

  @override
  State<StatefulWidget> createState() {
      return DataRetriever();
  }
}

class DataRetriever extends State<Body> {
  late Future<List<Pub>> futurePub;

  @override
  void initState() {
    super.initState();
    futurePub = fetchPubs();
  }



  @override
  Widget build(BuildContext context) {


      return FutureBuilder<List<Pub>>(
        future: futurePub,
        builder: (context, snapshot)  {
      if (snapshot.hasData) {
        List<Pub> data = snapshot.data!;


        return Background(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                Pub pub = data[index];
                return Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (index) => PubScreen(pub: pub,)));

                            },
                            tileColor: Colors.white,
                            title: Text(data[index].name,
                              textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(data[index].openingHours + "\n" + data[index].description,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 11),
                            ),
                            isThreeLine: true,
                            leading:
                            data[index].university == 'Stockholm Universitet' ?
                            const Image(
                              image: AssetImage("assets/icons/suicon.png"),
                              width: 40,
                              height: 40,) :
                            data[index].university ==
                                'Kungliga Tekniska Högskolan' ?
                            const Image(
                              image: AssetImage("assets/icons/kthicon.png"),
                              width: 40,
                              height: 40,) :
                            data[index].university == 'Södertörns Högskola' ?
                            const Image(
                              image: AssetImage("assets/icons/shicon.png"),
                              width: 40,
                              height: 40,) :
                            data[index].university == 'Karolinska Institutet' ?
                            const Image(
                              image: AssetImage("assets/icons/kiicon.png"),
                              width: 40,
                              height: 40,) :
                            data[index].university ==
                                'Gymnastik- och idrottshögskolan' ?
                            const Image(
                              image: AssetImage("assets/icons/gihicon.png"),
                              width: 40,
                              height: 40,) :
                            data[index].university == 'Sophiahemmet Högskola' ?
                            const Image(
                              image: AssetImage("assets/icons/shhicon.png"),
                              width: 40,
                              height: 40,)
                                : Icon(Icons.arrow_forward_ios),

                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      // Container(
                      //     child: Padding(
                      //         padding: EdgeInsets.fromLTRB(30, 8, 30, 8),
                      //         child: SearchField())
                      // )
                ],


                );
                })


        );      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');

      }
      return const CircularProgressIndicator();
    }
  );}


  Future<List<Pub>> fetchPubs() async {

    final response = await http.get(Uri.http('localhost:8080', '/bars'),
    headers:  {"Access-Control-Allow-Origin": "*"});


    if (response.statusCode == 200) {
      List jsonResponse = json.decode(utf8.decode(response.bodyBytes));


      return jsonResponse.map((data) => Pub.fromJson(data)).toList();


    } else {
      throw Exception('Failed to load pub');
    }}}



