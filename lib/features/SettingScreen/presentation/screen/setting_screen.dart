import 'package:dosytkom/features/CompanyInfo/presentation/company_info.dart';
import 'package:dosytkom/features/LibraryFile/presentation/screen/library_file.dart';
import 'package:dosytkom/features/PreviousOrder/presentation/screen/previous_order_screen.dart';
import 'package:dosytkom/features/auth/presentation/screen/login.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F9FC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6F9FC),
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xFF12416F)),
          title: const Text(
            'الإعدادات',
            style: TextStyle(
              color: Color(0xFF12416F),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                _buildSettingCard(
                  icon: Icons.account_circle_outlined,
                  activeIcon: Icons.account_circle,
                  title: 'ملف المكتبة',
                  color: const Color(0xFF0E73B7),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryFile()));
                  },
                ),
                _buildSettingCard(
                  icon: Icons.support_agent_outlined,
                  activeIcon: Icons.support_agent,
                  title: 'الدعم الفني',
                  color: const Color(0xFF12416F),
                  onTap: () {},
                ),
                _buildSettingCard(
                  icon: Icons.history_outlined,
                  activeIcon: Icons.history,
                  title: 'الطلبات السابقة',
                  color: const Color(0xFF0E73B7),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PreviousOrderScreen()));
                  },
                ),
                _buildSettingCard(
                  icon: Icons.contact_support_outlined,
                  activeIcon: Icons.contact_support,
                  title: 'تواصل معنا',
                  color: const Color(0xFF12416F),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CompanyInfo()));
                  },
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      icon: const Icon(Icons.logout, color: Colors.white, size: 22),
                      label: const Text(
                        'تسجيل الخروج',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: const Color(0xFF0E73B7),
                        shadowColor: const Color(0xFFB7B4B4).withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingCard({
    required IconData icon,
    required IconData activeIcon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: const Color(0xFFB7B4B4).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color(0xFF12416F),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Color(0xFFB7B4B4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
