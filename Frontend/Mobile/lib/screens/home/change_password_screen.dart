import 'package:flutter/material.dart';

import '../verification/password_updated_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _hideCurrent = true;
  bool _hideNew = true;
  bool _hideConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 16),
          child: Form(
            key: _formKey,
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
                              'Change Password',
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Update your account password',
                              style: TextStyle(color: Color(0xFFFFE2E4), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Image.asset('assets/logo/logo.png', height: 28),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Enter and Confirm your new password'),
                const SizedBox(height: 14),
                const Text('Current Password', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                _passwordField(
                  controller: _currentPasswordController,
                  obscureText: _hideCurrent,
                  onToggle: () => setState(() => _hideCurrent = !_hideCurrent),
                  validator: (value) => (value == null || value.isEmpty) ? 'Current password is required' : null,
                ),
                const SizedBox(height: 14),
                const Text('New Password', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                _passwordField(
                  controller: _newPasswordController,
                  obscureText: _hideNew,
                  onToggle: () => setState(() => _hideNew = !_hideNew),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'New password is required';
                    if (value.length < 8) return 'Password must be at least 8 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 14),
                const Text('Confirm Password', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                _passwordField(
                  controller: _confirmPasswordController,
                  obscureText: _hideConfirm,
                  onToggle: () => setState(() => _hideConfirm = !_hideConfirm),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please confirm your password';
                    if (value != _newPasswordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 46,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4E59),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const PasswordUpdatedScreen(),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.lock_outline),
                    label: const Text('Update Your Password'),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4D9),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE4C36A)),
                  ),
                  child: const Text(
                    'Security Tip\n'
                    'Never share your password with anyone. RescueLink staff\n'
                    'will never ask for your password. Change it regularly to keep\n'
                    'your account secure.',
                    style: TextStyle(color: Color(0xFF9A7A1F), height: 1.35),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordField({
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggle,
    required String? Function(String?) validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 1))],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          hintText: '••••••••',
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
          ),
        ),
      ),
    );
  }
}

