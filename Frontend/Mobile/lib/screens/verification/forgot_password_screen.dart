import 'package:flutter/material.dart';

import 'verify_number_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              const SizedBox(height: 20),
              Image.asset(
                'assets/image-assets/forgotpassword_illustrations.png',
                height: 210,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 12),
              const Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 46, fontWeight: FontWeight.w800, color: Colors.black),
              ),
              const SizedBox(height: 2),
              const Text(
                'Recover your RescueLink account securely',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFDFF0FF),
                  border: Border.all(color: const Color(0xFF90BDFD)),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.shield_outlined, color: Color(0xFF2577E8), size: 18),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "We'll verify your identity using the phone number\nregistered to your account.",
                        style: TextStyle(color: Color(0xFF246CE0), height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Registered Phone Number',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                    ),
                    SizedBox(height: 10),
                    _PhonePreviewField(),
                    SizedBox(height: 10),
                    Text(
                      'Enter the phone number you used\nduring registration',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFD5D5D5)),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 14),
                    Icon(Icons.check_box_outline_blank, color: Color(0xFF777777)),
                    SizedBox(width: 10),
                    Text("I'm not a robot", style: TextStyle(color: Colors.black87)),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text(
                        'reCAPTCHA\nPrivacy - Terms',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'A one-time code will be sent to your registered number',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black87),
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
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const VerifyNumberScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.phone_in_talk_outlined),
                  label: const Text(
                    'Request Verification Code',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
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

class _PhonePreviewField extends StatelessWidget {
  const _PhonePreviewField();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        children: [
          SizedBox(width: 8),
          Text('+63', style: TextStyle(fontSize: 20, color: Colors.black54)),
          SizedBox(width: 10),
          VerticalDivider(width: 1, color: Color(0xFFCECED2)),
          SizedBox(width: 10),
          Text('917 123 4567', style: TextStyle(fontSize: 20, letterSpacing: 1.1, color: Colors.black54)),
        ],
      ),
    );
  }
}

