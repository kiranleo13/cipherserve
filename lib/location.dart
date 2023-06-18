import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  late GoogleMapController mapController;
  Location location = Location();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      _currentLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laptop Service Centers'),
      ),
      body: _currentLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 14.0,
              ),
              markers: _buildMarkers(),
            ),
    );
  }

  Set<Marker> _buildMarkers() {
    // Replace the dummy data with actual laptop service center data
    List<Map<String, dynamic>> serviceCenters = [
      {
        'name': 'Service Center 1',
        'latitude': 37.4219999,
        'longitude': -122.0840575,
      },
      {
        'name': 'Service Center 2',
        'latitude': 37.422129,
        'longitude': -122.08427,
      },
    ];

    Set<Marker> markers = {};
    for (var serviceCenter in serviceCenters) {
      final marker = Marker(
        markerId: MarkerId(serviceCenter['name']),
        position: LatLng(
          serviceCenter['latitude'],
          serviceCenter['longitude'],
        ),
        infoWindow: InfoWindow(
          title: serviceCenter['name'],
        ),
      );
      markers.add(marker);
    }
    return markers;
  }
}
