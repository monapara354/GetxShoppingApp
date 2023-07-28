import 'package:get/get.dart';
import 'package:shopping_getx/model/cart.dart';
import 'package:shopping_getx/model/order.dart';

class OrderItem extends GetxController {
  List<Order> _orders = [];
  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<Cart> products, double total) {
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            total: total,
            cartProduct: products,
            dateTime: DateTime.now()));

    update();
  }
}
