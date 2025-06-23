import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_mobile_field/intl_mobile_field.dart';
import 'package:dosytkom/features/Dashboard/presentation/screen/dashboard_screen.dart';
import 'package:dosytkom/features/auth/presentation/Widget/buildTextField.dart';
import 'package:dosytkom/features/auth/presentation/screen/forgot_password.dart';
import 'package:dosytkom/features/auth/presentation/screen/signup_screen.dart';
import 'package:dosytkom/features/auth/presentation/cubit/login_cubit.dart';
import 'package:dosytkom/features/auth/presentation/state/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  String? fullPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginStateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        } else if (state is LoginStateSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginStateLoading;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: 550.0,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Image.asset('assets/images/logo.png', height: 100),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              "سجّل الدخول للمتابعة",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF12416F).withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 40,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFF6F9FC),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF12416F),
                              ),
                            ),
                            const SizedBox(height: 30),

                            // رقم الهاتف
                            IntlMobileField(
                              initialCountryCode: "JO",
                              decoration: InputDecoration(
                                hintText: "رقم الهاتف",
                                hintStyle: const TextStyle(color: Color(0xFFB7B4B4)),
                                filled: true,
                                fillColor: Colors.grey.shade400,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 20,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF0E73B7),
                                    width: 1.5,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: Color(0xFFB7B4B4),
                                ),
                              ),
                              invalidNumberMessage: "رقم غير صالح",
                              favorite: ["JO", "SA", "AE"],
                              favoriteCountryCodePosition: Position.trailing,
                              onChanged: (number) {
                                fullPhoneNumber = "${number.countryCode}${number.number}";
                              },
                              validator: (mobileNumber) {
                                if (mobileNumber == null || mobileNumber.number.isEmpty) {
                                  return 'يرجى إدخال رقم الهاتف';
                                }
                                if (!RegExp(r'^[0-9]+$').hasMatch(mobileNumber.number)) {
                                  return 'مسموح فقط بالأرقام';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 20),

                            // كلمة المرور
                            buildTextField(
                              "كلمة المرور",
                              isPassword: true,
                              icon: Icons.lock,
                              controller: passwordController,
                            ),

                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ForgotPasswordScreen(),
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    "هل نسيت كلمة المرور؟",
                                    style: TextStyle(
                                      color: const Color(0xFF0E73B7),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // زر الدخول
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0E73B7),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 3,
                                ),
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        final password = passwordController.text.trim();
                                        if (fullPhoneNumber == null || password.isEmpty) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text("يرجى تعبئة جميع الحقول"),
                                            ),
                                          );
                                          return;
                                        }

                                        context.read<LoginCubit>().login(
                                              phone: fullPhoneNumber!,
                                              password: password,
                                            );
                                      },
                                child: isLoading
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text(
                                        "دخول",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // إنشاء حساب
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "إنشاء حساب",
                                    style: TextStyle(
                                      color: const Color(0xFF0E73B7),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Text(
                                  "ليس لديك حساب؟ ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
