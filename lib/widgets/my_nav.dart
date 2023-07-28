import 'package:flutter/material.dart';

import 'package:shopping_getx/view/cart_page.dart';
import 'package:shopping_getx/view/favorite_page.dart';
import 'package:shopping_getx/view/home_page.dart';
import 'package:shopping_getx/view/order_page.dart';

class MyNavbar extends StatefulWidget {
  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  final List _pages = [
    {
      'page': const MyHomePage(),
      'title': 'Home',
      'icon': Icons.home,
    },
    {
      'page': const CartPage(),
      'title': 'Cart',
      'icon': Icons.shopping_cart,
    },
    {
      'page': const FavoritePage(),
      'title': 'Favorite',
      'icon': Icons.favorite,
    },
    {
      'page': const OrderPage(),
      'title': 'Orders',
      'icon': Icons.checklist_outlined,
    }
  ];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[currentIndex]['page'],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * .04),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 50,
              offset: const Offset(10, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                // HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .32
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  // color: Colors.amber,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? displayWidth * .12 : 0,
                    width: index == currentIndex ? displayWidth * .30 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.orange.shade600.withOpacity(.4)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex
                      ? displayWidth * .31
                      : displayWidth * .18,
                  alignment: Alignment.center,
                  //color: Colors.amber,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // color: Colors.red,
                            width:
                                index == currentIndex ? displayWidth * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${_pages[index]['title']}'
                                  : '',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            // color: Colors.black54,
                            width:
                                index == currentIndex ? displayWidth * .03 : 20,
                          ),
                          Icon(
                            _pages[index]['icon'],
                            size: displayWidth * .076,
                            color: index == currentIndex
                                ? Colors.green.shade700
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
