import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/controller/product_items.dart';
import 'package:shopping_getx/view/product_detail.dart';
import 'package:shopping_getx/widgets/productItem.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text(
          'Favorite Item',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1.0,
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        height: screenheight * 0.80,
        child: GetBuilder<ProductItems>(
          builder: (controller) {
            if (controller.fav.toList().isEmpty) {
              return Center(
                child: Text(
                  'No Favorite Item',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: screenheight * .04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // controller.aaa(controller.item[index].id);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return ProductDetail(id: controller.item[index].id);
                    // }));
                    Get.to(
                      () => ProductDetail(id: controller.fav[index].id),
                    );
                  },
                  child: ProductItem(
                    item: controller.fav[index],
                  ),
                );
              },
              itemCount: controller.fav.length,
            );
          },
        ),
      ),
    );
  }
}
