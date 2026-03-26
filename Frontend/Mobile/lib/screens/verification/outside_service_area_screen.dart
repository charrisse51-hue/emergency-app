import 'package:flutter/material.dart';

class OutsideServiceAreaScreen extends StatelessWidget {
  const OutsideServiceAreaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Image.asset('assets/logo/logo.png', height: 72),
              const SizedBox(height: 18),
              Image.asset(
                'assets/image-assets/OutsideServiceArea_illustrations.png',
                height: 190,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              const Text(
                'Outside Service Area',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              const Text(
                'RescueLink is currently available only within\n'
                'Dagupan City, Pangasinan. Your current location\n'
                'appears to be outside our service coverage area',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87, height: 1.35),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFDFF0FF),
                  border: Border.all(color: const Color(0xFF90BDFD)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline, color: Color(0xFF1A69E2), size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Why is this required?',
                          style: TextStyle(fontSize: 16, color: Color(0xFF1A52BE), fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsets.only(left: 28),
                      child: Text(
                        "To ensure rapid emergency response, we need to verify\n"
                        "that you're within our partner LGU's jurisdiction. This\n"
                        'allows us to connect you with the correct local emergency\n'
                        'departments and responders in Dagupan City.',
                        style: TextStyle(fontSize: 14, color: Color(0xFF1B6EE4), height: 1.45),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE3E3E3)),
                  boxShadow: const [
                    BoxShadow(color: Color(0x12000000), blurRadius: 8, offset: Offset(0, 2)),
                  ],
                ),
                child: const Text(
                  'What you can do:\n'
                  ' • 1.Make sure you\'re physically located within Dagupan City\n'
                  ' • 2.Enable high-accuracy GPS on your device\n'
                  ' • 3.Retry location verification',
                  style: TextStyle(fontSize: 14, height: 1.5),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 52,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4E59),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Retry Location Verification',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 52,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    side: const BorderSide(color: Color(0xFFBFBFBF)),
                    foregroundColor: Colors.black87,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Go Back', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

