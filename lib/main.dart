import 'dart:async';
import 'package:odakarge/Service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:odakarge/isaretler.dart';

import "Service.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //AIzaSyC3V4aBGsDeuvylhWAPwry14sX7AORH5BE

  Completer<GoogleMapController> haritaKontrol = Completer();

  var baslangicKonum = CameraPosition(
    target: LatLng(38.7412482, 26.1844276),
    zoom: 4,
  );

  Future<void> KonumaGit() async {
    GoogleMapController controller = await haritaKontrol.future;
    var gidilecekIsaret = Marker(
      markerId: MarkerId("Id"),
      position: LatLng(41.0039643, 28.4517462),
      infoWindow: InfoWindow(title: "İstanbul", snippet: "Evim"),
    );

    setState(() {
      isaretler.add(gidilecekIsaret);
    });

    var GidilecekKonum = CameraPosition(
      target: LatLng(41.0039643, 28.4517462),
      zoom: 8,
    );
    controller.animateCamera(
      CameraUpdate.newCameraPosition(GidilecekKonum),
    );
  }

  List<Marker> isaretler = <Marker>[];

  List<Widget> textWidgetList = [];

  @override
  Widget build(BuildContext context) {
    Future<List<Isaretler>?> bolgeler = getAllIsaretler();
    print(bolgeler.runtimeType);
    //Future<int> getRegionLength = getLength();

    textWidgetList.add(ListView.builder(
      itemCount: 56,
      itemBuilder: (context, index) {
        return Text("");
      },

    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 450,
              height: 500,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: baslangicKonum,
                markers: Set<Marker>.of(isaretler),
                onMapCreated: (GoogleMapController controller) {
                  haritaKontrol.complete(controller);
                },
              ),
            ),

            ElevatedButton(
              onPressed: () {
                KonumaGit();
              },
              child: Text("konuma git"),
            ),
          ],
        ),
      ),
    );
  }
}
