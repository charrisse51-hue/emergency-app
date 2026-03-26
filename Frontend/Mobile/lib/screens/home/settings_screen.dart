import 'package:flutter/material.dart';

import 'barangay_information_screen.dart';
import 'change_password_screen.dart';
import 'privacy_security_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotifications = true;
  bool smsAlerts = true;
  bool locationAccess = true;
  bool microphoneAccess = true;
  bool cameraAccess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/logo/logo.png', height: 52, alignment: Alignment.centerLeft),
              const SizedBox(height: 8),
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFF1),
                  borderRadius: BorderRadius.circular(12),
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
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4E59),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Settings', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700)),
                          Text('Manage your account & preferences', style: TextStyle(color: Color(0xFFFFDDE0), fontSize: 12)),
                        ],
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _sectionCard(
                child: Row(
                  children: [
                    const CircleAvatar(radius: 26, backgroundColor: Color(0xFFE8EAEE), child: Icon(Icons.person, size: 34)),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe Cruz', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                          Text('+63 995 254 2361', style: TextStyle(color: Colors.black54)),
                          Text('Verified Citizen', style: TextStyle(color: Color(0xFF32B567), fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('Account Information', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              _sectionCard(
                child: Column(
                  children: [
                    const _ArrowTile(icon: Icons.phone_outlined, label: 'Phone Number', subtitle: '+63 945 263 1008'),
                    const Divider(height: 14),
                    _ArrowTile(
                      icon: Icons.home_outlined,
                      label: 'Barangay',
                      subtitle: 'Poblacion Oeste, Dagupan City',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const BarangayInformationScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('Emergency Contacts', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              _sectionCard(
                child: const _ArrowTile(icon: Icons.groups_outlined, label: 'Barangay Emergency Contacts', subtitle: '42 Contacts Added'),
              ),
              const SizedBox(height: 10),
              const Text('Notification', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              _sectionCard(
                child: Column(
                  children: [
                    _SwitchTile(
                      icon: Icons.notifications_none,
                      label: 'Push Notification',
                      subtitle: 'Emergency Alerts and Updates',
                      value: pushNotifications,
                      onChanged: (v) => setState(() => pushNotifications = v),
                    ),
                    const Divider(height: 14),
                    _SwitchTile(
                      icon: Icons.sms_outlined,
                      label: 'SMS Alert',
                      subtitle: 'For Message Updates',
                      value: smsAlerts,
                      onChanged: (v) => setState(() => smsAlerts = v),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('Security', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              _sectionCard(
                child: _ArrowTile(
                  icon: Icons.lock_outline,
                  label: 'Change Password',
                  subtitle: 'Update your RescueLink Password',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text('App Permissions', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              _sectionCard(
                child: Column(
                  children: [
                    _SwitchTile(
                      icon: Icons.my_location_outlined,
                      label: 'Location Access',
                      subtitle: 'Enabled',
                      value: locationAccess,
                      onChanged: (v) => setState(() => locationAccess = v),
                    ),
                    const Divider(height: 14),
                    _SwitchTile(
                      icon: Icons.mic_none,
                      label: 'Microphone',
                      subtitle: 'Enabled',
                      value: microphoneAccess,
                      onChanged: (v) => setState(() => microphoneAccess = v),
                    ),
                    const Divider(height: 14),
                    _SwitchTile(
                      icon: Icons.photo_camera_outlined,
                      label: 'Camera',
                      subtitle: 'Enabled',
                      value: cameraAccess,
                      onChanged: (v) => setState(() => cameraAccess = v),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text('About', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              _sectionCard(
                child: const Column(
                  children: [
                    _ValueTile(label: 'App Version', value: '1.1.0'),
                    Divider(height: 14),
                    _ArrowTile(icon: null, label: 'Terms of Service', subtitle: ''),
                    Divider(height: 14),
                    _ArrowTile(
                      icon: null,
                      label: 'Privacy & Security',
                      subtitle: '',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const PrivacySecurityScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 44,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5B65),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                  ),
                  onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                  icon: const Icon(Icons.logout, size: 18),
                  label: const Text('Log Out'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: const Color(0xFFFF4E59),
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          if (index == 0) Navigator.of(context).pop();
          if (index == 1) Navigator.of(context).pop();
          if (index == 2) Navigator.of(context).pop();
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

  Widget _sectionCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 1))],
      ),
      child: child,
    );
  }
}

class _ArrowTile extends StatelessWidget {
  const _ArrowTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    this.onTap,
  });

  final IconData? icon;
  final String label;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        children: [
          if (icon != null)
            CircleAvatar(
              radius: 16,
              backgroundColor: const Color(0xFFEAF0F7),
              child: Icon(icon, size: 16, color: const Color(0xFF67A0D8)),
            ),
          if (icon != null) const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
                if (subtitle.isNotEmpty) Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black45),
        ],
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: const Color(0xFFEAF0F7),
          child: Icon(icon, size: 16, color: const Color(0xFF67A0D8)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            value: value,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF32C85A),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class _ValueTile extends StatelessWidget {
  const _ValueTile({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600))),
        Text(value, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

