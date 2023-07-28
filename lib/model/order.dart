import 'package:shopping_getx/model/cart.dart';

class Order {
  final String id;
  final double total;
  final List<Cart> cartProduct;
  final DateTime dateTime;

  Order({
    required this.id,
    required this.total,
    required this.cartProduct,
    required this.dateTime,
  });
}
