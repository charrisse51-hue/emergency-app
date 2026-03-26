import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/logo/logo.png', height: 56, alignment: Alignment.centerLeft),
              const SizedBox(height: 10),
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFF1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.location_on_outlined, color: Colors.black54),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Dagupan City, Pangasinan\nBarangay Poblacion Oeste',
                        style: TextStyle(height: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4E59),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Notifications', style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700)),
                          Text('Emergency updates & alerts', style: TextStyle(color: Color(0xFFFFE2E4))),
                        ],
                      ),
                    ),
                    Icon(Icons.notifications_active_outlined, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Text('NEW', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 10),
              const _NotificationCard(
                title: 'Emergency Report Submitted',
                body: 'Your fire emergency report #DGP-2026-0119 has\nbeen submitted successfully.',
                time: '2 minutes ago',
                borderColor: Color(0xFFFF9CA5),
                bgColor: Color(0xFFFFF2F3),
                icon: Icons.error_outline,
                iconColor: Color(0xFFFF5D69),
              ),
              const SizedBox(height: 10),
              const _NotificationCard(
                title: 'Responder Dispatched',
                body: 'Fire Truck #3 has been dispatched to your\nlocation.\nETA: 4 minutes',
                time: '5 minutes ago',
                borderColor: Color(0xFFFFB56E),
                bgColor: Color(0xFFFFF6EE),
                icon: Icons.local_shipping_outlined,
                iconColor: Color(0xFFFF8C40),
              ),
              const SizedBox(height: 10),
              const _NotificationCard(
                title: 'Responder En Route',
                body: 'Fire Team is on the way.\nCurrent distance: 2.3 km.',
                time: '8 minutes ago',
                borderColor: Color(0xFF75B5FF),
                bgColor: Color(0xFFF0F7FF),
                icon: Icons.schedule,
                iconColor: Color(0xFF2F8FFF),
              ),
              const SizedBox(height: 14),
              const Text('EARLIER', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87)),
              const SizedBox(height: 10),
              const _NotificationCard(
                title: 'Previous Emergency Resolved',
                body: 'Your medical emergency report\n#DGP-2026-0118-045 has been successfully\nresolved',
                time: '2 hours ago',
                borderColor: Color(0xFFC8C8C8),
                bgColor: Color(0xFFF8F8F8),
                icon: Icons.schedule,
                iconColor: Color(0xFF5BA7FF),
                showDot: false,
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 44,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    side: const BorderSide(color: Color(0xFFBFBFBF)),
                  ),
                  onPressed: () {},
                  child: const Text('Mark all as Read', style: TextStyle(color: Colors.black54)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: const Color(0xFFFF4E59),
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          if (index == 0) Navigator.of(context).pop();
          if (index == 1) Navigator.of(context).pop();
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    required this.title,
    required this.body,
    required this.time,
    required this.borderColor,
    required this.bgColor,
    required this.icon,
    required this.iconColor,
    this.showDot = true,
  });

  final String title;
  final String body;
  final String time;
  final Color borderColor;
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white.withAlpha(140),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(body, style: const TextStyle(fontSize: 13, color: Colors.black54, height: 1.3)),
                const SizedBox(height: 6),
                Text(time, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          if (showDot) const Text('•', style: TextStyle(color: Color(0xFFFF3A45), fontSize: 20)),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, color: Colors.black45),
        ],
      ),
    );
  }
}

