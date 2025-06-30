import 'package:dosytkom/features/NewOrder/presentation/screen/new_order.dart';
import 'package:flutter/material.dart';


class TalabatScreen extends StatefulWidget {
  const TalabatScreen({super.key});

  @override
  State<TalabatScreen> createState() => _TalabatScreenState();
}

class _TalabatScreenState extends State<TalabatScreen> {
  final List<Order> ordersData = [
    Order(
      name: 'دوسية الرياضيات', 
      teacher: 'محمد أحمد', 
      price: 2, 
      state: 'متوفر', 
      semester: 'الفصل الأول', 
      part: 'القسم العلمي',
      imagePath: 'assets/images/math.png'
    ),
    Order(
      name: 'دوسية الفيزياء', 
      teacher: 'أحمد خالد', 
      price: 3, 
      state: 'متوفر', 
      semester: 'الفصل الأول', 
      part: 'القسم العلمي',
      imagePath: 'assets/images/physics.png'
    ),
    Order(
      name: 'دوسية الكيمياء', 
      teacher: 'سامي محمد', 
      price: 2, 
      state: 'متوفر', 
      semester: 'الفصل الثاني', 
      part: 'القسم الأدبي',
      imagePath: 'assets/images/chemistry.png'
    ),
    Order(
      name: 'دوسية اللغة العربية', 
      teacher: 'ليلى أحمد', 
      price: 3, 
      state: 'متوفر', 
      semester: 'الفصل الثاني', 
      part: 'القسم الأدبي',
      imagePath: 'assets/images/arabic.png'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F9FC),
        appBar: AppBar(
          backgroundColor: const Color(0xFF12416F),
          title: const Text(
            'قائمة الطلبات',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SafeArea(
          child: Column(
            children: [
            
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListView.builder(
                    itemCount: ordersData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final order = ordersData[index];
                      return _buildOrderCard(order);
                    },
                  ),
                ),
              ),
              // Action Buttons
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      
    );
  }

  

  

  Widget _buildOrderCard(Order order) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Image
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(order.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Order Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          order.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF12416F),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0E73B7).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${order.price} د.أ',
                          style: const TextStyle(
                            color: Color(0xFF0E73B7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildDetailRow('المعلم', order.teacher),
                  _buildDetailRow('الفصل', order.semester),
                  _buildDetailRow('الفرع', order.part),
                  const SizedBox(height: 8),
                  // Status
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 16,
                        color: const Color(0xFF0E73B7),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        order.state,
                        style: const TextStyle(
                          color: Color(0xFF0E73B7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFFB7B4B4),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF12416F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                'تأكيد الطلب',
                const Color(0xFF0E73B7),
                Icons.check_circle,
                () {},
              ),
              _buildActionButton(
                'إلغاء الطلب',
                Colors.red,
                Icons.cancel,
                () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildEditButton(),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 150,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrderScreen()));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF12416F)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit, color: Color(0xFF12416F)),
            SizedBox(width: 8),
            Text(
              'تعديل الطلب',
              style: TextStyle(
                color: Color(0xFF12416F),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
  final String imagePath;

  Order({
    required this.name,
    required this.teacher,
    required this.price,
    required this.state,
    required this.semester,
    required this.part,
    required this.imagePath,
  });
}