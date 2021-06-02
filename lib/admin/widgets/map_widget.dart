import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:late_init/late_init.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<Marker> _markers = [];
  final LatLng _center = const LatLng(33.6518, 73.1566); //COMSATS ISB
  LatLng current_coordinates;
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 15.0,
      ),
      markers: _markers.toSet(),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      trafficEnabled: true,
      onTap: (cordinate) {
        current_coordinates = cordinate;
        // print(cordinate);
        setState(() {
          _markers = [];
          _markers.add(
            Marker(
              markerId: MarkerId(cordinate.toString()),
              position: cordinate,
              draggable: true,
              onDragEnd: (dragEndPosition) {
                // print(dragEndPosition.toString() + " end point");
              },
            ),
          );
        });
      },
    );

    // Container(
    //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //   padding: EdgeInsets.all(10),
    //   color: Colors.white,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.end,
    //     children: [
    //       Expanded(
    //         child: TextField(
    //           // decoration: InputDecoration(border: InputBorder.none),
    //           style: TextStyle(fontSize: 20),
    //         ),
    //       ),
    //       SizedBox(width: 5),
    //       Container(
    //         // margin: EdgeInsets.only(top: 10),
    //         child: TextButton(
    //           onPressed: () {
    //             if (_markers.length == 1) {
    //               Navigator.pop(context, current_coordinates);
    //             } else {
    //               ScaffoldMessenger.of(context).showSnackBar(
    //                 SnackBar(
    //                   content: Text(
    //                     'Please Select The Location',
    //                     textAlign: TextAlign.center,
    //                   ),
    //                 ),
    //               );
    //             }
    //           },
    //           child: Text("Done"),
    //         ),
    //       ),
    //     ],
    //   ),
    // )
  }
}
