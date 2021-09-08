import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truckit_demo/shared/shared.dart';

class JobMap extends StatefulWidget {
  const JobMap({Key? key}) : super(key: key);

  @override
  _JobMapState createState() => _JobMapState();
}

class _JobMapState extends State<JobMap> {
  final Completer<GoogleMapController> mapController = Completer();
  final sampleLatLng = LatLng(-37.4823, 144.6011279);
  final CameraPosition sampleCameraPosition = CameraPosition(
    target: LatLng(-37.4823, 144.6011279),
    zoom: 17,
  );
  Set<Marker> customMarkers = {};
  late BitmapDescriptor myLocationMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    myLocationMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 3.0), AppAsset.icMyLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.w,
      child: GoogleMap(
        initialCameraPosition: sampleCameraPosition,
        compassEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        myLocationEnabled: false,
        markers: customMarkers,
        gestureRecognizers: Set()
          ..add(
              Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
        onMapCreated: (GoogleMapController controller) {
          mapController.complete(controller);
          customMarkers.add(
            Marker(
              markerId: MarkerId('myLocation'),
              position: sampleLatLng,
              icon: myLocationMarker,
              anchor: Offset(0.5, 0.5),
            ),
          );
          setState(() {});
        },
      ),
    );
  }
}
