import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final markers = <Marker>[];

  @override
  void initState() {
    super.initState();
    getStations();
  }

  void getStations() async {
    final response = await Dio().get('http://127.0.0.1:5000/api/stations');
    if (response.data != null) {
      setState(() {
        response.data.forEach((station) {
          markers.add(
            Marker(
              point: LatLng(
                station['location']['coordinates'][0],
                station['location']['coordinates'][1],
              ),
              builder: (context) => Image(
                image: AssetImage('assets/marker.png'),
              ),
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildMap();
  }

  Widget buildMap() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(59.889651, 29.87631),
        zoom: 9.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }
}
