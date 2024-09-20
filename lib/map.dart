import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuwaiti Environment Map',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Google Map controller
  GoogleMapController? _mapController;

  // Initial position of the map (Kuwait)
  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(29.3759, 47.9774), // Coordinates of Kuwait
    zoom: 10,
  );

  // Method to create markers for affected and safe areas
  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId('salmiyaBeach'),
        position: LatLng(29.3375, 48.0745), // Example for an affected area
        infoWindow: InfoWindow(
          title: 'شواطئ السالمية',
          snippet: 'ملوثة بالبلاستيك',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
      ),
      Marker(
        markerId: MarkerId('jahraReserve'),
        position: LatLng(29.3366, 47.6596), // Jahra Natural Reserve
        infoWindow: InfoWindow(
          title: 'محمية الجهراء',
          snippet: 'محمية طبيعية سليمة',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueGreen,
        ),
      ),
      // Add more markers as needed
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('خريطة البيئة الكويتية'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        markers: _createMarkers(),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
