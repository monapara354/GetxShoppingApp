import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:shopping_getx/controller/cart_items.dart';

import 'package:shopping_getx/controller/product_items.dart';

class ProductDetail extends StatefulWidget {
  String id;
  ProductDetail({super.key, required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductItems());
    final cartCont = Get.put(CartItems());
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    var product = controller.item.firstWhere(
      (element) => element.id == widget.id,
    );
    final primeColor = Colors.orange.shade400;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              setState(() {
                controller.aaa(product.id);
              });
            },
            icon: controller.fav.contains(product)
                ? Icon(
                    Icons.favorite,
                    color: primeColor,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: primeColor,
                  ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'face${product.id}',
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                width: screenwidth,
                height: screenheight * 0.45,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Container(
                  // alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 20, top: 20),
                  child: Text(
                    'Rs.${product.price.toString()}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(
                left: 35,
                top: 15,
              ),
              child: Text(
                product.description,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<CartItems>(builder: (controller) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          // padding: EdgeInsets.all(20),
          height: screenheight * 0.08,
          width: screenwidth,
          child: ElevatedButton(
            onPressed: () {
              controller.addItem(
                product.id,
                product.title,
                product.imageUrl,
                product.price,
              );
              // print('addd');
              Get.showSnackbar(
                const GetSnackBar(
                  message: 'Add item in cart!',
                  duration: Duration(seconds: 1),
                  snackStyle: SnackStyle.GROUNDED,
                  overlayBlur: 1.0,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: primeColor,
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            child: const Text(
              'Add To Cart',
              style: TextStyle(fontSize: 22),
            ),
          ),
        );
      }),
    );
  }
}
