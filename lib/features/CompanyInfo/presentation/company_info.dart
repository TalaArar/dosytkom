import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'معلومات الشركة',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
           backgroundColor: const Color(0xFF0E73B7),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    // // Logo with decorative container
                    // Container(
                    //   padding: EdgeInsets.all(8),
                    //   decoration: BoxDecoration(color: Colors.white),
                    //   child: SizedBox(
                    //     child: Image.asset(
                    //       'assets/images/logo.png',
                    //       height: 140,
                    //       width: 300,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(height: 20),
                    Text(
                      'ادرس جو',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF12416f),
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'منصة التعليم الأسرع انتشاراً',
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFFb7b4b4),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // الهاتف
                    InfoCard(
                      icon: Icons.phone_rounded,
                      title: 'رقم الهاتف',
                      content: '96265506565+',
                      iconColor: const Color(0xFF0e73b7),
                    ),

                    // العنوان
                    InfoCard(
                      icon: Icons.location_on_rounded,
                      title: 'العنوان',
                      content:
                          'المدينة الرياضية - شارع الشهيد، مجمع ياسر السهلي، الطابق الأرضي، عمان - الأردن',
                      iconColor: const Color(0xFF0e73b7),
                    ),

                    // التعريف بالشركة
                    InfoCard(
                      icon: Icons.info_rounded,
                      title: 'نبذة عن الشركة',
                      content:
                          'منصة "ادرس جو" هي المنصة التعليمية الأسرع انتشارًا في الأردن، تستهدف طلبة التوجيهي، SAT، والجامعات، من خلال محاضرات مصورة عالية الجودة يقدمها نخبة من المدرسين. وتهدف المنصة إلى تطوير التعليم وقدرات الطلبة بأسلوب عصري.',
                      iconColor: const Color(0xFF0e73b7),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color iconColor;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFb7b4b4).withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF12416f),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
