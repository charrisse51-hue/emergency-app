import 'package:flutter/material.dart';

import 'notifications_screen.dart';
import 'report_details_screen.dart';

class ReportHistoryScreen extends StatelessWidget {
  const ReportHistoryScreen({super.key});

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
                          Text('Report History', style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700)),
                          Text('Your past emergency reports', style: TextStyle(color: Color(0xFFFFE2E4))),
                        ],
                      ),
                    ),
                    Icon(Icons.filter_list, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Row(
                children: [
                  Expanded(child: _StatCard(value: '5', label: 'Total')),
                  SizedBox(width: 10),
                  Expanded(child: _StatCard(value: '6', label: 'Resolved')),
                  SizedBox(width: 10),
                  Expanded(child: _StatCard(value: '1', label: 'Active')),
                ],
              ),
              const SizedBox(height: 14),
              _HistoryCard(
                title: 'Fire Emergency',
                status: 'En Route',
                statusColor: Color(0xFF1487FF),
                subtitle: 'ID: DGP-2026-0119-001\nFire Department\nJan 19, 2026  ·  2:30 PM',
                icon: Icons.local_fire_department_outlined,
                iconBg: Color(0xFFFFE9D6),
                iconColor: Color(0xFFFF9340),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const ReportDetailsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              _HistoryCard(
                title: 'Medical Emergency',
                status: 'Resolved',
                statusColor: Color(0xFF2FBE58),
                subtitle: 'ID: DGP-2026-0119-001\nCity Health\nJan 19, 2026  ·  2:30 PM',
                icon: Icons.favorite_border,
                iconBg: Color(0xFFFFE0E3),
                iconColor: Color(0xFFFF6677),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const ReportDetailsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              _HistoryCard(
                title: 'Medical Emergency',
                status: 'Resolved',
                statusColor: Color(0xFF2FBE58),
                subtitle: 'ID: DGP-2026-0119-001\nCity Health\nJan 19, 2026  ·  2:30 PM',
                icon: Icons.favorite_border,
                iconBg: Color(0xFFFFE0E3),
                iconColor: Color(0xFFFF6677),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const ReportDetailsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
        selectedItemColor: const Color(0xFFFF4E59),
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pop();
          }
          if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => const NotificationsScreen(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x16000000), blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value, style: const TextStyle(fontSize: 20, color: Color(0xFF16B7CA))),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({
    required this.title,
    required this.status,
    required this.statusColor,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.onTap,
  });

  final String title;
  final String status;
  final Color statusColor;
  final String subtitle;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Color(0x16000000), blurRadius: 8, offset: Offset(0, 2))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 18, backgroundColor: iconBg, child: Icon(icon, color: iconColor)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: statusColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(status, style: const TextStyle(color: Colors.white, fontSize: 11)),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.chevron_right, color: Colors.black45),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle, style: const TextStyle(fontSize: 13, color: Colors.black54, height: 1.35)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

