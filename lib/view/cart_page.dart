import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopping_getx/controller/cart_items.dart';
import 'package:shopping_getx/controller/order_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCont = Get.put(CartItems());
    final orderCont = Get.put(OrderItem());
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1.0,
      ),
      body: GetBuilder<CartItems>(
        builder: (controller) {
          if (controller.cartList.values.toList().isEmpty) {
            return Center(
              child: Text(
                'Empty Cart',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: screenheight * .04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.cartList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          controller.cartList.values.toList()[index].imageUrl,
                      width: screenwidth * 0.2,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 8,
                      ),
                      width: screenwidth * 0.40,
                      // color: Colors.amber,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.cartList.values.toList()[index].title,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Rs.${controller.cartList.values.toList()[index].price.toString()}',
                            style: const TextStyle(fontSize: 15),
                          ),
                          // Text(controller.total.toString()),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 50,
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        controller.cartList.values.toList()[index].qunitiy == 0
                            ? Container()
                            : IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  controller.removeList(
                                    controller.cartList.values
                                        .toList()[index]
                                        .id,
                                    controller.cartList.values
                                        .toList()[index]
                                        .title,
                                    controller.cartList.values
                                        .toList()[index]
                                        .imageUrl,
                                    controller.cartList.values
                                        .toList()[index]
                                        .price,
                                  );
                                },
                              ),
                        // : Container(),
                        Text(
                          controller.cartList.values
                              .toList()[index]
                              .qunitiy
                              .toString(),
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            controller.addList(
                              controller.cartList.values.toList()[index].id,
                              controller.cartList.values.toList()[index].title,
                              controller.cartList.values
                                  .toList()[index]
                                  .imageUrl,
                              controller.cartList.values.toList()[index].price,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: GetBuilder<CartItems>(builder: (controller) {
        return Container(
          height: 100,
          // color: Colors.amber,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Rs.${controller.total.toString()}',
                      style: const TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                // padding: EdgeInsets.all(20),
                height: screenheight * 0.08,
                width: screenwidth,
                child: ElevatedButton(
                  onPressed: controller.cartList.values.toList().isEmpty
                      ? null
                      : () {
                          // Get.snackbar('check', 'order');
                          orderCont.addOrder(
                            controller.cartList.values.toList(),
                            controller.total,
                          );
                          controller.clear();
                          Get.showSnackbar(
                            const GetSnackBar(
                              message: 'order Place!',
                              duration: Duration(seconds: 1),
                              snackStyle: SnackStyle.GROUNDED,
                              overlayBlur: .8,
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade400,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Check Out',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Widget tile(String imageUrl, String title, String qunitiy, Function add) {
  //   return Row(
  //     children: [
  //       Image.network(
  //         imageUrl,
  //         width: 80,
  //         height: 80,
  //       ),
  //       Text(title),
  //       Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           IconButton(
  //             icon: Icon(Icons.minimize),
  //             onPressed: () {},
  //           ),
  //           Text(qunitiy.toString()),
  //           IconButton(
  //             icon: Icon(Icons.add),
  //             onPressed: () {
  //               add();
  //             },
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}


//  return tile(
//                 controller.cartList.values.toList()[index].imageUrl,
//                 controller.cartList.values.toList()[index].title,
//                 controller.cartList.values.toList()[index].qunitiy.toString(),
//                 () {
//                   controller.aaaa(
//                       controller.cartList.values.toList()[index].id,
//                       controller.cartList.values.toList()[index].title,
//                       controller.cartList.values.toList()[index].imageUrl,
//                       controller.cartList.values.toList()[index].price);
//                 },
//               );