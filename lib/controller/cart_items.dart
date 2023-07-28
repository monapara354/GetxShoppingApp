import 'package:get/get.dart';
import 'package:shopping_getx/model/cart.dart';

class CartItems extends GetxController {
  Map<String, Cart> _cartList = {};

  Map<String, Cart> get cartList {
    return {..._cartList};
  }

  int get itemCount {
    return _cartList.length;
  }

  double get total {
    var total = 0.0;
    cartList.forEach((key, value) {
      total += value.price * value.qunitiy;
    });

    return total;
  }

  void addItem(String pId, String title, String imageUrl, double price) {
    if (_cartList.containsKey(pId)) {
      _cartList.update(
          pId,
          (value) => Cart(
              id: value.id,
              title: value.title,
              imageUrl: value.imageUrl,
              price: value.price,
              qunitiy: value.qunitiy + 1));
    } else {
      _cartList.putIfAbsent(
          pId,
          () => Cart(
              id: pId,
              title: title,
              imageUrl: imageUrl,
              price: price,
              qunitiy: 1));
    }
    update();
  }

  void removeItem(String pId) {
    _cartList.remove(pId);
    update();
  }

  //            To change My Cart
  void addList(String pId, String title, String imageUrl, double price) {
    _cartList.update(
        pId,
        (value) => Cart(
            id: value.id,
            title: value.title,
            imageUrl: value.imageUrl,
            price: value.price,
            qunitiy: value.qunitiy + 1));
    update();
  }

  void removeList(String pId, String title, String imageUrl, double price) {
    _cartList.update(
        pId,
        (value) => Cart(
            id: value.id,
            title: value.title,
            imageUrl: value.imageUrl,
            price: value.price,
            qunitiy: value.qunitiy - 1));
    update();
  }

  void clear() {
    _cartList = {};
    update();
  }
}
