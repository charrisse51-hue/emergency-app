import 'package:flutter/material.dart';

import 'emergency_tracking_screen.dart';

class EmergencyReportScreen extends StatelessWidget {
  const EmergencyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4E59),
                        borderRadius: BorderRadius.circular(28),
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
                                  'Emergency Report',
                                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  'Choose the type that best matches your\nsituation',
                                  style: TextStyle(color: Color(0xFFFFE2E4), fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          Image.asset('assets/logo/logo.png', height: 28),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    const _SectionCard(
                      title: 'Voice Recording',
                      icon: Icons.mic_none,
                      trailing: _RecordingIndicator(),
                      child: _RecordTile(),
                    ),
                    const SizedBox(height: 10),
                    const _SectionCard(
                      title: 'Location',
                      icon: Icons.location_on_outlined,
                      child: _LocationTile(),
                    ),
                    const SizedBox(height: 10),
                    const _SectionCard(
                      title: 'Additional Details (Optional)',
                      icon: null,
                      child: _DetailsTile(),
                    ),
                    const SizedBox(height: 10),
                    const _SectionCard(
                      title: 'Attach Media (Optional)',
                      icon: null,
                      child: _MediaTile(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
              decoration: const BoxDecoration(
                color: Color(0xFFF3F3F3),
                border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF8C93),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const EmergencyTrackingScreen(),
                          ),
                        );
                      },
                      child: const Text('Submit Emergency Report', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'AI will verify and dispatch immediately',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.icon, required this.child, this.trailing});

  final String title;
  final IconData? icon;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x16000000), blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (icon != null) Icon(icon, color: const Color(0xFFFF4E59)),
              if (icon != null) const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const Spacer(),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _RecordTile extends StatelessWidget {
  const _RecordTile();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFFF3B45)),
        color: const Color(0xFFFF343E),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.mic_none, color: Colors.white, size: 34),
          SizedBox(height: 6),
          Text('Tap to Start Recording', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          Text('Auto-recording enabled', style: TextStyle(fontSize: 12, color: Color(0xFFFFD7DA))),
        ],
      ),
    );
  }
}

class _LocationTile extends StatelessWidget {
  const _LocationTile();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFEFEFF1),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_outlined, color: Color(0xFF00B8D4), size: 34),
          SizedBox(height: 4),
          Text('GPS Location Captured', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
          SizedBox(height: 4),
          Text('Barangay Doyong Calasiao', style: TextStyle(fontSize: 12, color: Colors.black54)),
          SizedBox(height: 6),
          Text('Accuracy: High', style: TextStyle(fontSize: 12, color: Color(0xFF32B567))),
        ],
      ),
    );
  }
}

class _DetailsTile extends StatelessWidget {
  const _DetailsTile();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFF1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('Describe the emergency situation...', style: TextStyle(color: Colors.black54)),
    );
  }
}

class _MediaTile extends StatelessWidget {
  const _MediaTile();
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _MediaButton(icon: Icons.photo_camera_outlined, label: 'Photo')),
        SizedBox(width: 12),
        Expanded(child: _MediaButton(icon: Icons.videocam_outlined, label: 'Video')),
      ],
    );
  }
}

class _MediaButton extends StatelessWidget {
  const _MediaButton({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: BoxDecoration(
        color: const Color(0xFFC9EFD0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF59CC73)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xFF1CBF47)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Color(0xFF12A53A))),
          const Icon(Icons.check_circle_outline, size: 14, color: Color(0xFF1CBF47)),
        ],
      ),
    );
  }
}

class _RecordingIndicator extends StatelessWidget {
  const _RecordingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.circle, size: 8, color: Color(0xFFFF3B45)),
        SizedBox(width: 4),
        Text('Recording. . .', style: TextStyle(fontSize: 12, color: Color(0xFFFF3B45))),
      ],
    );
  }
}

