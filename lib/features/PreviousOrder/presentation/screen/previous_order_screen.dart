import 'dart:developer';

import 'package:dosytkom/features/PreviousOrder/presentation/state/prev_order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/prev_order_cubit.dart';
import '../../domain/entity/order_payload_entity.dart';
import '../../domain/entity/prev_order_entitiy.dart';

class PreviousOrderScreen extends StatefulWidget {
  const PreviousOrderScreen({super.key});

  @override
  State<PreviousOrderScreen> createState() => _PreviousOrderScreenState();
}

class _PreviousOrderScreenState extends State<PreviousOrderScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PrevOrderCubit>().getPrevOrders(
          payload: <OrderPayloadEntity>[],
          status: true,
          resultMessage: '',
          refNo: null,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      
      child: Scaffold(
        backgroundColor: const Color(0xFFf5f5f5),
        appBar: _buildAppBar(),
        body: BlocBuilder<PrevOrderCubit, PrevOrderState>(
  builder: (context, state) {
    if (state is PrevOrderLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is PrevOrderLoaded) {
      final allOrders = state.orders;

      if (allOrders.isEmpty) {
        return const Center(child: Text('لا توجد طلبات سابقة'));
      }

      return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        itemCount: allOrders.length,
        itemBuilder: (context, index) {
          log(allOrders.toList().toString());
           return OrderCard(order: allOrders[index]);}
      );
    }

    if (state is PrevOrderError) {
      return Center(child: Text(state.message));
    }

    return const SizedBox.shrink();
  },
),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(
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
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      );
}

class OrderCard extends StatelessWidget {
  final OrderPayloadEntity order; // ✅ تعديل نوع الكائن

  const OrderCard({super.key, required this.order});

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
          /* رأس البطاقة */
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF12416f).withOpacity(0.05),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFFb7b4b4).withOpacity(0.3),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "طلب رقم: ${order.orderNo}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF12416f)),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0e73b7).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.book,
                          color: Color(0xFF0e73b7), size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "عدد العناصر: ${order.orderCount}",
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

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: [
                    _buildDetailItem(
                        'وقت الطلب', order.orderTime ?? 'غير متوفر'),
                    _buildDetailItem(
                        'الحالة', order.orderStatus ?? 'غير معروف'),
                  ],
                ),

                const SizedBox(height: 16),

                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.info_outline, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        'حالة الطلب: ${order.orderStatus ?? "غير معروف"}',
                        style: const TextStyle(
                          color: Colors.white,
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

  Widget _buildDetailItem(String label, String value) => Row(
        children: [
          const Icon(Icons.info, color: Color(0xFF0e73b7), size: 18),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 12, color: Color(0xFFb7b4b4))),
              Text(value,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF12416f))),
            ],
          ),
        ],
      );
}