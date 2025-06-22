import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewOrder extends StatefulWidget {
  const NewOrder({super.key});

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  final List<String> semester = ['الفصل الأول', 'الفصل الثاني'];
  final List<String> teacher = ['احمد', 'محمد'];
  final List<String> grade = ['الأول', 'الثاني'];
  final List<String> subject = ['عربي', 'رياضيات'];
  final List<String> topic = ['درس2', 'درس1'];
  final List<String> course = ['كورس2', 'كورس1'];
  final List<String> branch = ['علمي', 'ادبي'];


  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  void _showSnackBar(String title, String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(message),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F9FC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF6F9FC),

          title: const Text(
            'إنشاء طلب جديد',
            style: TextStyle(
              color: Color(0xFF12416F),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,

          elevation: 0,
          iconTheme: const IconThemeData(color: Color(0xFF12416F)),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Order Information Section
                    _buildSectionCard('معلومات الطلب', Icons.info_outline, [
                      _buildDropdownRow('المعلم', teacher, 'الصف', grade),
                      const SizedBox(height: 16),
                      _buildDropdownRow('المادة', subject, 'الفصل', semester),
                      const SizedBox(height: 16),
                      _buildCustomDropdown('الفرع', branch),

                    SizedBox(height: 16,),
                    ]),
                    const SizedBox(height: 20),

                    // Quantity Section
                    _buildSectionCard(
                      'الكمية المطلوبة',
                      Icons.format_list_numbered,
                      [
                        TextFormField(
                          controller: quantityController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            labelText: 'العدد المطلوب',
                            hintText: 'أدخل عدد الدوسيات المطلوبة',
                            filled: true,
                            fillColor: const Color(0xFFF9FAFB),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF0E73B7),
                                width: 1.5,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            prefixIcon: const Icon(
                              Icons.numbers,
                              color: Color(0xFFB7B4B4),
                            ),
                          ),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF12416F),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          text: 'تأكيد الطلب',
                          icon: Icons.check_circle,
                          backgroundColor: const Color(0xFF0E73B7),
                          onPressed: () {
                            if (quantityController.text.trim().isEmpty) {
                              quantityController.text = '1';
                            }
                            _showSnackBar(
                              "تم التأكيد",
                              "تم إرسال الطلب بنجاح",
                              Colors.green.shade100,
                            );
                          },
                        ),
                        _buildActionButton(
                          text: 'إلغاء',
                          icon: Icons.cancel,
                          backgroundColor: Colors.white,
                          textColor: const Color(0xFF0E73B7),
                          borderColor: const Color(0xFF0E73B7),
                          onPressed: () {
                            _showSnackBar(
                              "تم الإلغاء",
                              "تم إلغاء العملية",
                              Colors.red.shade100,
                            );
                          },
                        ),
                      ],
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

  Widget _buildDropdownRow(
    String hint1,
    List<String> items1,
    String hint2,
    List<String> items2,
  ) {
    return Row(
      children: [
        Expanded(child: _buildCustomDropdown(hint1, items1)),
        const SizedBox(width: 16),
        Expanded(child: _buildCustomDropdown(hint2, items2)),
      ],
    );
  }

  Widget _buildCustomDropdown(String hint, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: const Color(0xFFB7B4B4)),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF0E73B7), width: 1.5),
        ),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 15, color: Color(0xFF12416F)),
          ),
        );
      }).toList(),
      onChanged: (value) {},
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF12416F)),
    );
  }

  Widget _buildSectionCard(String title, IconData icon, List<Widget> children) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF0E73B7)),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF12416F),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required Color backgroundColor,
    Color textColor = Colors.white,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 160,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: 1.5)
                : BorderSide.none,
          ),
          elevation: 3,
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 22),
        label: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
