import 'package:flutter/material.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
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
                            'Report Details',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'DGP-2026-0118-045',
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
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDF1E2),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFF9FD5AB)),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.check_circle_outline, color: Color(0xFF32B567), size: 34),
                    SizedBox(height: 6),
                    Text('Successfully Resolved', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF207E43))),
                    Text('Emergency handled by City Health', style: TextStyle(fontSize: 12, color: Color(0xFF207E43))),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const _CardSection(
                title: 'Incident Summary',
                icon: Icons.local_fire_department_outlined,
                child: Column(
                  children: [
                    _InfoRow(icon: Icons.local_fire_department_outlined, label: 'Emergency Type', value: 'Medical Emergency'),
                    _InfoRow(icon: Icons.calendar_today_outlined, label: 'Date & Time', value: 'January 18, 2026 • 10:15 AM'),
                    _InfoRow(icon: Icons.location_on_outlined, label: 'Location', value: 'Poblacion Oeste, Dagupan City\nCoordinates: 16.0422° N, 120.3337° E'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const _CardSection(
                title: 'Voice Recording',
                icon: Icons.mic_none,
                child: _VoicePreview(),
              ),
              const SizedBox(height: 10),
              const _CardSection(
                title: 'Attach Media',
                icon: null,
                child: _MediaPreview(),
              ),
              const SizedBox(height: 10),
              const _CardSection(
                title: 'Response Details',
                icon: null,
                child: _ResponseDetails(),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFDDF1E2),
                  border: Border.all(color: const Color(0xFF9FD5AB)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check_circle_outline, color: Color(0xFF32B567)),
                        SizedBox(width: 8),
                        Text('Emergency Resolved', style: TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF207E43))),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Patient was transported to Pangasinan Provincial Hospital. Vital signs stable.\n'
                      'Resolved on Jan 18, 2026 at 10:36 AM',
                      style: TextStyle(fontSize: 12, color: Color(0xFF207E43), height: 1.3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardSection extends StatelessWidget {
  const _CardSection({required this.title, required this.icon, required this.child});
  final String title;
  final IconData? icon;
  final Widget child;

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
              if (icon != null) Icon(icon, color: const Color(0xFFFF8C40)),
              if (icon != null) const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.label, required this.value});
  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 16, backgroundColor: const Color(0xFFEAF0F7), child: Icon(icon, size: 18, color: const Color(0xFF67A0D8))),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.w600, height: 1.25)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VoicePreview extends StatelessWidget {
  const _VoicePreview();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEEF0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFB5BD)),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFFF4E59),
            child: Icon(Icons.play_arrow, color: Colors.white),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(value: 0.45, minHeight: 4, color: Color(0xFFFF95A0), backgroundColor: Color(0xFFFFCDD3)),
                SizedBox(height: 6),
                Text('Duration 0:45 / 1:38', style: TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MediaPreview extends StatelessWidget {
  const _MediaPreview();
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: _MediaBox(icon: Icons.photo_camera_outlined, label: 'Photo')),
        SizedBox(width: 10),
        Expanded(child: _MediaBox(icon: Icons.videocam_outlined, label: 'Video')),
      ],
    );
  }
}

class _MediaBox extends StatelessWidget {
  const _MediaBox({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFF1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black45),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

class _ResponseDetails extends StatelessWidget {
  const _ResponseDetails();
  @override
  Widget build(BuildContext context) {
    const labels = ['Department', 'Response Time', 'Responder', 'Severity', 'Victims'];
    const values = ['City Health', '6 minutes', 'EMT Unit 2', 'Medium', '1 person'];
    return Column(
      children: List.generate(
        labels.length,
        (i) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            children: [
              Expanded(child: Text(labels[i], style: const TextStyle(color: Colors.black54))),
              Text(values[i], style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

