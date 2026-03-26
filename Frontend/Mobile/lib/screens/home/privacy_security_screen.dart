import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool mediaAccess = true;
  bool aiIncidentAnalysis = true;
  bool biometricLogin = false;

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
                      child: Text(
                        'Privacy & Security',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Image.asset('assets/logo/logo.png', height: 28),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 96,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F1F3),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Center(
                  child: Text(
                    'PRIVACY POLICY',
                    style: TextStyle(fontSize: 22, color: Colors.black54, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('PRIVACY CONTROLS', style: TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 8),
              _card(
                child: const _DropdownTile(
                  icon: Icons.location_on_outlined,
                  title: 'Location',
                  subtitle: 'During Emergencies Only',
                ),
              ),
              const SizedBox(height: 8),
              _card(
                child: _SwitchTile(
                  icon: Icons.photo_camera_outlined,
                  title: 'Media Access Permissions',
                  subtitle: 'Allow camera and media for emergency evidence',
                  value: mediaAccess,
                  onChanged: (v) => setState(() => mediaAccess = v),
                ),
              ),
              const SizedBox(height: 8),
              _card(
                child: _SwitchTile(
                  icon: Icons.analytics_outlined,
                  title: 'AI Incident Analysis',
                  subtitle: 'Share anonymized data to improve emergency response AI',
                  value: aiIncidentAnalysis,
                  onChanged: (v) => setState(() => aiIncidentAnalysis = v),
                ),
              ),
              const SizedBox(height: 10),
              const Text('SECURITY CONTROLS', style: TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(height: 8),
              _card(
                child: _SwitchTile(
                  icon: Icons.fingerprint,
                  title: 'Biometric Login',
                  subtitle: 'Use fingerprint or Face ID for quick, secure access',
                  value: biometricLogin,
                  onChanged: (v) => setState(() => biometricLogin = v),
                ),
              ),
              const SizedBox(height: 8),
              _card(
                child: const _DropdownTile(
                  icon: Icons.timer_outlined,
                  title: 'Auto-Logout Timer',
                  subtitle: '30 minutes',
                ),
              ),
              const SizedBox(height: 8),
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _HeaderTile(
                      icon: Icons.devices_outlined,
                      title: 'Device Session Management',
                      subtitle: 'View and manage active sessions on your devices',
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFF1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('iPhone 12 Pro', style: TextStyle(fontWeight: FontWeight.w700)),
                          Text('Dagupan City', style: TextStyle(fontSize: 12, color: Colors.black54)),
                          Text('Active now', style: TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFEFF1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chrome Browser', style: TextStyle(fontWeight: FontWeight.w700)),
                          Text('Dagupan City', style: TextStyle(fontSize: 12, color: Colors.black54)),
                          Text('2 hours ago', style: TextStyle(fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('End All Other Sessions'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFDDF0FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF9BC1EA)),
                ),
                child: const Text(
                  'Your Privacy Matters\n'
                  'Security is a commitment to protecting your privacy. We only\n'
                  'collect data necessary for emergency response and never\n'
                  'share personal information with third parties without your\n'
                  'consent. All data is encrypted and stored securely following\n'
                  'government standards.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF385E8F), height: 1.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 1))],
      ),
      child: child,
    );
  }
}

class _HeaderTile extends StatelessWidget {
  const _HeaderTile({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

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
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
      ],
    );
  }
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
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
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
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

class _DropdownTile extends StatelessWidget {
  const _DropdownTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

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
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
        const Icon(Icons.keyboard_arrow_down, color: Colors.black45),
      ],
    );
  }
}

