import 'package:flutter/material.dart';

import 'create_new_password_screen.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Image.asset('assets/logo/logo.png', height: 72),
              const SizedBox(height: 22),
              Image.asset(
                'assets/image-assets/verifynumber_illustrations.png',
                height: 210,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 14),
              const Text(
                'Verify Your Number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 44, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 2),
              const Text(
                'Enter the code we sent you',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 16),
              const Center(
                child: _ShieldIcon(),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter the 6-digit code sent to',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.black87),
              ),
              const SizedBox(height: 2),
              const Text(
                '+63 56678765434',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
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
                child: const Column(
                  children: [
                    _OtpPreviewRow(),
                    SizedBox(height: 10),
                    Text('Waiting for code', style: TextStyle(fontSize: 14, color: Colors.black54)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Resend code in 00:40',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4E59),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const CreateNewPasswordScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Verify Code',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShieldIcon extends StatelessWidget {
  const _ShieldIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xFFDCEEFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF7DB2F3)),
      ),
      child: const Icon(Icons.shield_outlined, color: Color(0xFF1F7BEA), size: 30),
    );
  }
}

class _OtpPreviewRow extends StatelessWidget {
  const _OtpPreviewRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        _OtpCell(value: '1'),
        _OtpCell(value: '2'),
        _OtpCell(value: '3'),
        _OtpCell(value: '4'),
        _OtpCell(value: '5'),
        _OtpCell(value: ''),
      ],
    );
  }
}

class _OtpCell extends StatelessWidget {
  const _OtpCell({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF666666)),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}

