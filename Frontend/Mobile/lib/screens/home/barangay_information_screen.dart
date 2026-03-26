import 'package:flutter/material.dart';

class BarangayInformationScreen extends StatelessWidget {
  const BarangayInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4E59),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(22),
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.black87),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Barangay Information',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Your registered location',
                            style: TextStyle(color: Color(0xFFFFE2E4), fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Image.asset('assets/logo/logo.png', height: 28),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F3),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    'CURRENT LOCATION MAP',
                    style: TextStyle(fontSize: 20, color: Colors.black45, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 1))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFFEAF0F7),
                          child: Icon(Icons.location_on_outlined, size: 16, color: Color(0xFF67A0D8)),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Current Barangay', style: TextStyle(fontSize: 12, color: Colors.black54)),
                              Text('Barangay Doyong', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                              Text('Dagupan City, Pangasinan', style: TextStyle(fontSize: 12, color: Colors.black54)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 128,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFF1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFD2D2D2)),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.black38, size: 30),
                            Text('Barangay Boundary Map', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black54)),
                            Text('Poblacion Oeste Coverage Area', style: TextStyle(fontSize: 12, color: Colors.black45)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4D9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE4C36A)),
                ),
                child: const Text(
                  'Important Notice\n'
                  'Changing your barangay requires LGU re-verification. This\n'
                  'process may take 1-3 business days. Emergency services will\n'
                  'continue using your current barangay until approved.',
                  style: TextStyle(color: Color(0xFF9A7A1F), height: 1.35),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

