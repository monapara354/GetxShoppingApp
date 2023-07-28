import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/controller/order_item.dart';
import 'package:shopping_getx/widgets/order_detail.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderCont = Get.put(OrderItem());
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Order Deatils',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 2.0,
      ),
      body: GetBuilder<OrderItem>(
        builder: (controller) {
          if (controller.orders.toList().isEmpty) {
            return Center(
              child: Text(
                'No Orders!',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: screenheight * .04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return OrderDetail(order: controller.orders[index]);
            },
            itemCount: controller.orders.length,
          );
        },
      ),
    );
  }
}
