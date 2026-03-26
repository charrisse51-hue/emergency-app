import 'package:flutter/material.dart';

import 'password_updated_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _hideNewPassword = true;
  bool _hideConfirmPassword = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Image.asset('assets/logo/logo.png', height: 72),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/image-assets/verifynumber_illustrations.png',
                  height: 210,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Create New Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                const Text(
                  'Choose a strong password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFDFF0FF),
                    border: Border.all(color: const Color(0xFF90BDFD)),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.lock_outline, color: Color(0xFF1B6EE4), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Password Requirements',
                            style: TextStyle(fontSize: 16, color: Color(0xFF1B4FB8), fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: Text(
                          '• Minimum 8 characters\n'
                          '• Include numbers and symbols\n'
                          '• Mix of uppercase and lowercase letters',
                          style: TextStyle(fontSize: 14, color: Color(0xFF1B6EE4), height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _PasswordFieldCard(
                  title: 'New Password',
                  hint: 'Enter new password',
                  controller: _newPasswordController,
                  obscureText: _hideNewPassword,
                  onToggleVisibility: () => setState(() => _hideNewPassword = !_hideNewPassword),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'New password is required';
                    }
                    if (!_isStrongPassword(value)) {
                      return 'Use 8+ chars with upper/lower, number, symbol';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                _PasswordFieldCard(
                  title: 'Confirm New Password',
                  hint: 'Re-enter new password',
                  controller: _confirmPasswordController,
                  obscureText: _hideConfirmPassword,
                  onToggleVisibility: () => setState(() => _hideConfirmPassword = !_hideConfirmPassword),
                  helperText: 'Passwords match',
                  helperColor: const Color(0xFF4BC77C),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 52,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4E59),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
                    label: const Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isStrongPassword(String value) {
    final hasMinLength = value.length >= 8;
    final hasUpper = RegExp(r'[A-Z]').hasMatch(value);
    final hasLower = RegExp(r'[a-z]').hasMatch(value);
    final hasNumber = RegExp(r'[0-9]').hasMatch(value);
    final hasSymbol = RegExp(r'[^A-Za-z0-9]').hasMatch(value);
    return hasMinLength && hasUpper && hasLower && hasNumber && hasSymbol;
  }
}

class _PasswordFieldCard extends StatelessWidget {
  const _PasswordFieldCard({
    required this.title,
    required this.hint,
    required this.controller,
    required this.obscureText,
    required this.onToggleVisibility,
    required this.validator,
    this.helperText,
    this.helperColor = const Color(0xFF4BC77C),
  });

  final String title;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleVisibility;
  final String? helperText;
  final Color helperColor;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: const Color(0xFFF0F0F2),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                onPressed: onToggleVisibility,
                icon: Icon(
                  obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          if (title == 'New Password') ...[
            const SizedBox(height: 8),
            // Simple visual strength indicator matching the mock style.
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const LinearProgressIndicator(
                value: 1,
                minHeight: 6,
                valueColor: AlwaysStoppedAnimation(Color(0xFF4BC77C)),
                backgroundColor: Color(0xFFE0E0E0),
              ),
            ),
            const SizedBox(height: 4),
            const Text('Password strength: Strong', style: TextStyle(fontSize: 12, color: Color(0xFF24A85E))),
          ],
          if (helperText != null) ...[
            const SizedBox(height: 8),
            Text(helperText!, style: TextStyle(fontSize: 12, color: helperColor)),
          ],
        ],
      ),
    );
  }
}

