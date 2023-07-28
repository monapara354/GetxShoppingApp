import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/model/product.dart';
import 'package:shopping_getx/view/product_detail.dart';

class ProductItem extends StatelessWidget {
  Product item;
  ProductItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Container(
      // height: 100,
      // width: _width * 0.37,
      // decoration: BoxDecoration(
      //     // color: Colors.amberAccent,
      //     borderRadius: BorderRadius.circular(12),
      //     border: Border.all(color: Colors.black)),
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 0, top: 0),
            width: _width * 0.33,
            height: _height * 0.19,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Hero(
                tag: 'face${item.id}',
                child: CachedNetworkImage(
                  imageUrl: item.imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            width: _width * 0.33,
            height: _height * 0.030,
            //  margin: const EdgeInsets.only(left: 20, right: 20),
            decoration: const BoxDecoration(
                color: Color.fromARGB(96, 82, 82, 82),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 5),
                  child: Text(
                    item.price.toString(),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
