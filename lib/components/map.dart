import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:smart_jacket_buft_1/model.dart';

class MyMap extends StatefulWidget {
  MyMap({
    Key? key,
    required this.data,
  });

  final Data data;

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  MapController controller = MapController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: 250,
        child: FlutterMap(
          options: MapOptions(
            screenSize: const Size.square(250),
            center: LatLng(widget.data.lat, widget.data.long),
            zoom: 10.0,
          ),
          layers: [
            TileLayerOptions(
              minZoom: 1,
              maxZoom: 18,
              urlTemplate: "https://c.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              attributionBuilder: (_) {
                return const Text("© OpenStreetMap contributors");
              },
            ),
            MarkerLayerOptions(markers: [
              Marker(
                  width: 30.0,
                  height: 30.0,
                  point: LatLng(widget.data.lat, widget.data.long),
                  builder: (ctx) => Container(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.blueAccent,
                          size: 40,
                        ),
                      ))
            ])
          ],
        ));
  }
}
