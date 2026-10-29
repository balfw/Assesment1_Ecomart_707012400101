import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({super.key});

  static const LatLng lokasiBankSampah = LatLng(-6.914744, 107.609810);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi BankSampah'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Lokasi simulasi Komunitas BankSampah Bandung',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: lokasiBankSampah,
                zoom: 15,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('BankSampah'),
                  position: lokasiBankSampah,
                  infoWindow: InfoWindow(
                    title: 'BankSampah Bandung',
                    snippet: 'Lokasi simulasi komunitas',
                  ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
