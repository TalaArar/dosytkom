import 'package:flutter/material.dart';

class DosyScreen extends StatefulWidget {
  const DosyScreen({super.key});

  @override
  State<DosyScreen> createState() => _DosyScreenState();
}

class _DosyScreenState extends State<DosyScreen> {
  final List<String> semester = ['الفصل الأول', 'الفصل الثاني'];
  final List<String> teacher = ['احمد', 'محمد'];
  final List<String> grade = ['الأول', 'الثاني'];
  final List<String> subject = ['عربي', 'رياضيات'];
  final List<String> topic = ['درس2', 'درس1'];
  final List<String> course = ['كورس2', 'كورس1'];

  final List<Order> ordersData = [
    Order(
      name: 'دوسية الرياضيات',
      teacher: 'محمد أحمد',
      price: 25,
      state: 'متوفر',
      semester: 'الفصل الأول',
      part: 'العلمي',
      imageUrl: 'https://img.freepik.com/free-vector/math-background_23-2148146940.jpg',
    ),
    Order(
      name: 'دوسية اللغة العربية',
      teacher: 'أحمد خالد',
      price: 20,
      state: 'متوفر',
      semester: 'الفصل الثاني',
      part: 'الأدبي',
      imageUrl: 'https://img.freepik.com/free-vector/arabic-pattern-background_52683-84330.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            'الدوسيات التعليمية',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF12416F),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
        ),
        body: Container(
          color: const Color(0xFFF6F9FC),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: 550.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'تصفية البحث',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF12416F),
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildFilterSection(),
                      const SizedBox(height: 25),
                      Text(
                        'الدوسيات المتاحة (${ordersData.length})',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF12416F),
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildOrdersList(),
                     
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      children: [
        _buildDropdownRow('المعلم', teacher, 'الصف', grade),
        const SizedBox(height: 16),
        _buildDropdownRow('المادة', subject, 'الفرع', semester),
        const SizedBox(height: 16),
        _buildSingleDropdown('الفصل', topic), // بدون اسم الدوسية
      ],
    ),
  );
}
Widget _buildSingleDropdown(String hint, List<String> list) {
  return Row(
    children: [
      Expanded(child: _buildDropdown(hint, list)),
    ],
  );
}


  Widget _buildDropdownRow(String hint1, List<String> list1, String hint2, List<String> list2) {
    return Row(
      children: [
        Expanded(
          child: _buildDropdown(hint1, list1),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildDropdown(hint2, list2),
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: const Color(0xFFB7B4B4)),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF0E73B7), width: 1.5),
        ),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF12416F),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {},
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF12416F)),
    );
  }

  Widget _buildOrdersList() {
    return ListView.builder(
      itemCount: ordersData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final order = ordersData[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Image and basic info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(0),
                    ),
                    child: Container(
                      width: 120,
                      height: 140,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(order.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF12416F),
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildInfoRow('المعلم:', order.teacher),
                          _buildInfoRow('الفصل:', order.semester),
                          _buildInfoRow('الفرع:', order.part),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.inventory, size: 18, color: Colors.green),
                              const SizedBox(width: 4),
                              Text(
                                order.state,
                                style: const TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Price and action
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${order.price} د.أ',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E73B7),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E73B7),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text('عرض التفاصيل'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF12416F).withOpacity(0.7),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF12416F),
            ),
          ),
        ],
      ),
    );
  }
}

class Order {
  final String name;
  final String teacher;
  final int price;
  final String state;
  final String semester;
  final String part;
  final String imageUrl;

  Order({
    required this.name,
    required this.teacher,
    required this.price,
    required this.state,
    required this.semester,
    required this.part,
    required this.imageUrl,
  });
}