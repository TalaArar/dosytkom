import 'package:flutter/material.dart';

class PreviousOrderScreen extends StatefulWidget {
  const PreviousOrderScreen({super.key});

  @override
  State<PreviousOrderScreen> createState() => _PreviousOrderState();
}

class _PreviousOrderState extends State<PreviousOrderScreen> {
  final List<Order> ordersData = [
    Order(
      name: 'دوسية الرياضيات', 
      teacher: 'محمد أحمد', 
      price: 2, 
      state: 'قيد التحضير', 
      semester: 'الفصل الأول', 
      part: 'القسم العلمي',
      
    ),
    Order(
      name: 'دوسية الفيزياء', 
      teacher: 'أحمد خالد', 
      price: 3, 
      state: 'مكتمل', 
      semester: 'الفصل الأول', 
      part: 'القسم العلمي',
     
    ),
    Order(
      name: 'دوسية الكيمياء', 
      teacher: 'سامي محمد', 
      price: 2.5, 
      state: 'ملغي', 
      semester: 'الفصل الثاني', 
      part: 'القسم الأدبي',
     
    ),
    Order(
      name: 'دوسية اللغة العربية', 
      teacher: 'ليلى أحمد', 
      price: 3, 
      state: 'مكتمل', 
      semester: 'الفصل الثاني', 
      part: 'القسم الأدبي',
     
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xFF12416f)),
          title: const Text(
            'الطلبات السابقة',
            style: TextStyle(
              color: Color(0xFF12416f),
              fontSize: 22,
              fontWeight: FontWeight.bold,
             
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16),
          ),
        ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          itemCount: ordersData.length,
          itemBuilder: (context, index) {
            return OrderCard(order: ordersData[index]);
          },
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  Color _getStateColor(String state) {
    switch (state) {
      case 'قيد التحضير':
        return const Color(0xFF12416f);
      case 'مكتمل':
        return const Color(0xFF0e73b7);
      case 'ملغي':
        return Colors.red;
      default:
        return const Color(0xFFb7b4b4);
    }
  }

  IconData _getStateIcon(String state) {
    switch (state) {
      case 'قيد التحضير':
        return Icons.access_time;
      case 'مكتمل':
        return Icons.check_circle;
      case 'ملغي':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with order number and date
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF12416f).withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFFb7b4b4).withOpacity(0.3),
                  width: 1
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               
               
              ],
            ),
          ),
          
          // Order details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Book name and icon
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0e73b7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.book,
                        color: Color(0xFF0e73b7),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        order.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF12416f),
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Details grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    _buildDetailItem('المعلم', order.teacher, Icons.person),
                    _buildDetailItem('السعر', '${order.price} د.أ', Icons.attach_money),
                    _buildDetailItem('الفصل', order.semester, Icons.school),
                    _buildDetailItem('الفرع', order.part, Icons.category),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Status indicator
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: _getStateColor(order.state).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _getStateColor(order.state).withOpacity(0.3),
                      width: 1
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getStateIcon(order.state),
                        color: _getStateColor(order.state),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        order.state,
                        style: TextStyle(
                          color: _getStateColor(order.state),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xFF0e73b7),
          size: 18,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFb7b4b4),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF12416f),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Order {
  final String name;
  final String teacher;
  final double price;
  final String state;
  final String semester;
  final String part;
 

  Order({
    required this.name,
    required this.teacher,
    required this.price,
    required this.state,
    required this.semester,
    required this.part,
   
  });
}