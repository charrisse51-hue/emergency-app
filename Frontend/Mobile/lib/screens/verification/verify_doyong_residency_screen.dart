import 'package:flutter/material.dart';

import '../auth/account_created_screen.dart';
import 'outside_service_area_screen.dart';

class VerifyDoyongResidencyScreen extends StatelessWidget {
  const VerifyDoyongResidencyScreen({super.key});

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
              const SizedBox(height: 20),
              Image.asset(
                'assets/image-assets/verifynumber_illustrations.png',
                height: 190,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              const Text(
                'Verify Doyong Residency',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 2),
              const Text(
                'Confirm your identity and location',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(color: Color(0x12000000), blurRadius: 8, offset: Offset(0, 2)),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EDF3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(Icons.map_outlined, size: 60, color: Color(0xFF8FA1B8)),
                          ),
                          Positioned(
                            left: 10,
                            right: 10,
                            bottom: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(color: Color(0x22000000), blurRadius: 6, offset: Offset(0, 2)),
                                ],
                              ),
                              child: const Text(
                                'Doyong Boundaries\nPangasinan, Philippines',
                                style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2F7E9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFF7BD39A)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Color(0xFF32B567), size: 24),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Inside Doyong Calasiao Pangasinan\nLocation verified',
                              style: TextStyle(fontSize: 14, color: Color(0xFF1A6A3A), height: 1.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Selected Barangay\nBarangay Doyong',
                        style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.35),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 52,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    side: const BorderSide(color: Color(0xFFBFBFBF)),
                    foregroundColor: Colors.black87,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const OutsideServiceAreaScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh GPS', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4E59),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const AccountCreatedScreen(),
                      ),
                    );
                  },
                  child: const Text('Verification', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

