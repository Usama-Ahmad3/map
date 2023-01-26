import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:world_explorer/Model.dart';
import 'package:world_explorer/routes/routeName.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var adress;
  CameraPosition initial =
      const CameraPosition(zoom: 14, target: LatLng(30.0346038, 72.3164137));
  final Completer<GoogleMapController> _completer = Completer();
  Future<Model> getApiResponce() async {
    final response =
        await http.get(Uri.parse('https://api.covid19api.com/summary'));
    // ignore: prefer_typing_uninitialized_variables
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return Model.fromJson(data);
    } else {
      return Model.fromJson(data);
    }
  }

  var controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          GoogleMap(
            initialCameraPosition: initial,
            onMapCreated: (GoogleMapController controler) {
              _completer.complete(controler);
            },
            onTap: (LatLng control) async {
              var coordinates =
                  Coordinates(control.latitude, control.longitude);
              var adres = await Geocoder.local
                  .findAddressesFromCoordinates(coordinates);
              adress = adres.first;
              setState(() {});
            },
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TextFormField(
              onTap: () {},
              readOnly: true,
              controller: controler,
              decoration: InputDecoration(
                  hintText: '${adress.locality} ${adress.countryName}',
                  suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.details);
                      },
                      child: const Icon(Icons.one_k_plus_outlined)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ]),
        ]),
      ),
    );
  }
}
