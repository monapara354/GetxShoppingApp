import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopping_getx/controller/product_items.dart';
import 'package:shopping_getx/view/product_detail.dart';

import 'package:shopping_getx/widgets/productItem.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var search = '';
  @override
  Widget build(BuildContext context) {
    final cont = Get.put(ProductItems());
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    final primeColor = Colors.orange.shade400;

    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu_sharp,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {},
        // ),
        centerTitle: true,
        title: const Text(
          'Shopping',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Explore',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                  debugPrint(search);
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Search items...',
                  prefixIcon: const Icon(
                    Icons.search,
                    //  color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primeColor),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              height: _height * 0.68,
              child: GetBuilder<ProductItems>(
                builder: (controller) {
                  return GridView.builder(
                    //  shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      if (controller.item[index].title
                          .toString()
                          .toLowerCase()
                          .startsWith(search.toLowerCase())) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetail(
                                  id: controller.item[index].id);
                            }));
                            // Get.to(
                            //   () => ProductDetail(id: controller.item[index].id),
                            // );
                          },
                          child: ProductItem(
                            item: controller.items[index],
                          ),
                        );
                      } else if (search.isEmpty) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProductDetail(
                                  id: controller.item[index].id);
                            }));
                            // Get.to(
                            //   () => ProductDetail(id: controller.item[index].id),
                            // );
                          },
                          child: ProductItem(
                            item: controller.items[index],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                    itemCount: controller.items.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
