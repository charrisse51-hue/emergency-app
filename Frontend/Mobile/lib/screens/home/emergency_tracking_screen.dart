import 'package:flutter/material.dart';

class EmergencyTrackingScreen extends StatelessWidget {
  const EmergencyTrackingScreen({super.key});

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
                            'Emergency Tracking',
                            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'incident #DGP-2026-0119-001',
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF5E6C), Color(0xFF6BAA32)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: const [BoxShadow(color: Color(0x1F000000), blurRadius: 10, offset: Offset(0, 3))],
                ),
                child: const Column(
                  children: [
                    Icon(Icons.local_shipping_outlined, color: Colors.white, size: 34),
                    SizedBox(height: 4),
                    Text('5 min', style: TextStyle(fontSize: 46, color: Colors.white, fontWeight: FontWeight.w700)),
                    Text('Estimated Time of Arrival', style: TextStyle(color: Color(0xFFFFF4F4))),
                    SizedBox(height: 4),
                    Text('Responder is 2.3 km away', style: TextStyle(color: Color(0xFFFFF4F4), fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const _CardContainer(
                title: 'Status Timeline',
                child: Column(
                  children: [
                    _TimelineItem(icon: Icons.check_circle_outline, title: 'Submitted', subtitle: 'Completed at 12:52 AM', done: true),
                    _TimelineItem(icon: Icons.local_shipping_outlined, title: 'Dispatched', subtitle: 'Completed at 12:58 AM', done: true),
                    _TimelineItem(icon: Icons.location_on_outlined, title: 'En Route', subtitle: 'In Progress', done: false),
                    _TimelineItem(icon: Icons.check_circle_outline, title: 'Resolved', subtitle: 'In Progress', done: false),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const _CardContainer(
                title: 'Assigned Department',
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFFFE9D6),
                      child: Icon(Icons.local_fire_department_outlined, color: Color(0xFFFF9340)),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Dagupan Fire Department\nFire Truck #3 - Station 1\nUnit Commander: FO2 Santos, M.',
                        style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.25),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const _CardContainer(
                title: 'Live Location',
                child: _MapPreview(),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.call_outlined),
                      label: const Text('Call Responder'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble_outline),
                      label: const Text('Send info'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFDDF0FF),
                  border: Border.all(color: const Color(0xFF91BDF2)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.verified_user_outlined, color: Color(0xFF3264A8)),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'All responders are verified and blockchain-authenticated',
                        style: TextStyle(color: Color(0xFF335B98)),
                      ),
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

class _CardContainer extends StatelessWidget {
  const _CardContainer({required this.title, required this.child});
  final String title;
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
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.done,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: done ? const Color(0xFFDDF5E5) : const Color(0xFFE9E9EB),
            child: Icon(icon, size: 20, color: done ? const Color(0xFF3FAF65) : const Color(0xFF797979)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                Text(subtitle, style: TextStyle(fontSize: 12, color: done ? Colors.black54 : const Color(0xFFFF6A77))),
              ],
            ),
          ),
          Icon(Icons.check_circle_outline, size: 18, color: done ? const Color(0xFF7DC68F) : const Color(0xFFCFCFCF)),
        ],
      ),
    );
  }
}

class _MapPreview extends StatelessWidget {
  const _MapPreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFF1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on_outlined, color: Color(0xFF00B8D4), size: 34),
          Text('Responder Location', style: TextStyle(fontWeight: FontWeight.w700)),
          Text('Real-time tracking active', style: TextStyle(fontSize: 12, color: Colors.black54)),
          SizedBox(height: 6),
          Text('Your Location   •   Responder', style: TextStyle(fontSize: 11, color: Colors.black54)),
        ],
      ),
    );
  }
}

