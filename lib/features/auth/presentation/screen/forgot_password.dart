import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFF6F9FC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildHeader(),
                  const SizedBox(height: 30),
                  _buildPasswordResetForm(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xFF0E73B7).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.lock_reset,
            size: 40,
            color: Color(0xFF12416F),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "نسيت كلمة المرور؟",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF12416F),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "أدخل بريدك الإلكتروني لإرسال رابط إعادة تعيين كلمة المرور",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFFB7B4B4),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordResetForm(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            _buildEmailField(),
            const SizedBox(height: 25),
            _buildResetButton(context),
            const SizedBox(height: 15),
            _buildBackToLogin(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "البريد الإلكتروني",
        hintStyle: const TextStyle(color: Color(0xFFB7B4B4)),
        prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF12416F)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: const Color(0xFFB7B4B4).withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0E73B7), width: 1.5),
        ),
      ),
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF12416F),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color(0xFF0E73B7),
              content: Text(
                "تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        child: const Text(
          "إرسال رابط الإعادة",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildBackToLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "العودة لتسجيل الدخول",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0E73B7),
            ),
          ),
        ),
        const Text(
          "تذكرت كلمة المرور؟",
          style: TextStyle(color: Color(0xFF12416F)),
        ),
      ],
    );
  }
}
